module Bulma.Modifier.Field exposing (..)

type AddonsSide =
    AddonsLeft     |
    AddonsRight    |
    AddonsCentered |
    AddonsDefault

type Field =
    Addons AddonsSide |
    Horizontal        |
    Grouped

addonsSideToString : AddonsSide -> String
addonsSideToString addonsSide =
    case addonsSide of
        AddonsLeft     -> "has-addons has-addons-left"
        AddonsRight    -> "has-addons has-addons-right" 
        AddonsCentered -> "has-addons has-addons-centered"
        AddonsDefault  -> "has-addons"

toString : Field -> String
toString field =
    case field of
        Addons  addonsSide -> addonsSideToString addonsSide
        Horizontal         -> "is-horizontal"
        Grouped            -> "is-grouped"