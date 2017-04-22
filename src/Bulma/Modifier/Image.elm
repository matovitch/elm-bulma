module Bulma.Modifier.Image exposing (..)

import Html            as H
import Html.Attributes as HA

type Image =
    Is16x16   |
    Is24x24   |
    Is32x32   |
    Is48x48   |
    Is64x64   |
    Is96x96   |
    Is128x128 |
    Is1By1    |
    Is4By3    |
    Is3By2    |
    Is16By9   |
    Is2By1

toString : Image -> String
toString image =
    case image of
        Is16x16   -> "is-16x16"
        Is24x24   -> "is-24x24"
        Is32x32   -> "is-32x32"
        Is48x48   -> "is-48x48"
        Is64x64   -> "is-64x64"
        Is96x96   -> "is-96x96"
        Is128x128 -> "is-128x128"
        Is1By1    -> "is-1By1"
        Is4By3    -> "is-4By3"
        Is3By2    -> "is-3By2"
        Is16By9   -> "is-16By9"
        Is2By1    -> "is-2By1"

toHA : Image -> H.Attribute msg
toHA = HA.class << toString