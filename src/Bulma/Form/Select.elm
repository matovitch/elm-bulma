module Bulma.Form.Select exposing (..)

import Html            as H
import Html.Attributes as HA
import Html.Events     as HE

import Bulma.Icon as B_Icon
import Bulma.Help as B_Help

import Bulma.Element as B_Element

import Bulma.Modifier.Control as B_M_Control
import Bulma.Modifier.Color   as B_M_Color
import Bulma.Modifier.State   as B_M_State
import Bulma.Modifier.Size    as B_M_Size

import Json.Decode

import Dict
import Maybe
import List

type alias Select msg = 
    {
        state      : B_M_State.State,
        color      : B_M_Color.Color,
        size       : B_M_Size.Size,
        options    : Dict.Dict String msg,
        attributes : List (H.Attribute msg)
    }


select : Select msg
select = 
    {
        state      = B_M_State.Default,
        color      = B_M_Color.Default,
        size       = B_M_Size.Default,
        options    = Dict.empty,
        attributes = []
    }

targetValueDecoder : Dict.Dict String msg -> Json.Decode.Decoder msg
targetValueDecoder optToMsg =
    HE.targetValue |> Json.Decode.andThen
        (
            \opt -> 
                case Dict.get opt optToMsg of
                  Just message -> Json.Decode.succeed message
                  _ -> Json.Decode.fail ("No message for option: " ++ opt)
        )

toHTML : Select msg -> H.Html msg
toHTML slc =
    H.select
        (
            [
                HA.class (B_Element.toString B_Element.Select),
                B_M_Color.toHA slc.color,
                B_M_State.toHA slc.state,
                B_M_Size.toHA  slc.size
            ]
            ++
            slc.attributes
            ++
            [ HE.on "change" (targetValueDecoder slc.options) ]
        )
        ( List.map (\t -> H.option [] [H.text t]) (Dict.keys slc.options) )