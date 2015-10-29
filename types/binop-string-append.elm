-- inspired by https://github.com/elm-lang/error-message-catalog/issues/38
-- which requested a hint when you try to use (+) to append strings.

foo repo =
  "Name: " + repo.name