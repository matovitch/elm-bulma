module Bulma.Layout exposing (..)

import Html            as H
import Html.Attributes as HA

type Layout =
    Container |
    Hero      |
    Section   |
    Footer

toString : Layout -> String
toString layout =
    case layout of
        Container -> "container"
        Hero      -> "hero"
        Section   -> "section"
        Footer    -> "footer"

toHA : Layout -> H.Attribute msg
toHA = HA.class << toString
