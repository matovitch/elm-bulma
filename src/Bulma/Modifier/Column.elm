module Bulma.Modifier.Column exposing (..)

import String
import List

type Base =
    ThreeQuarters |
    TwoThirds     |
    Half          |
    OneThird      |
    OneQuarter    |
    Is2           |
    Is3           |
    Is4           |
    Is5           |
    Is6           |
    Is7           |
    Is8           |
    Is9           |
    Is10          |
    Is11          |
    Narrow

type Attribute =
    Offset  |
    Mobile  |
    Tablet  |
    Desktop |
    None

baseToString : Base -> String
baseToString base =
    case base of
        ThreeQuarters -> "is-threeQuarters"
        TwoThirds     -> "is-twoThirds"
        Half          -> "is-half"
        OneThird      -> "is-oneThird"
        OneQuarter    -> "is-oneQuarter"
        Is2           -> "is-is2"
        Is3           -> "is-is3"
        Is4           -> "is-is4"
        Is5           -> "is-is5"
        Is6           -> "is-is6"
        Is7           -> "is-is7"
        Is8           -> "is-is8"
        Is9           -> "is-is9"
        Is10          -> "is-is10"
        Is11          -> "is-is11"
        Narrow        -> "is-narrow"

attributeToString : Attribute -> String
attributeToString attribute =
    case attribute of
        Offset  -> "offset"
        Mobile  -> "mobile"
        Tablet  -> "tablet"
        Desktop -> "desktop"
        None    -> ""

type alias Column = (Base, Attribute)

toString : Column -> String
toString (base, attribute) =
    let
        baseAsString      =      baseToString base
        attributeAsString = attributeToString attribute

        stripedBase = baseAsString |> String.split "-"
                                   |> List.tail
                                   |> Maybe.withDefault []
                                   |> String.join "-"
    in
        case attribute of
            Offset -> "is-" ++ attributeAsString ++ stripedBase
            _      -> baseAsString ++ "-" ++ attributeAsString