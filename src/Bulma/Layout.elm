module Bulma.Layout exposing (..)

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