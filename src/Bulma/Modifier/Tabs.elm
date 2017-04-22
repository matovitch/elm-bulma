module Bulma.Modifier.Tabs exposing (..)

import Html            as H
import Html.Attributes as HA

type Tabs =
    Centered |
    Toggle   |
    Boxed    | 
    Right

toString : Tabs -> String
toString textArea =
    case textArea of
        Centered -> "is-centered"
        Toggle   -> "is-toggle"
        Boxed    -> "is-boxed" 
        Right    -> "is-right"

toHA : Tabs -> H.Attribute msg
toHA = HA.class << toString
