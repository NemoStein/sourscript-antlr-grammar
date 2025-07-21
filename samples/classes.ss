// Sourscript doesn't have actual classes and inheritance
// But it's possible to have objects with methods

// Animal is a function that returns a scope "object" (map)
// Maps can have any number of exposed identifiers, including functions
Animal = () -> {
  <: alive = true
  <: eat = () -> ''
}

// With scope concatenation it is possible to "merge" identifiers of multiple scopes
Canine = () Animal() + { <: wild = true }

Dog = () -> Canine() + {
  <: wild = false
  <: say = () -> 'woof'
}

dog = Dog()
dog.say() // "woof"