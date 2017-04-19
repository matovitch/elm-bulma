module Bulma.Modifier.Device exposing (..)

type Device =
    Mobile      |
    Tablet      |
    TabletOnly  |
    Desktop     |
    DesktopOnly |
    Widescreen

toString : Device -> String
toString device =
    case device of
        Mobile      -> "mobile"
        Tablet      -> "tablet"
        TabletOnly  -> "tablet-only"
        Desktop     -> "desktop"
        DesktopOnly -> "desktop-only"
        Widescreen  -> "widescreen"
