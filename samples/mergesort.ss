Math = use 'ss:Math'
Collections = use 'ss:Collections'

<: mergesort = list -> {
  from = 0
  to = list.size
  work = list.slice(from to)

  split(work from to list)
}

split = (list from to work) -> {
  if (to - from <= 1) exit

  half = Math.floor((to + from) / 2)

  split(work from half list)
  split(work half to list)

  merge(list from half to work)
}

merge = (list from half to work) -> {
  i = Collections.Pointer(list from)
  j = Collections.Pointer(list half)

  loop ([from..to] as k) {
    work[k] = (i < half && (j >= to || list[i] <= list[j]))
      ? i.next()
      : j.next()
  }

  work
}
