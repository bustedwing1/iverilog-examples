// memread.c
// MUST BE RUN FROM: sudo ./a.out

#include <stdio.h>    // printf
#include <stdlib.h>   // exit
#include <stdint.h>   // uint32_t
#include <stdbool.h>  // bool
#include <sys/mman.h> // mmap, munmap
#include <fcntl.h>    // O_RDWR|O_SYNC
#include <unistd.h>   // close mem_fd

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41000000
#define CAPE_SIZE 4096

bool handle_args(int argc, char *argv[], uint32_t *block_base, size_t *block_size, char **filename);
uint32_t *setup_io(uint32_t hw_base, size_t nbytes);

int main(int argc, char **argv)
{
  uint32_t  block_base = 0x41030000;
  size_t    block_size = 20;
  char      *filename; // not used

  printf("block_base=0x%x, size=%ld\n", block_base, block_size);

  volatile uint32_t *block_base_addr = setup_io(block_base, block_size);

  uint32_t csr = block_base_addr[1];
  if (csr != 0x00010000) {
    printf("Error: adcfifo is not in reset and should be.\n");
  }
  
  block_base_addr[1] = 0; // de-assert reset. FIFO should filee;
  
  for (int i=0; i<1000; i++);
  
  uint32_t count = block_base_addr[1];
  printf("Count = %d. should be gt 0\n",count);
  
  for (int i=0; i<20; i++) {
    printf("adcfifo[%02d] readback= 0x%08x\n", i, block_base_addr[0]);
  }
  
  munmap((void *)block_base_addr, block_size);
  return 0;
} // main


// ============================================================================

bool handle_args(int argc, char *argv[], uint32_t *block_base, size_t *block_size, char **filename)
{
  bool err = false;
  if (argc < 3) {
    printf("Error. Missing arguments. Example: %s 0x41000000 4096\n\n", argv[0]);
    return true;
  }

  uint32_t base_addr = (uint32_t)strtol(argv[1], NULL, 16);
  if (base_addr == 0) {
    printf("Error. block address must be greater than 0 with hexidecimal format of 0x12345678\n\n");
    return true;
  }
  *block_base = base_addr;

  size_t size = (size_t)strtol(argv[2], NULL, 0);
  if (size == 0) {
    printf("Error. block size must be greater than 0 with decimal format of 4096\n\n");
    return true;
  }
  *block_size = size;
  *filename = NULL; //argv[3];
  return false;
}

// ============================================================================

// Set up memory map region
uint32_t *setup_io(uint32_t hw_base, size_t nbytes)
{
  int fd = open("/dev/mem", O_RDWR|O_SYNC);
  if (fd < 0) {
    printf("Error. Could not open /dev/mem. Try running with 'sudo'. \n");
    exit(-1);
  }

  void *mmem_base = mmap(NULL, nbytes, PROT_READ|PROT_WRITE, MAP_SHARED, fd, hw_base);

  close(fd);
  if (mmem_base == MAP_FAILED) {
    printf("Error: mmap failed\n");
    exit(-1);
  }
  return (uint32_t *)mmem_base;
} // setup_io

