module Bulma.Utils exposing (..)

import Html as H

isNothing : Maybe a -> Bool
isNothing maybe =
    case maybe of
        Just something -> False
        Nothing        -> True

isJust : Maybe a -> Bool
isJust = not << isNothing

maybeToList : Maybe a -> List a
maybeToList maybe =
    case maybe of
        Just something -> [ something ]
        Nothing        -> []

doesExist : Bool -> a -> Maybe a
doesExist isReal something =
    if isReal then
        Just something
    else
        Nothing