module Bulma.Textarea exposing (..)

import Html as H

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)
import Bulma.Icon    as B_Icon

import Bulma.Form.Input as B_F_Input

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Size    as B_M_Size

type alias Textarea msg =
    {
        state        : B_M_State.State,
        color        : B_M_Color.Color,
        size         : B_M_Size.Size,
        label        : String,
        help         : Maybe (B_Help.Help msg),
        isHorizontal : Bool,
        message      : Maybe (String -> msg),
        attributes   : List (H.Attribute msg)
    }

textarea =
    {
        state        = B_M_State.Default,
        color        = B_M_Color.Default,
        size         = B_M_Size.Normal,
        label        = "",
        help         = Maybe.Nothing,
        isHorizontal = False,
        message      = Maybe.Nothing,
        attributes   = []
    }

toHTML : Textarea msg -> H.Html msg
toHTML txa =
    let
        formTextarea = 
            { 
                state      = txa.state,
                color      = txa.color,
                size       = txa.size,
                message    = txa.message,
                attributes = txa.attributes
            }

        ctl = { control | element = B_Control.Textarea formTextarea }

        fld = { field | label        = txa.label,
                        labelSize    = txa.size,
                        help         = txa.help,
                        isHorizontal = txa.isHorizontal,
                        controls     = [ctl] }
    in
        B_Field.toHTML fld