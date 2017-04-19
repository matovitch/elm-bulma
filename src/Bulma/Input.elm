module Bulma.Input exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Element as B_Element

import Bulma.Modifier.Control as B_M_Control
import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Icon    as B_M_Icon
import Bulma.Modifier.Size    as B_M_Size

import Maybe
import String

type alias Input msg = 
    {
        state      : B_M_State.State,
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        label      : String,
        iconLeft   : Maybe (B_Icon.Icon msg),
        iconRight  : Maybe (B_Icon.Icon msg),
        help       : Maybe (B_Help.Help msg),
        attributes : List (H.Attribute msg)
    }

input : Input msg
input = 
    {
        state      = B_M_State.Default,
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        label      = "",
        iconLeft   = Maybe.Nothing,
        iconRight  = Maybe.Nothing,
        help       = Maybe.Nothing,
        attributes = []
    }

toHTML : Input msg -> H.Html msg
toHTML inp =
    let
        maybeHasIconLeft = 
            case inp.iconLeft of
                Just icon -> Just B_M_Control.IconLeft
                Nothing   -> Nothing

        maybeHasIconRight = 
            case inp.iconRight of
                Just icon -> Just B_M_Control.IconRight
                Nothing   -> Nothing

        maybeHasIconToString = 
            \maybeHasIcon -> 
                case maybeHasIcon of
                    Just hasIcon -> B_M_Control.toString hasIcon
                    Nothing      -> ""

        iconLeft = 
            case inp.iconLeft of
                Just iconLeft -> [ B_Icon.toHTML { iconLeft | modifier = B_M_Icon.Left } ]
                Nothing   -> []

        iconRight = 
            case inp.iconRight of
                Just iconRight -> [ B_Icon.toHTML { iconRight | modifier = B_M_Icon.Right } ]
                Nothing   -> []

        help =
            case inp.help of
                Just help -> [ B_Help.toHTML help ]
                Nothing   -> []

        label =
            if not (String.isEmpty inp.label) then
                [ 
                    H.label 
                        [ HA.class (B_Element.toString B_Element.Label) ]
                        [ H.text inp.label ]
                ]
            else
                []
    in
    H.div
        [ HA.class (B_Element.toString B_Element.Field  ) ]
        (
            label
            ++
            [
                H.p
                    (
                        [ HA.class (B_Element.toString B_Element.Control  ) ] ++
                        [ HA.class (maybeHasIconToString maybeHasIconLeft ) ] ++
                        [ HA.class (maybeHasIconToString maybeHasIconRight) ]
                    )
                    (
                        [
                            H.input
                                (
                                    [
                                        HA.class (B_Element.toString B_Element.Input),
                                        HA.class (B_M_Color.toString inp.color),
                                        HA.class (B_M_State.toString inp.state),
                                        HA.class (B_M_Size.toString  inp.size)
                                    ]
                                    ++
                                    inp.attributes
                                )
                                []
                        ]
                        ++
                        iconLeft
                        ++
                        iconRight
                    )
            ]
            ++
            help
        )      
