module Bulma.Icon exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Size  as B_M_Size
import Bulma.Modifier.Icon  as B_M_Icon

import Bulma.Utils as B_Utils

import String exposing (isEmpty)

type alias Icon msg = 
    {
        name       : String,
        size       : B_M_Size.Size,
        modifier   : B_M_Icon.Icon,
        attributes : List (H.Attribute msg)
    }

icon : Icon msg
icon = 
    {
        name       = "",
        size       = B_M_Size.Default,
        modifier   = B_M_Icon.Default,
        attributes = []
    }

toHTML : Icon msg -> H.Html msg
toHTML icn =
    H.span
        (
            [
                B_Element.toHA B_Element.Icon,
                B_M_Icon.toHA  icn.modifier,
                B_M_Size.toHA  icn.size
            ] 
            ++ 
            icn.attributes
        )
        [ 
            H.i 
                [ HA.class ("fa fa-" ++ icn.name) ]
                []  
        ]

maybeToHTMLs : Maybe (Icon msg) -> List (H.Html msg)
maybeToHTMLs = B_Utils.maybeToList >> List.map toHTML
