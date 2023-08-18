import std/macros


macro `!`*(namedTuple): untyped =
  ## converts to tuple if fields are more than 1
  ##
  ## `!(age: int)` => `int`
  ## `!(name: string, age: int)` => `tuple[name:string, age: int]`

  expectKind namedTuple, nnkTupleConstr

  case namedTuple.len
  of 0:
    raise newException(AssertionDefect, "cannot create empty tuple")
  of 1:
    namedTuple[0][1]
  else:
    var temp = newNimNode(nnkTupleTy)

    for pair in namedTuple:
      temp.add newIdentDefs(pair[0], pair[1])

    temp

template `!:`*(a, b): untyped = 
  ## Usage: `name !: string` => `string`
  ## Example: `Table[label !: string, age !: int]
  b

template `!>`*(index, typee): untyped =
  ## `(index: int) !> (name: string)` => `string`
  ##
  ## can be used in sequences like:
  ##
  ## `seq[(index: int) !> (name: string)]` => `seq[string]`
  !typee
