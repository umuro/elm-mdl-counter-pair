module Counter exposing(Model, initialModel, Msg, update, view)

import Html exposing (Html, text)
-- import Html.Attributes exposing (href, class, style)
-- import Html.Events exposing (onClick)

import Material
import Material.Button as Button
import Material.Options as Options exposing (css, styled, div)
import Material.Typography as Typo

-- MODEL

type alias Model =
  { count : Int
  , mdl : Material.Model
      -- Boilerplate: model store for any and all Mdl components you use.
  }

initialModel : Int -> Model
initialModel value =
  { count = value
  , mdl = Material.model
      -- Boilerplate: Always use this initial Mdl model store.
  }

-- ACTION, UPDATE

type Msg
  = Increment
  | Decrement
  | Hello
  | Mdl (Material.Msg Msg)
    -- Boilerplate: Msg clause for internal Mdl messages.

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ( { model | count = model.count + 1 }
      , Cmd.none
      )

    Decrement ->
      ( { model | count = model.count - 1 }
      , Cmd.none
      )

    Hello ->
      ( { model | count = model.count + 100 }
      , Cmd.none
      )

    -- Boilerplate: Mdl action handler.
    Mdl msg' ->
      Material.update msg' model

-- VIEW

type alias Mdl =
  Material.Model

view : Model -> Html Msg
view model =
  div
    [  ]
    [ Button.render Mdl [0] model.mdl
          [ Button.onClick Decrement
          , css "margin" "0 24px"
          ]
          [ text "Decrement" ]
      , Options.div
          [ Typo.title
          , css "font-family" "monospace"
          , css "display" "inline-block"
          , css "width" "50px"
          , Options.center
          ]
          [ text (toString model.count ) ]
      , Button.render Mdl [1] model.mdl
          [ Button.onClick Increment
          , css "margin" "0 24px"
          ]
          [ text "Increment" ]
      , Button.render Mdl [2] model.mdl
          [ Button.onClick Hello
          , css "margin" "0 24px"
          ]
          [ text "Hello" ]
    ]
