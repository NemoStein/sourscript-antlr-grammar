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

// Numeric list can be created with the Range operator
// The left and right values are included
// The left value can be larger than the right, resulting in a reversed order list
e3 = 0..10
e4 = x .. y
e5 = (z + 1) .. 0

// Function
// Same as lists, arguments can also be separated by commas
// Parentheses are optional for functions with a single argument
f1 = x -> x ** 2
f2 = (x y z) -> x * (y + z)
f3 = (x, y, z) -> { x < y + z }

// Function call
// Note that only identifiers, bare (`func()`) or qualified (`map.func()`, `list[0]()`), can be called
x1 = f1(1 2 3)
x2 = f(1, 2, 3)
x3 = map.func()
x4 = list[0]()

// Map
// The expose operator can be use to construct objects from scopes
g = {
  <: x = 1
  y = 2
  <: y
  <: z = x + y
}

// Scope Block
{
  // Any number of expressions can go inside
  // Last expression is exposed as block expression value
  0
}

// Flow Control

// The curly brace pair is a block, not part of the control expression
// This means that 'hello' is exposed as the if value
h1 = if (a == b) 'hello'
h2 = if (a == b) {
  'hello'
}

// The loop expression type is always `list`
i = loop (x in f as i) {
  // x is the current element
  // i is the index (if looping a list) or key (if looping a map)
  // Also, `i` does not conflit with higher level `i` (the assignment) because of shadowing
  // Finally, both `in` and `as` statements can be omited if it's value isn't needed
}

i1 = loop (f) {}
i2 = loop (x in f) {}
i3 = loop (f as i) {}

// Expose identifier `internal`
// Can be used inside any scope to expose the value to upper scopes
// If used in the top-level scope it exposes the value to other modules
<: internal = 0

// Import all definitions from other file into `external` identifier
// Can be used anywhere in the current file
external = use './external.ss'

localX = external.x // Identifier `x` was exposed by the external file
