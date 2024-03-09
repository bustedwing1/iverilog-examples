// blinky.c
// MUST BE RUN FROM SUDO ./A.OUT
//

// THIS IS THE BASE ADDRESS OF THE CAPE
#define CAPE_BASE 0x41000000

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_SIZE (4*1024)
#define BLOCK_SIZE (4*1024)

int  mem_fd;    // used only in setup_io
void *cape_map; // used only in setup_io
volatile unsigned *cape_starting_addr; // set in setup_io

void setup_io();

int main(int argc, char **argv)
{

  printf("Start of main\n");

  // Set up gpi pointer for direct register access
  setup_io();


  // WRITE TO CAPE's apb_blinky
  // ONLY OFFSET 1 IS WRITABLE. EACH UNSIGNED IS 4 BYTES, SO IT'S REALLY
  // BYTE OFFSET 4 IN THE VERILOG.

  for (int ii=0;ii < 8; ii++) {
    cape_starting_addr[ii] = ii + 0x12345600;
  }

  // READ FROM CAPE'S APB_BLINKY
  // EXPECT TO SEE:
  //   OFFSET[0] = 0X44444444
  //   OFFSET[1] = 0X12345601 -- THIS IS THE ONLY WRITABLE REGISTER IN APB_BLINKY
  //   OFFSET[2] = 0X88888888
  //   OFFSET[3] = 0XCCCCCCCC
  //   OTHERS    = 0X11223344
  for (int ii=0;ii < 8; ii++) {
    printf("cape_starting_addr[%d]=0x%x\n", ii, cape_starting_addr[ii]);
  }

  // MAKE IT BLINK

  unsigned blink_rate = 500000;  // this is a very fast flickering LED
  int n;
  printf("Enter blink speed. 0=off. 100=slow. 'q' to quit> ");
  while (scanf("%d", &n) > 0) {
    cape_starting_addr[1] = blink_rate*(unsigned)n;
    printf("blink_rate read back from CAPE=%i\n", cape_starting_addr[1]);
    printf("Enter blink speed. 0=off. 100=slow. 'q' to quit> ");
  }

  printf("End of main\n");

  return 0;
} // main

// ============================================================================

// Set up CAPE memory region
void setup_io()
{
  printf("Start of setup_io\n");
  /* open /dev/mem */
  if ((mem_fd = open("/dev/mem", O_RDWR|O_SYNC) ) < 0) {
    printf("Error. Could not open /dev/mem. Try running with 'sudo'. \n");
    exit(-1);
  }

  /* mmap cape */
  cape_map = mmap(
    NULL,             //Any adddress in our space will do
    BLOCK_SIZE,       //Map length
    PROT_READ|PROT_WRITE,// Enable reading & writing to mapped memory
    MAP_SHARED,       //Shared with other processes
    mem_fd,           //File to map
    CAPE_BASE         //Offset to CAPE peripheral
  );

  close(mem_fd); //No need to keep mem_fd open after mmap
   if (cape_map == MAP_FAILED) {
     printf("mmap error\n"); 
     exit(-1);
  }

  // Always use volatile pointer!
  cape_starting_addr = (volatile unsigned *)cape_map;
  printf("End of setup_io\n");
} // setup_io

