module Bulma.Modifier.Color exposing (..)

type Color =
    Primary |
    Info    |
    Success |
    Warning |
    Danger  |
    White   |
    Black   |
    Light   |
    Dark    |
    Link    |
    Default

toString : Color -> String
toString color =
    case color of
            Primary -> "is-primary"
            Info    -> "is-info"
            Success -> "is-success"
            Warning -> "is-warning"
            Danger  -> "is-danger"
            White   -> "is-white" 
            Black   -> "is-black"
            Light   -> "is-light"
            Dark    -> "is-dark"
            Link    -> "is-link"
            Default -> ""
