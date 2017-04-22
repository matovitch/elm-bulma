module Bulma.Modifier.Size exposing (..)

import Html            as H
import Html.Attributes as HA

type Size =
    Small  |
    Medium |
    Large  |
    Normal |
    Default

toString : Size -> String
toString size =
    case size of
        Small   -> "is-small"
        Medium  -> "is-medium"
        Large   -> "is-large"
        Normal  -> "is-normal"
        Default -> ""

toHA : Size -> H.Attribute msg
toHA = HA.class << toString