module Bulma.Modifier.Table exposing (..)

import Html            as H
import Html.Attributes as HA

type Table =
    Bordered |
    Striped  |
    Narrow

toString : Table -> String
toString table =
    case table of
        Bordered -> "is-bordered"
        Striped  -> "is-striped"
        Narrow   -> "is-narrow"

toHA : Table -> H.Attribute msg
toHA = HA.class << toString