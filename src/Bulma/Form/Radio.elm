module Bulma.Form.Radio exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import List

type alias Radio msg =
    {
        name       : String,
        attributes : List (H.Attribute msg),
        contents   : List (List (H.Html msg))
    } 

radio : Radio msg
radio = 
    {
        name         = "",
        attributes   = [],
        contents     = [[]]
    }

contentToHTML: Radio msg -> List (H.Html msg) -> H.Html msg
contentToHTML rdo content =
    H.label
        [ HA.class (B_Element.toString B_Element.Radio) ] 
        (
            [
                H.input
                    (
                        [ HA.type_ (B_Element.toString B_Element.Radio) ]
                        ++
                        [ HA.name rdo.name ]
                        ++
                        rdo.attributes
                    )
                    []
            ]
            ++
            content
        )

toHTML : Radio msg -> List (H.Html msg)
toHTML rdo = 
    List.map (contentToHTML rdo) rdo.contents