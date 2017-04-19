module Bulma.Component.Modal exposing (..)

type Modal =
    Root       |
    Background |
    Content    |
    Close      |
    Card       |
    CardTitle  |
    CardBody   |
    CardHead   |
    CardFoot

toString : Modal -> String
toString modal =
    case modal of
        Root       -> "modal"
        Background -> "modal-background"
        Content    -> "modal-content"
        Close      -> "modal-close"
        Card       -> "modal-card"
        CardTitle  -> "modal-card-title"
        CardBody   -> "modal-card-body"
        CardHead   -> "modal-card-head"
        CardFoot   -> "modal-card-foot"