module Bulma.Field exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Component.Field as B_C_Field

import Bulma.Element as B_Element

import Bulma.Control as B_Control

import Bulma.Modifier.Field as B_M_Field
import Bulma.Modifier.Size  as B_M_Size

import Bulma.Help as B_Help
import Bulma.Icon as B_Icon

import String

type alias Field msg =
    {
        addonsSide   : Maybe B_M_Field.AddonsSide,
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

modifierToHAs : B_M_Field.Field -> Bool -> List (H.Attribute msg)
modifierToHAs modifier isEnabled =
    if isEnabled then
        [ HA.class (B_M_Field.toString modifier) ]
    else
        []

maybeAddonsSideToHAs : Maybe B_M_Field.AddonsSide -> List (H.Attribute msg)
maybeAddonsSideToHAs maybeAddonsSide =
    case maybeAddonsSide of
        Just addonsSide -> modifierToHAs (B_M_Field.Addons addonsSide) True
        Nothing         -> []


toHTMLH : Field msg -> H.Html msg
toHTMLH fld =
    let
        label =
            if not (String.isEmpty fld.label) then
                [
                    H.div
                        (
                            [ HA.class (B_C_Field.toString B_C_Field.Label) ] ++
                            [ HA.class (B_M_Size.toString  fld.labelSize)   ]
                        )
                        [
                            H.label 
                                [ HA.class (B_Element.toString B_Element.Label) ]
                                [ H.text fld.label ]
                        ]
                ]
            else 
                []
        help = 
            case fld.help of
                Just hlp -> [ B_Help.toHTML hlp ]
                Nothing  -> [] 
    in
        H.div 
            (
                [ HA.class (B_C_Field.toString B_C_Field.Root) ]
                ++
                ( maybeAddonsSideToHAs fld.addonsSide )
                ++
                ( modifierToHAs B_M_Field.Horizontal fld.isHorizontal )
                ++
                ( modifierToHAs B_M_Field.Grouped fld.isGrouped )
            )
            (
                label
                ++
                [
                    H.div
                        [ HA.class (B_C_Field.toString B_C_Field.Body) ]
                        [
                            
                            H.div
                                [ HA.class (B_C_Field.toString B_C_Field.Root) ]
                                (
                                    (List.map B_Control.toHTML fld.controls)
                                    ++
                                    help
                                )
                        ]             
                ]
                
            )


toHTMLV : Field msg -> H.Html msg
toHTMLV fld =
    let
        label =
            if not (String.isEmpty fld.label) then
                [
                    H.label
                        (
                            [ HA.class (B_Element.toString B_Element.Label) ] ++
                            [ HA.class (B_M_Size.toString  fld.labelSize)   ]
                        )
                        [ H.text fld.label ]
                ]
            else 
                []
        help = 
            case fld.help of
                Just hlp -> [ B_Help.toHTML hlp ]
                Nothing  -> [] 
    in
        H.div
            (
                [ HA.class (B_C_Field.toString B_C_Field.Root) ]
                ++
                ( maybeAddonsSideToHAs fld.addonsSide )
                ++
                ( modifierToHAs B_M_Field.Horizontal fld.isHorizontal )
                ++
                ( modifierToHAs B_M_Field.Grouped fld.isGrouped )
            )
            (
                label
                ++
                (List.map B_Control.toHTML fld.controls)
                ++
                help
            )

toHTML : Field msg -> H.Html msg
toHTML fld =
    if fld.isHorizontal then
        toHTMLH fld
    else
        toHTMLV fld