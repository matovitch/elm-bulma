module Bulma.Modifier.Icon exposing (..)

type Icon =
    Left    |
    Right   |
    Default

toString : Icon -> String
toString icon =
    case icon of
        Left    -> "is-left"
        Right   -> "is-right"
        Default -> ""