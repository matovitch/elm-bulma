module Bulma.Form.Input exposing (..)

import Html            as H
import Html.Events     as HE

import Bulma.Element as B_Element

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Icon    as B_M_Icon
import Bulma.Modifier.Size    as B_M_Size


type alias Input msg = 
    {
        state      : B_M_State.State,
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        attributes : List (H.Attribute msg)
    }

input : Input msg
input = 
    {
        state      = B_M_State.Default,
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        attributes = []
    }

toHTML : Input msg -> H.Html msg
toHTML inp =
    H.input
        (
            [
                B_Element.toHA B_Element.Input,
                B_M_Color.toHA inp.color,
                B_M_State.toHA inp.state,
                B_M_Size.toHA  inp.size
            ]
            ++
            inp.attributes
        )
        []
