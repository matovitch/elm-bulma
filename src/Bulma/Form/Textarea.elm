module Bulma.Form.Textarea exposing (..)

import Html            as H
import Html.Events     as HE

import Bulma.Element as B_Element

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Icon    as B_M_Icon
import Bulma.Modifier.Size    as B_M_Size

import Maybe

type alias Textarea msg = 
    {
        state      : B_M_State.State,
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        attributes : List (H.Attribute msg)
    }

textarea : Textarea msg
textarea = 
    {
        state      = B_M_State.Default,
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        attributes = []
    }

toHTML : Textarea msg -> H.Html msg
toHTML txa =
    H.textarea
        (
            [
                B_Element.toHA B_Element.Textarea,
                B_M_Color.toHA txa.color,
                B_M_State.toHA txa.state,
                B_M_Size.toHA  txa.size
            ]
            ++
            txa.attributes
        )
        []
