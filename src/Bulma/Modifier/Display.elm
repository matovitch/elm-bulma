module Bulma.Modifier.Display exposing (..)

type Display =
    Block       |
    Flex        |
    Inline      |
    InlineBlock |
    InlineFlex  |
    Hidden

toString : Display -> String
toString display =
    case display of
        Block       -> "is-block"
        Flex        -> "is-flex"
        Inline      -> "is-inline"
        InlineBlock -> "is-inline-block"
        InlineFlex  -> "is-inline-flex"
        Hidden      -> "is-hidden"