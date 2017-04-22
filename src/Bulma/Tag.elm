module Bulma.Tag exposing (..)

import Html        as H
import Html.Events as HE

import Bulma.Element as B_Element

import Bulma.Delete as B_Delete

import Bulma.Utils  as B_Utils

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.Size  as B_M_Size

type alias Tag msg =
    {
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        message    : String,
        onClose    : Maybe msg,
        attributes : List (H.Html msg)
    }

tag : Tag msg
tag =
    {
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        message    = "",
        onClose    = Nothing,
        attributes = [] 
    }

toHTML : Tag msg -> H.Html msg
toHTML tag =
    let
        delete = { size = tag.size, attributes = [] }

        deleteAsHs = List.map (\oc -> {delete | attributes = [ HE.onClick oc] })
                              (B_Utils.maybeToList tag.onClose)
    in
        H.span
            [ 
                B_Element.toHA B_Element.Tag,
                B_M_Color.toHA tag.color,
                B_M_Size.toHA  tag.size
            ]
            (
                [ H.text tag.message ]
                ++
                List.map B_Delete.toHTML deleteAsHs
            )
