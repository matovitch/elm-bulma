module Bulma.Input exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)
import Bulma.Icon    as B_Icon

import Bulma.Form.Input as B_F_Input

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Icon    as B_M_Icon
import Bulma.Modifier.Size    as B_M_Size

type alias Input msg =
    {
        state        : B_M_State.State,
        color        : B_M_Color.Color,
        size         : B_M_Size.Size,
        iconLeft     : Maybe (B_Icon.Icon msg),
        iconRight    : Maybe (B_Icon.Icon msg),
        label        : String,
        help         : Maybe (B_Help.Help msg),
        isHorizontal : Bool,
        attributes   : List (H.Attribute msg)
    }

input =
    {
        state        = B_M_State.Default,
        color        = B_M_Color.Default,
        size         = B_M_Size.Normal,
        iconLeft     = Maybe.Nothing,
        iconRight    = Maybe.Nothing,
        label        = "",
        help         = Maybe.Nothing,
        isHorizontal = False,
        attributes   = []
    }

toHTML : Input msg -> H.Html msg
toHTML inp =
    let
        formInput = 
            { 
                state      = inp.state,
                color      = inp.color,
                size       = inp.size,
                attributes = inp.attributes
            }

        ctl = { control | iconLeft  = inp.iconLeft,
                          iconRight = inp.iconRight,
                          element   = B_Control.Input formInput }

        fld = { field | label        = inp.label,
                        labelSize    = inp.size,
                        help         = inp.help,
                        isHorizontal = inp.isHorizontal,
                        controls     = [ctl] }
    in
        B_Field.toHTML fld