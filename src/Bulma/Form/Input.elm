module Bulma.Form.Input exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Element as B_Element

import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Icon    as B_M_Icon
import Bulma.Modifier.Size    as B_M_Size

import Maybe
import String

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

maybeIconToBool : Maybe (B_Icon.Icon msg) -> Bool
maybeIconToBool maybeIcon =
    case maybeIcon of
        Just icon -> True
        Nothing   -> False

toHTML : Input msg -> H.Html msg
toHTML inp =
    H.input
        (
            [
                HA.class (B_Element.toString B_Element.Input),
                HA.class (B_M_Color.toString inp.color),
                HA.class (B_M_State.toString inp.state),
                HA.class (B_M_Size.toString  inp.size)
            ]
            ++
            inp.attributes
        )
        []
