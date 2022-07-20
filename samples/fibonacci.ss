<: fibonacci = n -> {
  if (n < 1) exit 0
  if (n == 1) exit 1

  fibonacci(n - 1) + fibonacci(n - 2)
}
