module Bulma.Section exposing (..)

import Html as H

import Bulma.Layout as B_Layout

type alias Section msg = 
    {
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

section : Section msg
section = 
    {
        attributes   = [],
        content      = []
    }

toHTML : Section msg -> H.Html msg
toHTML sct =
    H.div
        (
            [ B_Layout.toHA B_Layout.Section ]
            ++
            sct.attributes
        )
        sct.content
