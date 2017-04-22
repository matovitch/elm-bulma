module Bulma.Modifier.Icon exposing (..)

import Html            as H
import Html.Attributes as HA

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

toHA : Icon -> H.Attribute msg
toHA = HA.class << toString