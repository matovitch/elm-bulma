module Bulma.Component.Level exposing (..)

type Level =
    Root |
    Left |
    Right|
    Item

toString : Level -> String
toString level =
    case level of
        Root  -> "level"
        Left  -> "level-left"
        Right -> "level-right"
        Item  -> "level-item"