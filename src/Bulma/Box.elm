module Bulma.Box exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

type alias Box msg = 
    {
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

box : Box msg
box = 
    {
        attributes   = [],
        content      = []
    }

toHTML : Box msg -> H.Html msg
toHTML bx =
    H.div
        [ HA.class (B_Element.toString B_Element.Box) ]
        bx.content