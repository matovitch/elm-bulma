module Bulma.Form.Radio exposing (..)

import Html            as H
import Html.Attributes as HA
import Html.Events     as HE

import Bulma.Element as B_Element

import Maybe
import Tuple
import List

type alias Radio msg =
    {
        name       : String,
        attributes : List (H.Attribute msg),
        contents   : List (List (H.Html msg), msg)
    }

radio : Radio msg
radio = 
    {
        name         = "",
        attributes   = [],
        contents     = []
    }

contentToHTML : Radio msg -> Bool -> (List (H.Html msg), msg) -> H.Html msg
contentToHTML rdo isChecked content =
    H.label
        [ HA.class (B_Element.toString B_Element.Radio) ] 
        (
            [
                H.input
                    (
                        [ HA.type_ (B_Element.toString B_Element.Radio) ]
                        ++
                        [ HA.checked isChecked ]
                        ++
                        [ HA.name rdo.name ]
                        ++
                        rdo.attributes
                        ++
                        [ HE.onClick (Tuple.second content)]
                    )
                    []
            ]
            ++
            ( Tuple.first content )
        )

toHTML : Radio msg -> H.Html msg
toHTML rdo = 
    let
        isChecked    = True
        isNotChecked = False
        display = \chk -> List.map (contentToHTML rdo chk)
    in
        H.div []
            (
                [
                    display isChecked
                            rdo.contents |> List.head
                                         |>  Maybe.withDefault (H.div [] [])
                ]
                    ++
                (
                    display isNotChecked
                            rdo.contents |> List.tail
                                         |> Maybe.withDefault [H.div [] []]
                )
            )