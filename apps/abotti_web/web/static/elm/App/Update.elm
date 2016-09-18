module App.Update exposing (init, update,Msg(..), Model)
import Phoenix.Socket
import Phoenix.Channel
import Phoenix.Push
import Json.Encode as JE
import Update.Extra exposing (andThen)

type Msg
    = NotificationsReceived
    | JoinChannel
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
    | ReceiveHeartbeats JE.Value

type alias Model =
    { phxSocket : Phoenix.Socket.Socket Msg
    }

emptyModel : Model

emptyModel =
    { phxSocket = initPhxSocket
    }

init : (Model, Cmd Msg)
init =
    emptyModel ! []
    |> andThen update JoinChannel

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        JoinChannel ->
            let
                channel =
                    Phoenix.Channel.init "heartbeats:lobby"
                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.join channel model.phxSocket
            in
                 ( { model | phxSocket = phxSocket }
                , Cmd.map PhoenixMsg phxCmd
                )
        _ ->
            model ! []


socketServer : String
socketServer =
    "ws://localhost:4000/socket/websocket"

initPhxSocket : Phoenix.Socket.Socket Msg
initPhxSocket =
    Phoenix.Socket.init socketServer
        |> Phoenix.Socket.withDebug
        |> Phoenix.Socket.on "new:msg" "heartbeats:lobby" ReceiveHeartbeats

