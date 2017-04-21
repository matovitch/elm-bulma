module Bulma.Component.Field exposing (..)

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