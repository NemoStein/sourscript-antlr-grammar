<: fizzbuzz = (limit) -> {
  output = loop (i in limit) {
    j = i + 1
    by3 = j % 3 == 0
    by5 = j % 5 == 0

    if (by3 && by5) 'FizzBuzz'
    else if (by3) 'Fizz'
    else if (by5) 'Buzz'
    else j
  }

  output // [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz', 16 ...]
}
