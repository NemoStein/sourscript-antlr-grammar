# Sourscript
Toy lang for game embedding

## Constraints

- Constant assignments
  * Identifiers can't be reassigned
  * Type infered from assignment
- Block delimited
  * Everything is an expression
- Locally scoped
  * Identifier don't pollute higher scopes

## Syntax

> See `./samples` folder for examples

The `./samples/syntax.ss` file contains a good reference of how to do basic things in Sourscript

### Flow Control
  - if
    * `if ($comparison) $expression`
    * `if ($comparison) $expression else $expression`
  - loop
    * Iterate lists `loop ($iterable) $expression`
    * Iterate getting the current value `loop ($value in $iterable) $expression`
    * Iterate getting the current index `loop ($iterable as $key) $expression`
    * Getting both `loop ($value in $iterable as $key) $expression`
    * `$iterable` may be a `number`, `list` or a identifier for a value of the aforementioned types
    * When `list` is passed to the loop it will iterate the `list` values
    * When `number` is passed it will iterate the value times
  - skip
    * Skips the current loop iteration, returning flow control to loop expression
    * Invalid anywhere except loops execution expression
  - exit
    * Stops the scope execution, returning flow control to upper scope
    * Inside loops execution expression it stops the loop altogether
    * Invalid in top-level scopes

### Operator
  - expose
    * Exposes identifiers to higher scopes
    * `<: $identifier`
    * `<: $identifier = $expression`
    * Scopes containing the expose operator don't return the last expression as value
  - use
    * Import identifiers form external file
    * `$identifier = use $string`

### Types

#### Primitives
  - boolean
    * `true`
    * `false`
  - number
    * Integer or floating `42`, `3.14`
    * Positive or negative `0.3`, `-10`
    * Decimal/scientific notaion `3e4`
    * Hexadecimal `0xff`
    * Binary `0b0110`
  - string
    * Any length (empty, single character or more)
    * Single or double quoted `'hello'` `"world"`
  - void
    * Represents `null`
    * Returned by empty blocks
    * Possible placeholder for failures

#### First Class
  - function
    * `($identifiers) -> $expression`
    * Commas between arguments are optional
  - list
    * `[$expression]`
    * Commas between entries are optional
  - map
    * Usage of expose operator and blocks can be used to create objects
    * `{ <: x = 0 }`

## Testing Samples

Antlr4 was used to write the initial language grammar while a proper parser is written.

Run `npm run build` to build the antlr java parser

The `./samples/syntax.ss` can be tested with `npm test`

Note that both `antlr4` and `grun` must be on path!  
See [Antlr4 docs](https://www.antlr.org/) to know how to set up your environment.
