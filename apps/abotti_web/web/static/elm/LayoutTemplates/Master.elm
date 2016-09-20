module LayoutTemplates.Master exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
view : List (Html a) -> List (Html a)  -> List (Html a) -> Html a  

view left center right =
     div [ class "row" ]
                [ div [ class "col-xs-1" ] left
                , div [ class "col-xs-9" ] center
                , div [ class "col-xs-2" ] right
                ]
