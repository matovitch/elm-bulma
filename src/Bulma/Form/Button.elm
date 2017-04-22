module Bulma.Form.Button exposing (..)

import Html            as H
import Html.Attributes as HA
import Html.Events     as HE

import Bulma.Element as B_Element

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.State as B_M_State
import Bulma.Modifier.Size  as B_M_Size

import Bulma.Icon as B_Icon

import Maybe

type alias Button msg =
    {
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        states     : List B_M_State.State,
        icon       : Maybe (B_Icon.Icon msg),
        message    : Maybe msg,
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
        message    = Maybe.Nothing,
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

        onClick =
            case btn.message of
                Just message -> [ HE.onClick message ]
                Nothing      -> []
    in
        H.button
            (
                [
                    B_Element.toHA B_Element.Button,
                    B_M_Color.toHA btn.color,
                    B_M_Size.toHA  btn.size
                ]
                ++ 
                List.map (\state -> B_M_State.toHA state) btn.states
                ++
                btn.attributes
                ++
                onClick
            )
            ( icon ++ btn.content )