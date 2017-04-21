module Bulma.Control exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Element as B_Element

import Bulma.Modifier.Control as B_M_Control
import Bulma.Modifier.Icon as B_M_Icon

import Bulma.Form.Textarea as B_F_Textarea
import Bulma.Form.Checkbox as B_F_Checkbox
import Bulma.Form.Select   as B_F_Select
import Bulma.Form.Input    as B_F_Input
import Bulma.Form.Radio    as B_F_Radio

import Bulma.Utils.Maybe as B_U_Maybe

import Bulma.Icon as B_Icon

import Maybe

type Element msg =
    Textarea (B_F_Textarea.Textarea msg) |
    Checkbox (B_F_Checkbox.Checkbox msg) |
    Select   (B_F_Select.Select msg)     |
    Input    (B_F_Input.Input msg)       |
    Radio    (B_F_Radio.Radio msg)       |
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

elementToHTMLs : Element msg -> List (H.Html msg)
elementToHTMLs element =
    case element of
        Textarea textarea -> [ B_F_Textarea.toHTML textarea ]
        Checkbox checkbox -> [ B_F_Checkbox.toHTML checkbox ]
        Select   select   -> [ B_F_Select.toHTML   select   ]
        Input    input    -> [ B_F_Input.toHTML    input    ]
        Radio    radio    ->   B_F_Radio.toHTML    radio
        DefaultElement    -> []

modifierToHAs : B_M_Control.Control -> Bool -> List (H.Attribute msg)
modifierToHAs modifier isEnabled =
    if isEnabled then
        [ HA.class (B_M_Control.toString modifier) ]
    else
        []

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
                ( modifierToHAs B_M_Control.IconsLeft  (B_U_Maybe.isJust ctl.iconLeft ) )
                ++
                ( modifierToHAs B_M_Control.IconsRight (B_U_Maybe.isJust ctl.iconRight) )
                ++
                ( modifierToHAs B_M_Control.Expanded ctl.isExpanded )
                ++
                ctl.attributes
            )
            ( 
                (elementToHTMLs ctl.element)
                ++
                (maybeIconToHTMLs ctl.iconLeft B_M_Icon.Left)
                ++
                (maybeIconToHTMLs ctl.iconRight B_M_Icon.Right)
            )