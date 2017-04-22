module Hello exposing (main)

import Html.Attributes as HA
import Html.Events     as HE
import Html            as H

import Bulma.TabsItem as B_TabsItem exposing (tabsItem)
import Bulma.Checkbox as B_Checkbox exposing (checkbox)
import Bulma.Content  as B_Content  exposing (content)
import Bulma.Section  as B_Section  exposing (section)
import Bulma.Button   as B_Button   exposing (button)
import Bulma.Delete   as B_Delete   exposing (delete)
import Bulma.Select   as B_Select   exposing (select)
import Bulma.Input    as B_Input    exposing (input)
import Bulma.Radio    as B_Radio    exposing (radio)
import Bulma.Help     as B_Help     exposing (help)
import Bulma.Icon     as B_Icon     exposing (icon)
import Bulma.Tabs     as B_Tabs     exposing (tabs)
import Bulma.Box      as B_Box      exposing (box)

import Bulma.Modifier.Tabs as B_M_Tabs 

import Bulma.Modifier.Color as B_M_Color
import Bulma.Modifier.State as B_M_State
import Bulma.Modifier.Size  as B_M_Size

import Maybe

type Message = 
    Email String |
    Send         |
    Yes          |
    No           |
    Shannon      |
    Church       |
    Turing

main =
    let
        envelopeIcon = { icon | name = "envelope" }

        sendTabsItem = { tabsItem | content   = [ H.a [] [H.text "Send"] ],
                                    isActive  = True }

        cancelTabsItem = { tabsItem | content  = [ H.a [] [H.text "Cancel"] ] }

        topTabs = { tabs | items     = [ sendTabsItem, cancelTabsItem ],
                           modifiers = [ B_M_Tabs.Centered, B_M_Tabs.Boxed ] }

        sendButton = { button | color   = B_M_Color.Info,
                                size    = B_M_Size.Large,
                                icon    = Maybe.Just envelopeIcon,
                                message = Maybe.Just Send,
                                content = [ H.p [] [H.text "Send"] ] }

        someContent = 
            B_Content.Content B_M_Size.Small []
                [
                    H.h1 [] [ H.text "Some Content..." ],
                    H.p []
                        [
                            H.text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."
                        ],
                    H.table []
                        [ H.thead []
                            [ H.tr []
                                [ H.th []
                                    [ H.text "One" ]
                                , H.th []
                                    [ H.text "Two" ]
                                ]
                            ]
                        , H.tbody []
                            [ H.tr []
                                [ H.td []
                                    [ H.text "Three" ]
                                , H.td []
                                    [ H.text "Four" ]
                                ]
                            , H.tr []
                                [ H.td []
                                    [ H.text "Five" ]
                                , H.td []
                                    [ H.text "Six" ]
                                ]
                            ]
                        ]
                ]

        sendBox = { box | content = [ B_Content.toHTML someContent, B_Button.toHTML sendButton ] }

        anHelp = { help | color   = B_M_Color.Success,
                          content = [ H.p [] [H.text "Is it helping ?"] ] }

        anInput = { input | label      = "Email",
                            iconLeft   = Maybe.Just envelopeIcon,
                            help       = Maybe.Just anHelp,
                            message    = Maybe.Just Email,
                            attributes = [ HA.placeholder "email" ] }

        aSelect = { select | size       = B_M_Size.Large,
                             label      = "CS Master",
                             options    = [ ("Shannon", Shannon),
                                            ("Church" , Church),
                                            ("Turing" , Turing)] }

        aCheckbox = { checkbox | content = ([ H.text " A simple " ] ++ [H.a [] [H.text "checkbox..."]]) }

        aDelete = { delete | size = B_M_Size.Large }


        aRadio  = { radio | label = "Yes or No ?", 
                            name = "YesOrNo",
                            isHorizontal = True,
                            contents =  [ ([ H.text " Yes" ], Yes), 
                                          ([ H.text " No"  ], No) ] }

        aSection = 
            B_Section.Section []
                [
                    B_Box.toHTML      sendBox,
                    B_Input.toHTML    anInput,
                    B_Select.toHTML   aSelect,
                    B_Checkbox.toHTML aCheckbox,
                    B_Radio.toHTML    aRadio,
                    B_Delete.toHTML   aDelete
                ]


    in
        H.div []
            [
                B_Tabs.toHTML    topTabs,
                B_Section.toHTML aSection
            ]