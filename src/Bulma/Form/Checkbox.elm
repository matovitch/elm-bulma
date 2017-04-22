module Bulma.Form.Checkbox exposing (..)

import Html            as H
import Html.Attributes as HA
import Html.Events     as HE

import Bulma.Element as B_Element

import Maybe

type alias Checkbox msg = 
    {
        message    : Maybe msg,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

checkbox : Checkbox msg
checkbox = 
    {
        message      = Maybe.Nothing,
        attributes   = [],
        content      = []
    }

toHTML : Checkbox msg -> H.Html msg
toHTML ckb =
    let
        onClick =
            case ckb.message of
                Just message -> [ HE.onClick message ]
                Nothing      -> []
    in
        H.label
            [ HA.class (B_Element.toString B_Element.Checkbox) ] 
            (
                [
                    H.input
                        (
                            [ HA.type_ (B_Element.toString B_Element.Checkbox) ]
                            ++
                            ckb.attributes
                            ++
                            onClick
                        )
                        []
                ] 
                ++
                ckb.content
            )