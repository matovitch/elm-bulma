module Bulma.Buttons exposing (..)

import Html as H

import Bulma.Button as B_Button

import Bulma.Control as B_Control exposing (control)
import Bulma.Field   as B_Field   exposing (field)

import Bulma.Modifier.Field as B_M_Field

import List

type alias Buttons msg = List (B_Button.Button msg)

buttons = []

toHTML : Buttons msg -> H.Html msg
toHTML btns =
    let
        ctls =
            List.map (\btn -> { control | element = B_Control.Button btn })
                     btns

        fld = { field | isGrouped = True, 
                        controls = ctls }
    in
        B_Field.toHTML fld