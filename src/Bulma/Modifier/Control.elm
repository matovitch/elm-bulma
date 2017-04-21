module Bulma.Modifier.Control exposing (..)

type Control =
    IconsLeft  |
    IconsRight |
    Expanded

toString : Control -> String
toString control =
    case control of
        IconsLeft  -> "has-icons-left"
        IconsRight -> "has-icons-right"
        Expanded   -> "is-expanded"