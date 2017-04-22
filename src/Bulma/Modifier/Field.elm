module Bulma.Modifier.Field exposing (..)

import Html            as H
import Html.Attributes as HA

import Bulma.Utils as B_Utils

type Side =
    Left     |
    Right    |
    Centered |
    Default

type Field =
    Addons Side |
    Horizontal  |
    Grouped

sideToString : Side -> String
sideToString side =
    case side of
        Left     -> "has-addons-left"
        Right    -> "has-addons-right" 
        Centered -> "has-addons-centered"
        Default  -> ""

toString : Field -> String
toString field =
    case field of
        Addons  side -> "has-addons " ++ sideToString side
        Horizontal   -> "is-horizontal"
        Grouped      -> "is-grouped"

toHA : Field -> H.Attribute msg
toHA = HA.class << toString

isXtoHAs : Bool -> Field -> List (H.Attribute msg)
isXtoHAs isX field = 
    field |> B_Utils.doesExist isX
          |> B_Utils.maybeToList
          |> List.map toHA 

maybeSideToHAs : Maybe Side -> List (H.Attribute msg)
maybeSideToHAs maybeAddonsSide = 
    maybeAddonsSide |> B_Utils.maybeToList
                    |> List.map (\s -> toHA (Addons s))