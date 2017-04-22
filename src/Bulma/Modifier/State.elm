module Bulma.Modifier.State exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Utils as B_Utils

type State =
    Outlined |
    Loading  |
    Active   |
    Hovered  |
    Focused  |
    Disabled |
    Default

toString : State -> String
toString state =
    case state of
        Outlined -> "is-outlined"
        Loading  -> "is-loading"
        Active   -> "is-active"
        Hovered  -> "is-hovered"
        Focused  -> "is-focused"
        Disabled -> ""
        Default  -> ""


toHA : State -> H.Attribute msg
toHA state =
    case state of
        Disabled -> HA.disabled True
        _        -> HA.class (toString state)

isXtoHAs : Bool -> State -> List (H.Attribute msg)
isXtoHAs isX state = 
    state |> B_Utils.doesExist isX
          |> B_Utils.maybeToList
          |> List.map toHA 