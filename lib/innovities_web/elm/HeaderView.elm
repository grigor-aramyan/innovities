module HeaderView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Messages exposing (..)
import Models exposing (..)


headerView : Model -> Html Msg
headerView model =
  let
    po = model.pricingOpened
  in
    div [ class "headerStyle" ]
      [ div []
        [ div [ class "headerLogo" ] []
        , div [ style[ ("float", "right") ] ]
            [ a [ href "#", style [ ("color", "white") ] ] [ text "arm" ]
              , text " | "
              , a [ href "#", style [ ("color", "white") ] ] [ text "eng" ]
              ]
        ]
      , headerNavigationView po
      ]


headerNavigationView : PricingOpen -> Html Msg
headerNavigationView po =
  ul [ class "headerNavigationStyle" ]
    [ li [ style [ ("float", "left") ] ]
      [ a [ href "#innovators" ] [ text "Idea Generators" ]
      , span [ class "headerNavigationBar" ] [ text "|" ]
      ]
    , li [ style [ ("float", "left") ] ]
      [ a [ href "#organizations" ] [ text "Organizations" ]
      , span [ class "headerNavigationBar" ] [ text "|" ]
      ]
    , li [ style [ ("float", "left") ] ]
      [ a [ onClick OnPricingOpen ] [ text "Pricing ", span [ attribute "uk-icon" "icon: triangle-down" ] [] ]
      , pricingULView po
      , span [ class "headerNavigationBar" ] [ text "|" ]
      ]
    , li [ style [ ("float", "left") ] ]
      [ a [ href "#about-us" ] [ text "About us" ]
      , span [ class "headerNavigationBar" ] [ text "|" ]
      ]
    , li [ style [ ("float", "left") ] ]
      [ a [ href "#contacts" ] [ text "Contact" ]
      , span [ class "headerNavigationBar" ] [ text "|" ]
      ]
    , li [ style [ ("float", "left") ] ]
      [ a [ href "#faq" ] [ text "FAQ" ]
      , span [ class "headerNavigationBar" ] [ text "" ]
      ]
    ]

pricingULView : PricingOpen -> Html Msg
pricingULView po =
  let
    v =
      case po of
        Opened -> "visible"
        Closed -> "hidden"
  in
    ul [ style [ ("visibility", v), ("listStyleType", "none"), ("position", "absolute"), ("right", "47%"), ("top", "25%") ] ]
      [ li [] [ a [ onClick OnPricingClose, style [ ("color", "gold"), ("fontSize", "0.9em"), ("float", "left") ], href "#innovators-pricing" ] [ text "Idea Generators" ] ]
      , div [ class "whiteDividerStyle" ] []
      , li [] [ a [ onClick OnPricingClose, style [ ("color", "gold"), ("fontSize", "0.9em"), ("float", "left") ], href "#organizations-pricing" ] [ text "Organizations" ] ]
      ]
