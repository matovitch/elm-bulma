module Bulma.Modifier.Control exposing (..)

type Control =
    IconLeft |
    IconRight

toString : Control -> String
toString control =
    case control of
        IconLeft  -> "has-icons-left"
        IconRight -> "has-icons-right"