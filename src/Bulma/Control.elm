module Bulma.Control exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Control as B_M_Control
import Bulma.Modifier.Icon as B_M_Icon

import Bulma.Form.Textarea as B_F_Textarea
import Bulma.Form.Checkbox as B_F_Checkbox
import Bulma.Form.Button   as B_F_Button
import Bulma.Form.Select   as B_F_Select
import Bulma.Form.Input    as B_F_Input
import Bulma.Form.Radio    as B_F_Radio

import Bulma.Utils as B_Utils

import Bulma.Icon as B_Icon

import Maybe
import List

type Element msg =
    Textarea (B_F_Textarea.Textarea msg) |
    Checkbox (B_F_Checkbox.Checkbox msg) |
    Button   (B_F_Button.Button     msg) |
    Select   (B_F_Select.Select     msg) |
    Input    (B_F_Input.Input       msg) |
    Radio    (B_F_Radio.Radio       msg) |
    DefaultElement

type alias Control msg =
    {
        element       : Element msg,
        iconLeft      : Maybe (B_Icon.Icon msg),
        iconRight     : Maybe (B_Icon.Icon msg),
        isExpanded    : Bool,
        attributes    : List (H.Attribute msg)
    }

control : Control msg
control = 
    {
        element       = DefaultElement,
        iconLeft      = Maybe.Nothing,
        iconRight     = Maybe.Nothing,
        isExpanded    = False,
        attributes    = []
    }

elementToHTML : Element msg -> H.Html msg
elementToHTML element =
    case element of
        Textarea textarea -> B_F_Textarea.toHTML textarea
        Checkbox checkbox -> B_F_Checkbox.toHTML checkbox
        Button   button   -> B_F_Button.toHTML   button
        Select   select   -> B_F_Select.toHTML   select
        Input    input    -> B_F_Input.toHTML    input
        Radio    radio    -> B_F_Radio.toHTML    radio
        DefaultElement    -> H.div [] []

maybeIconToHTMLs : Maybe (B_Icon.Icon msg) -> B_M_Icon.Icon -> List (H.Html msg)
maybeIconToHTMLs maybeIcon modif =
    case maybeIcon of
        Just icon -> [ B_Icon.toHTML { icon | modifier = modif } ]
        Nothing   -> []

toHTML : Control msg -> H.Html msg
toHTML ctl =
    H.p
        (
            [ HA.class (B_Element.toString B_Element.Control) ]
            ++
            ( B_M_Control.isXtoHAs (B_Utils.isJust ctl.iconLeft ) B_M_Control.IconsLeft )
            ++
            ( B_M_Control.isXtoHAs (B_Utils.isJust ctl.iconRight) B_M_Control.IconsRight)
            ++
            ( B_M_Control.isXtoHAs ctl.isExpanded B_M_Control.Expanded )
            ++
            ctl.attributes
        )
        ( 
            [ elementToHTML ctl.element]
            ++
            (maybeIconToHTMLs ctl.iconLeft B_M_Icon.Left)
            ++
            (maybeIconToHTMLs ctl.iconRight B_M_Icon.Right)
        )