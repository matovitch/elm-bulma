module Bulma.Component.Card exposing (..)

type Card =
    Root        |
    Header      |
    HeaderTitle |
    HeaderIcon  |
    Image       |
    Content     |
    Footer      |
    FooterItem

toString : Card -> String
toString card =
    case card of
        Root        -> "card"
        Header      -> "card-header"
        HeaderTitle -> "card-header-title"
        HeaderIcon  -> "card-header-icon"
        Image       -> "card-image"
        Content     -> "card-content"
        Footer      -> "card-footer"
        FooterItem  -> "card-footer-item"