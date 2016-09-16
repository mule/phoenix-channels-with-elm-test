module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Update exposing (Msg, Model)
import LayoutTemplates.Master as Layout
view : Model -> Html Msg
view model =
    div [class "cointainer-fluid"]  [Layout.view [] [mainView model] [agentBar model]] 

mainView : Model -> Html Msg
mainView model =
    div [ class "main" ] [ text "Main view"]


agentBar : Model -> Html Msg
agentBar model =
    ul [ class "agents" ] [ li [] [text "Appelsiini" ]]





