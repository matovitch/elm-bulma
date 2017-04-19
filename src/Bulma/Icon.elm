module Bulma.Icon exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Size  as B_M_Size
import Bulma.Modifier.Icon  as B_M_Icon

import String exposing (isEmpty)

type alias Icon msg = 
    {
        name       : String,
        size       : B_M_Size.Size,
        modifier   : B_M_Icon.Icon,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

icon : Icon msg
icon = 
    {
        name       = "",
        size       = B_M_Size.Default,
        modifier   = B_M_Icon.Default,
        attributes = [],
        content    = []
    }

toHTML : Icon msg -> H.Html msg
toHTML icn =
    H.span
        (
            [
                HA.class (B_Element.toString B_Element.Icon),
                HA.class (B_M_Icon.toString  icn.modifier  ),
                HA.class (B_M_Size.toString  icn.size      )
            ] 
            ++ 
            icn.attributes
        )
        [ 
            H.i 
                [ HA.class ("fa fa-" ++ icn.name) ]
                icn.content  
        ]
