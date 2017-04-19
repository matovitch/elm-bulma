module Bulma.TabsItem exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Component.Tabs as B_C_Tabs

import Bulma.Modifier.State  as B_M_State

type alias TabsItem msg = 
    {
        isActive   : Bool,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

tabsItem : TabsItem msg
tabsItem = 
    {
        isActive     = False,
        attributes   = [],
        content      = []
    }

toHTML : TabsItem msg -> H.Html msg
toHTML tbi =
    let
        isActive =
            if tbi.isActive then
                [ HA.class (B_M_State.toString B_M_State.Active) ]
            else
                []
    in
    H.li
        ( isActive ++ tbi.attributes )
        tbi.content