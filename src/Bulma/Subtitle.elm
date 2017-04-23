module Bulma.Subtitle exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Title as B_M_Title

type alias Subtitle msg =
    {
        kind       : B_M_Title.Title,
        name       : String,
        attributes : List (H.Attribute msg)
    }

subtitle : Subtitle msg
subtitle =
    {
        kind       = B_M_Title.Is1,
        name       = "",
        attributes = []
    }

toHTML : Subtitle msg -> H.Html msg
toHTML sbt =
    let
        htag =
            case sbt.kind of 
                B_M_Title.Is1 -> H.h1
                B_M_Title.Is2 -> H.h2
                B_M_Title.Is3 -> H.h3
                B_M_Title.Is4 -> H.h4
                B_M_Title.Is5 -> H.h5
                B_M_Title.Is6 -> H.h6
    in
        htag 
            [
                B_Element.toHA B_Element.Subtitle,
                B_M_Title.toHA sbt.kind
            ]
            [ H.text sbt.name ]
