module Bulma.Modifier.Title exposing (..)

import Html            as H
import Html.Attributes as HA

type Title =
    Is1 |
    Is2 |
    Is3 |
    Is4 |
    Is5 |
    Is6

toString : Title -> String
toString title =
    case title of
        Is1 -> "is-1"
        Is2 -> "is-2"
        Is3 -> "is-3"
        Is4 -> "is-4"
        Is5 -> "is-5"
        Is6 -> "is-6"

toHA : Title -> H.Attribute msg
toHA = HA.class << toString
