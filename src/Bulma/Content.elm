module Bulma.Content exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Size as B_M_Size

type alias Content msg = 
    {
        size       : B_M_Size.Size,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

content : Content msg
content = 
    {
        size         = B_M_Size.Default,
        attributes   = [],
        content      = []
    }

toHTML : Content msg -> H.Html msg
toHTML ctn =
    H.div
        (
            [ HA.class (B_Element.toString B_Element.Content) ]
            ++
            [ HA.class (B_M_Size.toString ctn.size) ]
            ++
            ctn.attributes
        )
        ctn.content