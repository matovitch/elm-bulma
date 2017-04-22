module Bulma.Checkbox exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

import Maybe

type alias Checkbox msg = 
    {
        message    : Maybe msg,
        attributes : List (H.Attribute msg),
        content    : List (H.Html msg)
    }

checkbox : Checkbox msg
checkbox = 
    {
        message      = Maybe.Nothing,
        attributes   = [],
        content      = []
    }

toHTML : Checkbox msg -> H.Html msg
toHTML ckb =
    let        
        ctl = { control | element = B_Control.Checkbox ckb }

        fld = { field | controls = [ctl] }
    in
        B_Field.toHTML fld