module Bulma.Checkbox exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

type alias Checkbox msg = 
    {
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

checkbox : Checkbox msg
checkbox = 
    {
        attributes   = [],
        content      = []
    }

toHTML : Checkbox msg -> H.Html msg
toHTML ckb =
    let
        fCkb =
            {
                attributes   = ckb.attributes,
                content      = ckb.content
            }
        
        ctl = { control | element = B_Control.Checkbox fCkb }

        fld = { field | controls = [ctl] }
    in
        B_Field.toHTML fld