module Bulma.Table exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Table as B_M_Table

type alias Table msg =
    {
        modifiers  : List (B_M_Table.Table),
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

table =
    {
        modifiers  = [],
        attributes = [],
        content    = []
    }

toHTML : Table msg -> H.Html msg
toHTML tbl =
    H.table
        (
            [ B_Element.toHA B_Element.Table ]
            ++
            ( List.map B_M_Table.toHA tbl.modifiers )
            ++
            ( tbl.attributes )
        )
        tbl.content