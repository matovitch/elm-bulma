module Bulma.Modifier.Columns exposing (..)

import Html            as H
import Html.Attributes as HA

type Columns =
    Gapless   |
    Multiline |
    Mobile    |
    Desktop

toString : Columns -> String
toString columns =
    case columns of
        Gapless   -> "is-gapless"
        Multiline -> "is-multiline"
        Mobile    -> "is-mobile"
        Desktop   -> "is-desktop"

toHA : Columns -> H.Attribute msg
toHA = HA.class << toString
