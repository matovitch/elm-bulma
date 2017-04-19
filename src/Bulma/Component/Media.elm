module Bulma.Component.Media exposing (..)

type Media =
    Root    |
    Left    |
    Right   |
    Content

toString : Media -> String
toString media =
    case media of
        Root    -> "media"
        Left    -> "media-left"
        Right   -> "media-right"
        Content -> "media-content"