module Bulma.TabsItem exposing (..)

import Html as H

import Bulma.Component.Tabs as B_C_Tabs

import Bulma.Modifier.State  as B_M_State

import Bulma.Icon as B_Icon

import Maybe

type alias TabsItem msg = 
    {
        name       : String,
        icon       : Maybe (B_Icon.Icon msg),
        isActive   : Bool,
        onClick    : Maybe msg,
        attributes : List (H.Attribute msg)
    }

tabsItem : TabsItem msg
tabsItem = 
    {
        name         = "",
        icon         = Maybe.Nothing,
        isActive     = False,
        onClick      = Maybe.Nothing,
        attributes   = []
    }

toHTML : TabsItem msg -> H.Html msg
toHTML tbi =
        H.li
            ( 
                ( B_M_State.isXtoHAs tbi.isActive B_M_State.Active )
                ++ 
                tbi.attributes
            )
            [
                H.a [] 
                    (
                        (B_Icon.maybeToHTMLs tbi.icon) 
                        ++ 
                        [ H.text tbi.name ]
                    ) 
            ]