module Bulma.Modifier.Table exposing (..)

type Table =
    Bordered |
    Striped  |
    Narrow

toString : Table -> String
toString table =
    case table of
        Bordered -> "is-bordered"
        Striped  -> "is-striped"
        Narrow   -> "is-narrow"