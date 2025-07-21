// Line coments
/* Block comments */

// Identifier assignment

a = true // Boolean
b = 1 // Number
c = 'string' // String
d = void // Void

// List, can have any internal value
// Optionally, entries can be separated by commas
// Actually, commas are considered whitespace, so they are valid anywhere a space, tab or new line is valid
e1 = [0 false '']
e2 = [0, false, '']

// Range
// Numeric list can be created with the range operator
// The left and right values are included
// The left value can be larger than the right, resulting in a reversed order list
e3 = [0..10]
e4 = [x .. y]
e5 = [(z + 1) .. 0]
e6 = [0..5 10..20 50..100]

// Scope Block
// Anything declared inside this container won't be accessible outside
block = {
  // Any number of expressions can go inside
  // Last expression is exposed as block expression value
  0
}

// Concat Scopes
concat = {
  <: a = 1
} + {
  <: b = 2
}
// concat.a == 1
// concat.b == 2

blockA = { <: a = 1 }
blockB = { <: b = 2 }
blockC = a + b
// blockC.a == 1
// blockC.b == 2

// Function
// Same as lists, arguments can also be separated by commas
// Parentheses are optional for functions with a single argument
f1 = x -> x ** 2
f2 = (x y z) -> x * (y + z)
f3 = (x, y, z) -> { x < y + z }

// The exit statement can be used to return early from a function
// The next expression after the `exit` keyword will be used as return value
f4 = (x, y, z) -> if (x < y) exit z

// The void primitive can be used to signal an empty result
f5 = (x, y, z) -> {
  if (x != y) {
    exit void
  }

  z
}

// Function call
// Note that only identifiers, bare (`func()`) or qualified (`map.func()`, `list[0]()`), can be called
x1 = f1(1 2 3)
x2 = f(1, 2, 3)
x3 = map.func()
x4 = list[0]()

// (Hash)Map / Dictionary
// The `expose` operator can be use to construct objects from scope blocks
g = {
  <: x = 1
  y = 2
  <: y
  <: z = x + y
}

// Flow Control

// The curly brace pair is a block expression, not part of the control expression
// This means that 'hello' is exposed as the if value
h1 = if (a == b) 'hello'
h2 = if (a == b) {
  'hello'
}
h3 = if (a == b) 'hello' else 'bye'

// The loop expression type is always `list`
i = loop (i in f as x) {
  // x is the current element
  // i is the index (if looping a list) or key (if looping a map)
  // Also, local `i` (`i in ...`) does not conflit with higher level `i` (`i = loop (...)`) because of shadowing
  // Finally, both `in` and `as` statements can be omited if it's value isn't needed
}

i1 = loop (f) {}
i2 = loop (i in f) {}
i3 = loop (f as x) {}

// Skip
// Inside loop execution expression the `skip` and `skip all` statements can be used to skip the current or all iterations, respectively
i4 = loop (index in list as value) {
  // skip even numbers
  if (value % 2 == 0) skip

  // skip everything after the 10th element
  if (index == 10) skip all

  value
}

// Expose identifier `internal`
// Can be used inside any scope to expose the value to upper scopes
// If used in the top-level scope it exposes the value to other modules
<: internal = 0

// Import all definitions from other file into `external` identifier
// Can be used anywhere in the current file
external = use './external.ss'

localX = external.x // Identifier `x` was exposed by the external file
