module Bulma.Component.Message exposing (..)

type Message =
    Root   |
    Header |
    Body

toString : Message -> String
toString message =
    case message of
        Root   -> "message"
        Header -> "message-header"
        Body   -> "message-body"