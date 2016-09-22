import Html.App as App
import Material.Scheme

import CounterPair exposing(Model, initialModel, Msg, update, view)

main: Program Never
main =
  App.program
    { init = ( initialModel 0 0, Cmd.none )
    , view = mainView
    , subscriptions = always Sub.none
    , update = update
    }

mainView model =
  view model
  |> Material.Scheme.top
