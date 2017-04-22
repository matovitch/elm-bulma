module Bulma.Modifier.Control exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Utils as B_Utils

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

toHA : Control -> H.Attribute msg
toHA = HA.class << toString

isXtoHAs : Bool -> Control -> List (H.Attribute msg)
isXtoHAs isX control = 
    control |> B_Utils.doesExist isX
            |> B_Utils.maybeToList
            |> List.map toHA 