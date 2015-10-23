import Task


floatFail =
  Task.fail 42.0


stringFail =
  Task.fail "something bad happened"


failSequence =
  floatFail `Task.andThen` (\_ -> stringFail)