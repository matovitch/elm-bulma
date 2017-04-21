module Bulma.Form.Checkbox exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

type alias Checkbox msg = 
    {
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

checkbox : Checkbox msg
checkbox = 
    {
        attributes   = [],
        content      = []
    }

toHTML : Checkbox msg -> H.Html msg
toHTML ckb =
    H.label
        [ HA.class (B_Element.toString B_Element.Checkbox) ] 
        (
            [
                H.input
                    (
                        [ HA.type_ (B_Element.toString B_Element.Checkbox) ]
                        ++
                        ckb.attributes
                    )
                    []
            ] 
            ++
            ckb.content
        )