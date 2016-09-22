module CounterPair exposing(..)

import Counter

import Html.App

import Html exposing (Html, text)

import Material
import Material.Button as Button
import Material.Options as Options exposing (css, styled, div)
import Material.Typography as Typo

-- MODEL

type alias Model =
    { topCounter : Counter.Model
    , bottomCounter : Counter.Model
    , mdl : Material.Model
      -- Boilerplate: model store for any and all Mdl components you use.
    }


initialModel : Int -> Int -> Model
initialModel top bottom =
    { topCounter = Counter.initialModel top
    , bottomCounter = Counter.initialModel bottom
    , mdl = Material.model
      -- Boilerplate: Always use this initial Mdl model store.
    }


-- UPDATE

type Msg
    = Reset
    | Top Counter.Msg
    | Bottom Counter.Msg
    | Mdl (Material.Msg Msg)
      -- Boilerplate: Msg clause for internal Mdl messages.



updateTop : Counter.Msg -> Model -> (Model, Cmd Msg)
updateTop act model =
  let
    (topUpdate, topCmd) = Counter.update act model.topCounter
  in
    ({model | topCounter = topUpdate}, Cmd.map Top topCmd)

updateBottom : Counter.Msg -> Model -> (Model, Cmd Msg)
updateBottom act model =
  let
    (bottomUpdate, bottomCmd) = Counter.update act model.bottomCounter
  in
    ({model | bottomCounter = bottomUpdate}, Cmd.map Bottom bottomCmd)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Reset ->
      (initialModel 0 0, Cmd.none)

    Top act ->
      updateTop act model

    Bottom act ->
      updateBottom act model

    -- Boilerplate: Mdl action handler.
    Mdl msg' ->
      Material.update msg' model


-- VIEW
type alias Mdl =
  Material.Model

view : Model -> Html Msg
view model =
  div []
    [ Html.App.map Top (Counter.view model.topCounter)
    , Html.App.map Bottom (Counter.view model.bottomCounter)
    , Button.render Mdl [0] model.mdl
        [ Button.onClick Reset ]
        [ text "Reset"]
    ]
