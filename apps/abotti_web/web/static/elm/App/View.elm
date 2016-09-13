module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Update exposing (Msg, Model)

view : Model -> Html Msg
view model =
    div [] [text "Hello from real elm app"]
