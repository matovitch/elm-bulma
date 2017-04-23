module Hello exposing (main)

import Html.Attributes as HA
import Html.Events     as HE
import Html            as H

import Bulma.Notification as B_Notification exposing (notification)
import Bulma.TabsItem     as B_TabsItem     exposing (tabsItem)
import Bulma.Textarea     as B_Textarea     exposing (textarea)
import Bulma.Checkbox     as B_Checkbox     exposing (checkbox)
import Bulma.Subtitle     as B_Subtitle     exposing (subtitle)
import Bulma.Content      as B_Content      exposing (content)
import Bulma.Section      as B_Section      exposing (section)
import Bulma.Buttons      as B_Buttons      exposing (buttons)
import Bulma.Button       as B_Button       exposing (button)
import Bulma.Delete       as B_Delete       exposing (delete)
import Bulma.Select       as B_Select       exposing (select)
import Bulma.Image        as B_Image        exposing (image)
import Bulma.Input        as B_Input        exposing (input)
import Bulma.Radio        as B_Radio        exposing (radio)
import Bulma.Table        as B_Table        exposing (table)
import Bulma.Title        as B_Title        exposing (title)
import Bulma.Help         as B_Help         exposing (help)
import Bulma.Icon         as B_Icon         exposing (icon)
import Bulma.Tabs         as B_Tabs         exposing (tabs)
import Bulma.Box          as B_Box          exposing (box)
import Bulma.Tag          as B_Tag          exposing (tag)

import Bulma.Modifier.Image  as B_M_Image 
import Bulma.Modifier.Color  as B_M_Color
import Bulma.Modifier.State  as B_M_State
import Bulma.Modifier.Table  as B_M_Table
import Bulma.Modifier.Title  as B_M_Title
import Bulma.Modifier.Size   as B_M_Size
import Bulma.Modifier.Tabs   as B_M_Tabs

import Maybe
import Dict


type CSMaster =
    Shannon      |
    Church       |
    Turing

type YesOrNo =
    Yes |
    No

type Message = 
    SelectCSMaster CSMaster |
    RadioYesOrNo YesOrNo    |
    TextareaComment String  |
    InputEmail String       |
    ButtonCancel            |
    ButtonSend              |
    Checkbox       

main =
    let
        envelopeIcon = { icon | name = "envelope" }
        trashIcon    = { icon | name = "trash" }

        sendTabsItem = { tabsItem | name     = "Send",
                                    icon     = Maybe.Just envelopeIcon,
                                    isActive = True }

        cancelTabsItem = { tabsItem | name = "Cancel" }

        topTabs = { tabs | items     = [ sendTabsItem, cancelTabsItem ],
                           modifiers = [ B_M_Tabs.Centered ],
                           size      = B_M_Size.Large }

        sendButton = { button | color      = B_M_Color.Success,
                                size       = B_M_Size.Medium,
                                icon       = Maybe.Just envelopeIcon,
                                attributes = [ HE.onClick ButtonSend ],
                                content    = [ H.p [] [H.text "Send"] ] }

        cancelButton = { button | states  = [ B_M_State.Disabled ],
                                  size    = B_M_Size.Medium,
                                  icon    = Maybe.Just trashIcon,
                                  attributes = [ HE.onClick ButtonCancel ],
                                  content = [ H.p [] [H.text "Cancel"] ] }

        someContent = 
            B_Content.Content B_M_Size.Medium []
                [
                    H.h1 [] [ H.text "Some Content..." ],
                    H.p []
                        [
                            H.text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."
                        ],
                    B_Table.toHTML
                        (
                            B_Table.Table [ B_M_Table.Narrow, B_M_Table.Bordered ] []
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
                        )
                ]

        aComment = { textarea | label = "Comment",
                                attributes = [ HA.placeholder "Something to say ?",
                                               HE.onInput TextareaComment ] }

        aNotif = { notification | color   = B_M_Color.Info,
                                  message = "Have you seen this amazing info notif ?" }

        anHelp = { help | color   = B_M_Color.Success,
                          content = [ H.p [] [H.text "Is it helping ?"] ] }

        anInput = { input | label      = "Email",
                            iconLeft   = Maybe.Just envelopeIcon,
                            help       = Maybe.Just anHelp,
                            attributes = [ HE.onInput InputEmail,
                                           HA.placeholder "email" ] }

        sendBox = { box | content = [ B_Content.toHTML someContent, 
                                      B_Textarea.toHTML aComment,
                                      B_Buttons.toHTML [sendButton, cancelButton] ] }

        aSelect = { select | size    = B_M_Size.Large,
                             label   = "CS Master",
                             options = Dict.fromList [("Shannon", SelectCSMaster Shannon),
                                                      ("Church" , SelectCSMaster Church),
                                                      ("Turing" , SelectCSMaster Turing)] }

        aCheckbox = { checkbox | content = ([ H.text " A simple " ] ++ [H.a [] [H.text "checkbox..."]]), 
                                 attributes = [ HE.onClick Checkbox ] }

        aRadio  = { radio | label = "Yes or No ?", 
                            name = "YesOrNo",
                            isHorizontal = False,
                            contents =  [ ([ H.text " Yes" ], RadioYesOrNo Yes), 
                                          ([ H.text " No"  ], RadioYesOrNo No) ] }

        anImage = { image | format     = Just B_M_Image.Is128x128,
                            attributes = [ HA.src "bauda.svg" ] }

        aTag = { tag | color   = B_M_Color.Danger,
                       message = "red tag"  }

        aTitle = { title | kind = B_M_Title.Is2, 
                           name = "Title 2" }

        aSubtitle = { subtitle | kind = B_M_Title.Is2, 
                                 name = "Subtitle 2" }

        aSection = 
            B_Section.Section []
                [
                    B_Notification.toHTML aNotif,
                    B_Box.toHTML          sendBox,
                    B_Input.toHTML        anInput,
                    B_Select.toHTML       aSelect,
                    B_Checkbox.toHTML     aCheckbox,
                    B_Radio.toHTML        aRadio,
                    B_Image.toHTML        anImage,
                    B_Tag.toHTML          aTag,
                    B_Title.toHTML        aTitle,
                    B_Subtitle.toHTML     aSubtitle
                ]
    in
        H.div []
            [
                B_Tabs.toHTML    topTabs,
                B_Section.toHTML aSection
            ]