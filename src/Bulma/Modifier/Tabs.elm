module Bulma.Modifier.Tabs exposing (..)

type Tabs =
    Centered |
    Toggle   |
    Boxed    | 
    Right

toString : Tabs -> String
toString textArea =
    case textArea of
        Centered -> "is-centered"
        Toggle   -> "is-toggle"
        Boxed    -> "is-boxed" 
        Right    -> "is-right"