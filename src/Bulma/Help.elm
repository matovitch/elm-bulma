module Bulma.Help exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Color as B_M_Color

type alias Help msg = 
    {
        color      : B_M_Color.Color,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

help : Help msg
help = 
    {
        color        = B_M_Color.Default,
        attributes   = [],
        content      = []
    }

toHTML : Help msg -> H.Html msg
toHTML hlp =
    H.p
        (
            [ 
                B_Element.toHA B_Element.Help,
                B_M_Color.toHA hlp.color 
            ] 
            ++
            hlp.attributes
        )
        hlp.content