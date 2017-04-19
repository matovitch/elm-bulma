module Bulma.Content exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

type alias Content msg = 
    {
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

content : Content msg
content = 
    {
        attributes   = [],
        content      = []
    }

toHTML : Content msg -> H.Html msg
toHTML ctn =
    H.div
        (
            [ HA.class (B_Element.toString B_Element.Content) ]
            ++
            ctn.attributes
        )
        ctn.content