module Bulma.Button exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.State as B_M_State
import Bulma.Modifier.Size  as B_M_Size

import Bulma.Icon as B_Icon

import Maybe

type alias Button msg =
    {
        color  : B_M_Color.Color,
        size   : B_M_Size.Size,
        states : List B_M_State.State,
        icon   : Maybe (B_Icon.Icon msg),
        attributes : List (H.Attribute msg),
        content : List (H.Html msg)
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
        icon =
            case btn.icon of
                Maybe.Just icon -> [B_Icon.toHTML icon]
                Maybe.Nothing   -> []
    in
    H.button
        (
            [
                HA.class (B_Element.toString B_Element.Button),
                HA.class (B_M_Color.toString btn.color),
                HA.class (B_M_Size.toString  btn.size)
            ]
            ++ 
            List.map (\s -> HA.class (B_M_State.toString s)) btn.states 
            ++
            [HA.disabled (List.member B_M_State.Disabled btn.states)]
            ++
            btn.attributes
        )
        ( icon ++ btn.content )
        
