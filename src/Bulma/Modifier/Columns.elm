module Bulma.Modifier.Columns exposing (..)

type Columns =
    Gapless   |
    Multiline |
    Mobile    |
    Desktop

toString : Columns -> String
toString columns =
    case columns of
        Gapless   -> "is-gapless"
        Multiline -> "is-multiline"
        Mobile    -> "is-mobile"
        Desktop   -> "is-desktop"