module Bulma.Notification exposing (..)

import Html        as H
import Html.Events as HE

import Bulma.Element as B_Element

import Bulma.Delete as B_Delete

import Bulma.Utils  as B_Utils

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.Size  as B_M_Size

type alias Notification msg =
    {
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        message    : String,
        onClose    : Maybe msg,
        attributes : List (H.Html msg)
    }

notification : Notification msg
notification =
    {
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        message    = "",
        onClose    = Nothing,
        attributes = []
    }

toHTML : Notification msg -> H.Html msg
toHTML ntf =
    let
        delete = 
            { 
                size       = ntf.size,
                attributes = List.map HE.onClick (B_Utils.maybeToList ntf.onClose)
            }
    in
        H.div
            [ 
                B_Element.toHA B_Element.Notification,
                B_M_Color.toHA ntf.color,
                B_M_Size.toHA  ntf.size
            ]
            [
                B_Delete.toHTML delete,
                H.text ntf.message
            ]