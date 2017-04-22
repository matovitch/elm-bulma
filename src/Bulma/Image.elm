module Bulma.Image exposing (..)

import Html as H

import Bulma.Element as B_Element

import Bulma.Utils as B_Utils

import Bulma.Modifier.Image  as B_M_Image

type alias Image msg = 
    {
        format     : Maybe B_M_Image.Image,
        attributes : List (H.Attribute msg)
    }

image : Image msg
image = 
    {
        format     = Maybe.Nothing,
        attributes = []
    }

toHTML : Image msg -> H.Html msg
toHTML img =
    H.figure
        ( 
            [ B_Element.toHA B_Element.Image ]
            ++
            List.map B_M_Image.toHA (B_Utils.maybeToList img.format) 
        )
        [
            H.img
                img.attributes
                []
        ]