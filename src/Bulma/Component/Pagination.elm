module Bulma.Component.Pagination exposing (..)

type Pagination =
    Root     |
    Previous |
    Next     |
    List     |
    Link     |
    Ellipsis

toString : Pagination -> String
toString pagination =
    case pagination of
        Root     -> "pagination"
        Previous -> "pagination-Previous"
        Next     -> "pagination-Next"
        List     -> "pagination-List"
        Link     -> "pagination-Link"
        Ellipsis -> "pagination-Ellipsis"