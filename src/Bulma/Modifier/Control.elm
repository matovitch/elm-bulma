module Bulma.Modifier.Control exposing (..)

import Html            as H
import Html.Attributes as HA

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
