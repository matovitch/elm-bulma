module Bulma.Title exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Title as B_M_Title

type alias Title msg =
    {
        kind       : B_M_Title.Title,
        name       : String,
        attributes : List (H.Attribute msg)
    }

title : Title msg
title =
    {
        kind       = B_M_Title.Is1,
        name       = "",
        attributes = []
    }

toHTML : Title msg -> H.Html msg
toHTML ttl =
    let
        htag =
            case ttl.kind of 
                B_M_Title.Is1 -> H.h1
                B_M_Title.Is2 -> H.h2
                B_M_Title.Is3 -> H.h3
                B_M_Title.Is4 -> H.h4
                B_M_Title.Is5 -> H.h5
                B_M_Title.Is6 -> H.h6
    in
        htag 
            [
                B_Element.toHA B_Element.Title,
                B_M_Title.toHA ttl.kind
            ]
            [ H.text ttl.name ]
