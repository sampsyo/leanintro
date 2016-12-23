script: sendcode.js
~Pre:
  class=example
[INCLUDE="style"]

# This is a Test

Testing.


    inductive mybool : Type :=
    | tru : mybool
    | fls : mybool

    open mybool

    definition myand : mybool → mybool → mybool
    | tru tru := tru
    | _ _ := fls

    definition mynot : mybool → mybool
    | tru := fls
    | fls := tru

    eval myand tru fls
    eval myand tru tru
    eval mynot (myand fls tru)
