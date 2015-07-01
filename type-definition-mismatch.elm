import Graphics.Collage exposing (..)

ngon2 : Float -> Int -> Shape
ngon2 f r =
  let
    n = truncate f
  in
    ngon n r

