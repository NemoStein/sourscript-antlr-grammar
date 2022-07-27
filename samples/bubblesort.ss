<: bubblesort = list -> {
  loop (i in list) {
    loop (j in [0..(list.length - i - 1)]) {
      if (list[i] > list[i + 1]) {
        swap = list[i]
        list[i] = list[i + 1]
        list[i + 1] = swap
      }
    }
  }
}
