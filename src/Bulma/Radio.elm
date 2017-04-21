module Bulma.Radio exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

import List

type alias Radio msg = 
    {
        label        : String,
        name         : String,
        isHorizontal : Bool,
        attributes   : List (H.Attribute msg),
        contents     : List (List (H.Html msg))
    }

radio : Radio msg
radio = 
    {
        label        = "",
        name         = "",
        isHorizontal = False,
        attributes   = [],
        contents     = [[]]
    }

toHTML : Radio msg -> H.Html msg
toHTML rdo =
    let
        fRdo =
            {
                name       = rdo.name,
                attributes = rdo.attributes,
                contents   = rdo.contents
            }

        ctl = { control | element = B_Control.Radio fRdo }

        fld = { field | label        = rdo.label,
                        isHorizontal = rdo.isHorizontal,
                        controls     = [ctl] }
    in
        B_Field.toHTML fld