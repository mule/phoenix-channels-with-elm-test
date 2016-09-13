module App.Update exposing (init, update,Msg, Model)

type Msg
    = NotificationsReceived

type alias Model =
    {}

emptyModel : Model

emptyModel =
    {}

init : (Model, Cmd Msg)
init =
    emptyModel ! []

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        _ ->
            model ! []



