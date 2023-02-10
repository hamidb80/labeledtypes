from labeledtypes import nil
import std/unittest

template `!!`(a): untyped =
   labeledtypes.`!`(a)

test "alternative operator":
  type Test = !!(name: string)
  check Test is string