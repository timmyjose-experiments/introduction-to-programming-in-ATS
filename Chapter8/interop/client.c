#include <stdio.h>

extern int add(int, int);
extern int subtract(int, int);
extern int multiply(int, int);
extern int divide(int, int);

int main(int argc, char *argv[])
{
  int x, y;
  scanf("%d%d", &x, &y);

  printf("Sum of %d and %d = %d\n", x, y, add(x, y));
  printf("Difference of %d and %d = %d\n", x, y, subtract(x, y));
  printf("Product of %d and %d = %d\n", x, y, multiply(x, y));
  printf("Quotient of %d and %d = %d\n", x, y, divide(x, y));

  return 0;
}