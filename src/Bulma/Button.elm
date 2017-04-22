module Bulma.Button exposing (..)

import Html as H

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.State as B_M_State
import Bulma.Modifier.Size  as B_M_Size

import Bulma.Icon as B_Icon

type alias Button msg =
    {
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        states     : List B_M_State.State,
        icon       : Maybe (B_Icon.Icon msg),
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

button : Button msg
button =
    {
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        states     = [],
        icon       = Maybe.Nothing,
        attributes = [],
        content    = []
    }

toHTML : Button msg -> H.Html msg
toHTML btn =
    let
        ctl = { control | element = B_Control.Button btn }

        fld = { field | controls = [ctl] }
    in
        B_Field.toHTML fld