module Bulma.Field exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Component.Field as B_C_Field

import Bulma.Element as B_Element

import Bulma.Control as B_Control

import Bulma.Modifier.Field as B_M_Field
import Bulma.Modifier.Size  as B_M_Size

import Bulma.Utils as B_Utils

import Bulma.Help as B_Help
import Bulma.Icon as B_Icon

import String

type alias Field msg =
    {
        addonsSide   : Maybe B_M_Field.Side,
        isHorizontal : Bool,
        isGrouped    : Bool,
        label        : String,
        labelSize    : B_M_Size.Size,
        help         : Maybe (B_Help.Help msg),
        controls     : List (B_Control.Control msg)
    }

field : Field msg
field =
    {
        addonsSide   = Maybe.Nothing,
        isHorizontal = False,
        isGrouped    = False,
        label        = "",
        labelSize    = B_M_Size.Default,
        help         = Maybe.Nothing,
        controls     = []
    }

fieldCraftHelper : Field msg -> List (H.Html msg) -> List (H.Html msg) -> H.Html msg
fieldCraftHelper fld label content =
    H.div 
        (
            [ B_C_Field.toHA B_C_Field.Root ]
            ++
            ( B_M_Field.maybeSideToHAs fld.addonsSide )
            ++
            ( B_M_Field.isXtoHAs fld.isHorizontal B_M_Field.Horizontal )
            ++
            ( B_M_Field.isXtoHAs fld.isGrouped B_M_Field.Grouped )
        )
        (
            label
            ++
            content
        )


toHTMLH : Field msg -> H.Html msg
toHTMLH fld =
    let
        label =
            if not (String.isEmpty fld.label) then
                [
                    H.div
                        [
                            B_C_Field.toHA B_C_Field.Label,
                            B_M_Size.toHA  fld.labelSize
                        ]
                        [
                            H.label 
                                [ B_Element.toHA B_Element.Label ]
                                [ H.text fld.label ]
                        ]
                ]
            else 
                []
    in
        fieldCraftHelper
            fld
            label
            [
                H.div
                    [ B_C_Field.toHA B_C_Field.Body ]
                    [
                        
                        H.div
                            [ B_C_Field.toHA B_C_Field.Root ]
                            (
                                List.map B_Control.toHTML fld.controls
                                ++
                                List.map B_Help.toHTML (B_Utils.maybeToList fld.help)
                            )
                    ]             
            ]


toHTMLV : Field msg -> H.Html msg
toHTMLV fld =
    let
        label =
            if not (String.isEmpty fld.label) then
                [
                    H.label
                        [
                            B_C_Field.toHA B_C_Field.Label,
                            B_M_Size.toHA  fld.labelSize
                        ]
                        [ H.text fld.label ]
                ]
            else 
                []
    in
        fieldCraftHelper
            fld
            label
            (
                List.map B_Control.toHTML fld.controls
                ++
                List.map B_Help.toHTML (B_Utils.maybeToList fld.help)
            )

toHTML : Field msg -> H.Html msg
toHTML fld =
    if fld.isHorizontal then
        toHTMLH fld
    else
        toHTMLV fld