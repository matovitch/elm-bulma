module Bulma.Modifier.Size exposing (..)

type Size =
    Small  |
    Medium |
    Large  |
    Default

toString : Size -> String
toString size =
    case size of 
        Small   -> "is-small"
        Medium  -> "is-medium"
        Large   -> "is-large"
        Default -> "is-normal"