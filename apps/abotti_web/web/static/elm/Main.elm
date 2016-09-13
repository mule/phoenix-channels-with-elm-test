module Main exposing (..)
import Html.App as Html
import App.Update as Update exposing (Model, Msg)
import App.View as View
main : Program Never
main =
    Html.program
        { init = Update.init
        , update = Update.update
        , view = View.view
        , subscriptions = subscriptions
        }

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
                
