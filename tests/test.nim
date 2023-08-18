import std/unittest
import labeledtypes

type
  Test1 = !(name: string)
  Test2 = !(name: string, age: int)
  Test3 = !(name: string, age: int, weight: float)

  Test4 = name !: string

suite "!":
  test "0 fields":
    check not compiles !()

  test "1 field":
    check Test1 is string

  test "2 fields":
    check Test2 is tuple[name: string, age: int]

  test "3 fields":
    check Test3 is tuple[name: string, age: int, weight: float]

suite "!>":
  test "0":
    check string is (int !> (name: string))

suite "!:":
  test "name !: stirng":
    check string is Test4

  test "as return type":
    proc localfn(a: int): hex !: string =
      '#' & $a

    check localFn(2) == "#2"
    check localFn(2) is string
