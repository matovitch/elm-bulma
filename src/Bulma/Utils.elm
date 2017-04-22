module Bulma.Utils exposing (..)

isNothing : Maybe a -> Bool
isNothing maybe =
    case maybe of
        Just something -> False
        Nothing        -> True

isJust : Maybe a -> Bool
isJust = not << isNothing

mapIfEnabled : (a -> b) -> Bool -> a  -> List b
mapIfEnabled map isEnabled arg =
    if isEnabled then
        [ map arg ]
    else
        []