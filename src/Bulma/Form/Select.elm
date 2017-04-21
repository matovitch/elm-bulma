module Bulma.Form.Select exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Element as B_Element

import Bulma.Modifier.Control as B_M_Control
import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Size    as B_M_Size

import Maybe
import List

type alias Select msg = 
    {
        state      : B_M_State.State,
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        options    : List String,
        attributes : List (H.Attribute msg)
    }


select : Select msg
select = 
    {
        state      = B_M_State.Default,
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        options    = [],
        attributes = []
    }

toHTML : Select msg -> H.Html msg
toHTML slc =
    H.select
        (
            [
                HA.class (B_Element.toString B_Element.Select),
                HA.class (B_M_Color.toString slc.color),
                HA.class (B_M_State.toString slc.state),
                HA.class (B_M_Size.toString  slc.size)
            ]
            ++
            slc.attributes
        )
        ( List.map (\t -> H.option [] [H.text t]) slc.options )