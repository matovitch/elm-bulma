module Bulma.Modifier.Helper exposing (..)

type Helper =
    Clearfix     |
    PulledLeft   |
    PulledRight  |
    Overlay      |
    Fullwidth    |
    TextCentered |
    TextLeft     |
    TextRight    |
    Marginless   |
    Paddingless  |
    Unselectable

toString : Helper -> String
toString float =
    case float of
        Clearfix     -> "is-clearfix"
        PulledLeft   -> "is-pulled-left"
        PulledRight  -> "is-pulled-right"
        Overlay      -> "is-overlay"
        Fullwidth    -> "is-fullwidth"
        TextCentered -> "has-text-centered"
        TextLeft     -> "has-text-left"
        TextRight    -> "has-text-right"
        Marginless   -> "is-marginless"
        Paddingless  -> "is-paddingless"
        Unselectable -> "is-unselectable"