> The person who respects a person ***because of his wealth***, 2/3 of his religion is gone - Imam Ali SWT
> 
> وَ مَنْ أَتَى غَنِيّاً فَتَوَاضَعَ لَهُ لِغِنَاهُ ذَهَبَ ثُلُثَا دِينِهِ - امام علی ع

# Labeled Types
## Abstract

Labeling types enables you to write a more self-documented code, both easy for you to review in the future and for other people to get the idea behind your algorithm.

it is specially good for `proc`s that have many lines of codes; as it is not much obvious what they are doing exactly...

## Motivation

### scenario 1
assume you're reading someone's code, you come upon something like this:

```nim
var cars: Table[string, bool]
```

wow! what is it? is that a table for (`ownerName` -> `isWrecked`) or (`carName` -> `hasWheels`) ??

### scenario 2

you wanna develop a telegram bot using [telebot](https://github.com/ba0f3/telebot.nim/) for example, you come upon `UpdateCallback` type:

```nim
proc(bot: Telebot, update: Update): Future[bool] 
```

what is `Future[bool]` for? why a `bool`? you can't even guess it without reading the docs [RTFM right? :D]


## Solution
but if you could somehow just **_label your types_**, the code would be a lot more readable!

the `labeledtypes` package enables you to do this:

### scenario 1
```nim
var cars: Table[!(name: string), !(isReady: bool)]
```

### scenario 2
```nim
proc(bot: Telebot, update: Update): !(shouldEndWaiting: Future[bool])
```

## Origin of the Idea
I like the idea of [named return in golang](https://go.dev/tour/basics/7):
```go
func join(paths ...string) (joined_path string)
func split(sum int) (x, y int)
```

## Installation
```
nimble install labeledtypes
# or
nimble install https://github.com/hamidb80/labeledtypes
```

## Usage
See `tests/test.nim`.

## Do not Like the `!` prefix?
see `tests/talternative.nim`.

## Other Solutions
See other comments on this. [it was originally a proposal](https://github.com/nim-lang/RFCs/issues/507).

