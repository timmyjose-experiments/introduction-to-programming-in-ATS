int fact2_in_c(int n, int acc)
{
  if (n <= 0) {
    return acc;
  }
  return fact2_in_c(n - 1, acc * n);
}
