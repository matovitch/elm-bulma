module Bulma.Utils.Maybe exposing (..)

import Maybe

isNothing : Maybe a -> Bool
isNothing maybe =
    case maybe of
        Just something -> False
        Nothing        -> True

isJust : Maybe a -> Bool
isJust = not << isNothing
