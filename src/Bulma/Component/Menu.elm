module Bulma.Component.Menu exposing (..)

type Menu =
    Root  |
    Label |
    List

toString : Menu -> String
toString menu =
    case menu of
        Root  -> "menu"
        Label -> "menu-label"
        List  -> "menu-list"