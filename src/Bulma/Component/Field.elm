module Bulma.Component.Field exposing (..)

import Html            as H
import Html.Attributes as HA

type Field =
    Root  |
    Label |
    Body

toString : Field -> String
toString field =
    case field of
        Root  -> "field"
        Label -> "field-label"
        Body  -> "field-body"

toHA : Field -> H.Attribute msg
toHA = HA.class << toString