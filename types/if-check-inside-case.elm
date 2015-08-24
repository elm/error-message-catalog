type alias Model =
  { field : Maybe String
  }

type Action
  = MouseEnter
  | MouseMove

update : Action -> Model -> Model
update action model =
  case action of
    MouseEnter ->
      if model.field == Just 3 then
        { model | field <- Just 0
                }
      else
        model
    MouseMove ->
      if model.field == Just "string"
      then
        model
      else
        model
