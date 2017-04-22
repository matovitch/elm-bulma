module Bulma.Tabs exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.TabsItem as B_TabsItem

import Bulma.Component.Tabs as B_C_Tabs

import Bulma.Modifier.Helper  as B_M_Helper
import Bulma.Modifier.Size    as B_M_Size
import Bulma.Modifier.Tabs    as B_M_Tabs

import List

type alias Tabs msg = 
    {
        size         : B_M_Size.Size,
        modifiers    : List B_M_Tabs.Tabs,
        isFullwidth  : Bool,
        items        : List (B_TabsItem.TabsItem msg),
        attributes   : List (H.Attribute         msg)
    }

tabs : Tabs msg
tabs = 
    {
        size         = B_M_Size.Default,
        modifiers    = [],
        isFullwidth  = False,
        items        = [],
        attributes   = []
    }

toHTML : Tabs msg -> H.Html msg
toHTML tbs =
    let
        isFullwidth =
            if tbs.isFullwidth then
                [ HA.class (B_M_Helper.toString B_M_Helper.Fullwidth) ]
            else
                []
    in
        H.div
            (
                [ B_C_Tabs.toHA B_C_Tabs.Root ]
                ++
                [ B_M_Size.toHA tbs.size ]
                ++
                ( List.map B_M_Tabs.toHA tbs.modifiers ) 
                ++
                isFullwidth
                ++
                tbs.attributes
            )
            [
                H.ul [] (List.map B_TabsItem.toHTML tbs.items)
            ]
