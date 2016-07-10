module Index exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- Model

initialModel = {
   entries = [
     newEntry "Seattle" 1,
     newEntry "Portland" 2,
     newEntry "Vancouver" 3,
     newEntry "Eureka" 4
   ]
  }

newEntry text id =
  { text = text,
    id = id
  }
-- Update

type Msg
  = NoOp
  | Delete Int

update msg model =
  case msg of
    NoOp ->
      model

    Delete id ->
      let
        remainingEntries = List.filter (\e -> e.id /= id) model.entries
      in
        { model | entries = remainingEntries }

-- View

pageHeader =
  h1 [ ] [ text "Hello World" ]


pageFooter =
  footer [ ]
    [ hr [ ] [ ],
      a [ href "https://github.com/ivanoats/elm-brunch-starter"]
        [ text "Made with the Elm-Brunch-Starter" ] ]


entryItem entry =
  li [ ]
   [ span [ class "entry" ] [ text entry.text ] ]


entryList entries =
  ul [ ] (List.map entryItem entries)


view model =
  div [ class "container" ]
   [ div [ class "row" ] [ pageHeader,
  --   entryList model.entries,
     pageFooter ] ]


-- main
main =
  App.beginnerProgram
    { model = initialModel,
      view = view,
      update = update
    }
