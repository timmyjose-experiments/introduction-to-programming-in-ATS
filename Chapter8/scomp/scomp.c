int mystrcmp_c(char *s, char *t)
{
  if (*s < *t) {
    return -1;
  } else if (*s > *t) {
    return 1;
  } else if (*s == '\0') {
    return 0;
  } else {
    return mystrcmp_c(s + 1, t + 1);
  }
}
