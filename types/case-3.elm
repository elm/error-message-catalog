
type Primary
    = Red
    | Green
    | Blue


mixedUpCaseBranches primary =
  case primary of
    Red ->
        "red"

    Green ->
        "green"

    Blue ->
        False