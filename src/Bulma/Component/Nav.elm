module Bulma.Component.Nav exposing (..)

type Nav =
    Root   |
    Left   |
    Center |
    Right  |
    Item   |
    Toggle |
    Menu

toString : Nav -> String
toString nav =
    case nav of
        Root   -> "nav"
        Left   -> "nav-left"
        Center -> "nav-center"
        Right  -> "nav-right"
        Item   -> "nav-item"
        Toggle -> "nav-toggle"
        Menu   -> "nav-menu"