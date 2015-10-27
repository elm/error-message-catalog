-- https://github.com/elm-lang/elm-compiler/issues/821

comparePair : comparable -> comparable -> comparable1 -> comparable2 -> Bool
comparePair a b x y =
  a < b || x < y


usage =
  comparePair 1 2 "hi" "blah"