module Bulma.Component.Tabs exposing (..)

import Html            as H
import Html.Attributes as HA

type Tabs =
    Root

toString : Tabs -> String
toString tabs = "tabs"

toHA : Tabs -> H.Attribute msg
toHA = HA.class << toString