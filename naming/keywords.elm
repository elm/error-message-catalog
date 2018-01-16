import Html exposing (text)

main =
  let (x, y, _) = List.foldL (\elem (sum, diff, mult) ->
      (sum + elem, elem - diff, mult * elem)
    ) (0, 0, 0) [1, 2, 3, 4, 5] in
  text ("Hello, World!" ++ toString x)
