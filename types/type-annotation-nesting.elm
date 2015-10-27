
filter : (a -> Bool) -> List a -> List a
filter isOkay list =
  let
    keepIfOkay : a -> Maybe a
    keepIfOkay x =
      if isOkay x then Just x else Nothing
  in
    List.filterMap keepIfOkay list

