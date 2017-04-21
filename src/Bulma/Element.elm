module Bulma.Element exposing (..)

type Element =
    Box          |
    Button       |
    Content      |
    Delete       |
    Control      |
    Label        |
    Input        |
    Textarea     |
    Select       |
    Checkbox     |
    Radio        |
    Help         |
    Icon         |
    Image        |
    Notification |
    Progress     |
    Table        |
    Tag          |
    Title        |
    Subtitle

toString : Element -> String
toString element =
    case element of
        Box          -> "box"
        Button       -> "button"
        Content      -> "content"
        Delete       -> "delete "
        Control      -> "control"
        Field        -> "field"
        Label        -> "label"
        Input        -> "input"
        Textarea     -> "textarea"
        Select       -> "select"
        Checkbox     -> "checkbox"
        Radio        -> "radio"
        Help         -> "help"
        Icon         -> "icon"
        Image        -> "image"
        Notification -> "notification"
        Progress     -> "progress"
        Table        -> "table"
        Tag          -> "tag"
        Title        -> "title"
        Subtitle     -> "subtitle"