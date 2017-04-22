module Bulma.Select exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Size    as B_M_Size

import Dict

type alias Select msg = 
    {
        state        : B_M_State.State,
        color        : B_M_Color.Color,
        size         : B_M_Size.Size,
        label        : String,
        isHorizontal : Bool,
        options      : Dict.Dict String msg,
        attributes   : List (H.Attribute msg)
    }


select : Select msg
select = 
    {
        state        = B_M_State.Default,
        color        = B_M_Color.Default,
        size         = B_M_Size.Default,
        label        = "",
        isHorizontal = False,
        options      = Dict.empty,
        attributes   = []
    }

toHTML : Select msg -> H.Html msg
toHTML slc =
    let
        formSelect =
            {
                state      = slc.state,
                color      = slc.color,
                size       = slc.size,
                options    = slc.options,
                attributes = slc.attributes
            }

        ctl = { control | element = B_Control.Select formSelect }

        fld = { field | label        = slc.label,
                        labelSize    = slc.size,
                        isHorizontal = slc.isHorizontal,
                        controls     = [ctl] }
    in
        B_Field.toHTML fld