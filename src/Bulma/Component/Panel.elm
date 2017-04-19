module Bulma.Component.Panel exposing (..)

type Panel = 
    Root    |
    Heading |
    Tabs    |
    Block   |
    Icon

toString : Panel -> String
toString panel =
    case panel of
        Root    -> "panel"
        Heading -> "panel-heading"
        Tabs    -> "panel-tabs"
        Block   -> "panel-block"
        Icon    -> "panel-icon"