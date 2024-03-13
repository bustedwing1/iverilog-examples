// blinky2.c
// MUST BE RUN FROM SUDO ./A.OUT
//

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
//   uint32_t  block_base;
//   size_t    block_size;
//   char      *filename;
//
//   bool err = handle_args(argc, argv, &block_base, &block_size, &filename);
//   if (err) exit(1);
//
//   FILE* fileptr = fopen(argv[3], "r");
//   if (fileptr == NULL) {
//     printf("Error: could not open input data filename: '%s'\n", filename);
//     exit(1);
//   }
//
//   printf("block_base=0x%x, size=%ld, filename='%s'\n", block_base, block_size, filename);

  volatile uint32_t *virtual_base_addr = setup_io(CAPE_BASE, CAPE_SIZE);
  for (int ii=0;ii < 8; ii++) {
    virtual_base_addr[ii] = ii + 0x12345600;
  }

//   printf("block_base=0x%x, size=%ld, filename='%s'\n", block_base, block_size, filename);  
// READ FROM CAPE'S APB_BLINKY
  // EXPECT TO SEE:
  //   OFFSET[0] = 0X44444444
  //   OFFSET[1] = 0X12345601 -- THIS IS THE ONLY WRITABLE REGISTER IN APB_BLINKY
  //   OFFSET[2] = 0X88888888
  //   OFFSET[3] = 0XCCCCCCCC
  //   OTHERS    = 0X11223344
  for (int ii=0;ii < 8; ii++) {
    printf("virtual_base_addr[%d]=0x%x\n", ii, virtual_base_addr[ii]);
  }

  // MAKE IT BLINK

  uint32_t blink_rate = 500000;  // this is a very fast flickering LED
  int n;
  printf("Enter blink speed. 0=off. 100=slow. 'q' to quit> ");
  while (scanf("%d", &n) > 0) {
    virtual_base_addr[1] = blink_rate*(uint32_t)n;
    printf("blink_rate read back from CAPE=%i\n", virtual_base_addr[1]);
    printf("Enter blink speed. 0=off. 100=slow. 'q' to quit> ");
  }
  
  munmap((void *)virtual_base_addr, CAPE_SIZE);

  printf("End of main 123\n");

  return 0;
} // main


// ============================================================================

bool handle_args(int argc, char *argv[], uint32_t *block_base, size_t *block_size, char **filename)
{
  bool err = false;
  if (argc < 4) {
    printf("Error. Missing arguments. Example: %s 0x41000000 4096 blinky.hex\n\n", argv[0]);
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
  *filename = argv[3];
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

