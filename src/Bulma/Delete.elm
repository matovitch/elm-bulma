module Bulma.Delete exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Size  as B_M_Size

type alias Delete msg = 
    {
        size       : B_M_Size.Size,
        attributes : List (H.Attribute msg)
    }

delete : Delete msg
delete = 
    {
        size       = B_M_Size.Default,
        attributes = []
    }

toHTML : Delete msg -> H.Html msg
toHTML dlt =
    H.a
        (
            [
                B_Element.toHA B_Element.Delete,
                B_M_Size.toHA dlt.size
            ] 
            ++
            dlt.attributes
        )
        []
