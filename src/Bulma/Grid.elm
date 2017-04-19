module Bulma.Grid exposing (..)

type Grid =
    Columns |
    Column

toString : Grid -> String
toString grid =
    case grid of
        Columns -> "columns"
        Column  -> "column"