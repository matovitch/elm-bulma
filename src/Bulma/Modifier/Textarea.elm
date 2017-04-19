module Bulma.Modifier.Textarea exposing (..)

type Textarea =
    Hovered |
    Focused

toString : Textarea -> String
toString textArea =
    case textArea of
        Hovered -> "is-hovered"
        Focused -> "is-focused"