module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Update exposing (Msg, Model)
import LayoutTemplates.Master as Layout
import Phoenix.Socket
import Phoenix.Channel
import Phoenix.Push

view : Model -> Html Msg
view model =
    let right =
            agentBar model.heartbeats
        center =
            mainView model
    in
        div [class "cointainer-fluid"]  [Layout.view [] [center] [right]] 

mainView : Model -> Html Msg
mainView model =
    div [ class "main" ] [ text "Main view"]

agentBar : List (String, Int) -> Html Msg
agentBar heartbeats =
       heartbeats |> List.map (uncurry agentListItem) |> ul [ class "agents" ]  

agentListItem : String -> Int -> Html Msg
agentListItem agentName heartbeat =
    li [] [
         span [] [text agentName],
         span [] [heartbeat |> toString |> text]
        ]


