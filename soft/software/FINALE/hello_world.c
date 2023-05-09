#include <stdio.h>
#include <system.h>
#include <altera_avalon_pio_regs.h>
#include <unistd.h>

// A union makes the variable accessible to both the software and the hardware.
union ufloat {
  float f;
  unsigned u;
};

int main()
{
  union ufloat x, y;

  printf("Enter a real number: ");
  scanf("%f", &x.f);

  // For example, if x.f is 3.14159265358979 (pi),
  // x.u will be 1078530011, or 0b01000000010010010000111111011011,
  // pi's IEEE-754 single-precision floating-point representation.

  IOWR_ALTERA_AVALON_PIO_DATA(SIN_HW_BASE, x.u);
  IOWR_ALTERA_AVALON_PIO_DATA(COS_HW_BASE, x.u);
  IOWR_ALTERA_AVALON_PIO_DATA(TAN_HW_BASE, x.u);

  y.u = IORD_ALTERA_AVALON_PIO_DATA(SIN_HW_BASE);
  printf("Sine of %f is %f\n", x.f, y.f);
  y.u = IORD_ALTERA_AVALON_PIO_DATA(COS_HW_BASE);
  printf("Cosine of %f is %f\n", x.f, y.f);
  y.u = IORD_ALTERA_AVALON_PIO_DATA(TAN_HW_BASE);
  printf("Tangent of %f is %f", x.f, y.f);

  return 0;
}
