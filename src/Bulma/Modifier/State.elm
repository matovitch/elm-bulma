module Bulma.Modifier.State exposing (..)

type State =
    Outlined |
    Loading  |
    Active   |
    Disabled |
    Default

toString : State -> String
toString state =
    case state of
        Outlined -> "is-outlined"
        Loading  -> "is-loading"
        Active   -> "is-active"
        Disabled -> ""
        Default  -> ""