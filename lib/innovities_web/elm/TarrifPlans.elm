module TarrifPlans exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Messages exposing (..)

organizationsPlan : Html Msg
organizationsPlan =
  div [ id "organizations-pricing", style [("margin-top", "5em")] ]
    [ h3 [ style [("color", "gold")] ] [ text "For Organizations" ]
    , br[][]
    , ul [ class "tarrifPlansStyle" ]
        [ organizationsTarrifListItem "Basic" "48" "548" "28" "5" "15" "Current country"
        , organizationsTarrifListItem "Plus" "76" "864" "48" "10" "30" "Current region"
        , organizationsTarrifListItem "Premium" "128" "1475" "61" "20" "50" "Current continent"
        , li [ style [("float", "left")] ]
            [ div [ class "tarrifBorderedItem", style [("height", "28.5em")] ]
                [ h4 [ class "tarrifBorderedTitle", style [("margin-top", "-1.2em"), ("background", "navy"), ("color", "white"), ("width", "4.5em"), ("margin-left", "1.5em")] ] [ text "Max" ]
                , p [ style [("color", "white"), ("text-align", "center"), ("margin-top", "-1.5em"), ("font-size", "98%")] ] [ text "(Enterprise)" ]
                , br [][]
                , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text "$216/mth" ]
                , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text "$2496/yr*" ]
                , p [ class "marginedSkyblue", style [ ("color", "gold") ] ] [ text "*save $96" ]
                , p [ class "smallWhiteCentered", style [ ("margin-top", "-0.8em"), ("font-size", "small") ] ] [ text "Ideas" ]
                , p [ class "smallWhiteCentered", style [ ("margin-top", "-1.8em"), ("font-size", "80%") ] ] [ text "(short version)" ]
                , p [ class "marginedSkyblue" ] [ text "All" ]
                , p [ class "smallWhiteCentered", style [ ("margin-top", "-0.8em"), ("font-size", "small") ] ] [ text "Ideas" ]
                , p [ class "smallWhiteCentered", style [ ("margin-top", "-1.8em"), ("font-size", "80%") ] ] [ text "(complete version)" ]
                , p [ class "marginedSkyblue" ] [ text "Up to 50" ]
                , p [ class "smallWhiteCentered", style [ ("font-size", "small"), ("margin-top", "-0.4em") ] ] [ text "Connect to" ]
                , p [ class "marginedSkyblue", style[ ("font-size", "120%"), ("margin-top", "1em") ] ] [ text "Unlimited" ]
                , p [ class "smallWhiteCentered", style [ ("font-size", "small"), ("margin-top", "-0.4em") ] ] [ text "Region" ]
                , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text "Worldwide" ]
                , button [ class "subscribeButtonStyle" ] [ text "Subscribe" ]
                ]
            ]
        ]
      , div [ class "wantMoreStyle" ]
          [ p [ style [("margin", "auto"), ("background", "teal"), ("width", "13em"), ("color", "white"), ("text-align", "center"), ("margin-top", "-0.8em")] ] [ text "Looking for more options?" ]
          , a [ href "#contacts", class "subscribeButtonStyle", style [("padding", "0.3em")] ] [ text "Contact us" ]
          ]
    ]


organizationsTarrifListItem : String -> String -> String -> String -> String -> String -> String -> Html Msg
organizationsTarrifListItem label mp yp sp cv ig region =
  li [ style [("float", "left"), ("margin-left", "2em")] ]
    [ div [ class "tarrifBorderedItem", style [("height", "28.5em")] ]
      [ h4 [ class "tarrifBorderedTitle", style [("margin-top", "-1.2em"), ("background", "navy"), ("color", "white")] ] [ text label ]
      , p [ style [("color", "white"), ("text-align", "center"), ("margin-top", "-1.5em"), ("font-size", "98%")] ] [ text "(Enterprise)" ]
      , br [][]
      , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text ("$" ++ mp ++ "/mth") ]
      , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text ("$" ++ yp ++ "/yr*") ]
      , p [ class "marginedSkyblue", style [ ("color", "gold") ] ] [ text ("*save $" ++ sp) ]
      , p [ class "smallWhiteCentered", style [ ("margin-top", "-0.8em"), ("font-size", "small") ] ] [ text "Ideas" ]
      , p [ class "smallWhiteCentered", style [ ("margin-top", "-1.8em"), ("font-size", "80%") ] ] [ text "(short version)" ]
      , p [ class "marginedSkyblue" ] [ text "All" ]
      , p [ class "smallWhiteCentered", style [ ("margin-top", "-0.8em"), ("font-size", "small") ] ] [ text "Ideas" ]
      , p [ class "smallWhiteCentered", style [ ("margin-top", "-1.8em"), ("font-size", "80%") ] ] [ text "(complete version)" ]
      , p [ class "marginedSkyblue" ] [ text ("Up to " ++ cv) ]
      , p [ class "smallWhiteCentered", style [ ("font-size", "small"), ("margin-top", "-0.4em") ] ] [ text "Connect to" ]
      , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text (ig ++ " idea") ]
      , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text "generators" ]
      , p [ class "smallWhiteCentered", style [ ("font-size", "small"), ("margin-top", "-0.4em") ] ] [ text "Region" ]
      , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text region ]
      , button [ class "subscribeButtonStyle" ] [ text "Subscribe" ]
      ]
    ]


ideaGeneratorsPlan : Html Msg
ideaGeneratorsPlan =
  div [ id "innovators-pricing", style [ ("margin-top", "32em")] ]
    [ h3 [ style [("color", "gold")] ] [ text "For Idea Generators" ]
    , ul [ class "tarrifPlansStyle" ]
      [ li [ style [("float", "left")] ]
        [ div [ class "tarrifBorderedItem" ]
          [ h4 [ class "tarrifBorderedTitle", style [("color", "white"), ("width", "4.5em"), ("margin-left", "1.5em")] ] [ text "Free plan" ]
          , p [ style[ ("color", "gold"), ("text-align", "center"), ("font-weight", "bold"), ("margin-top", "1.5em") ] ] [ text "Free" ]
          , p [ class "smallWhiteCentered", style [ ("margin-top", "2.4em"), ("font-size", "small") ] ] [ text "Ideas" ]
          , p [ class "marginedSkyblue" ] [ text "Up to 2" ]
          , p [ class "smallWhiteCentered", style [ ("font-size", "small") ] ] [ text "Connect to" ]
          , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text "1 organization" ]
          , p [ class "smallWhiteCentered", style [ ("font-size", "small") ] ] [ text "Region" ]
          , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text "Current country" ]
          , button [ class "subscribeButtonStyle" ] [ text "Subscribe" ]
          ]
        ]
      , innovatorsTarrifListItem "Basic" "8" "88" "8" "3" "3" "Current region"
      , innovatorsTarrifListItem "Plus" "14" "158" "10" "6" "5" "Current continent"
      , innovatorsTarrifListItem "Premium" "21" "238" "14" "8" "8" "Worldwide"
      ]
    , div [ class "wantMoreStyle" ]
      [ p [ style [("margin", "auto"), ("background", "navy"), ("width", "13em"), ("color", "white"), ("text-align", "center"), ("margin-top", "-0.8em")] ] [ text "Looking for more options?" ]
      , a [ href "#contacts", class "subscribeButtonStyle", style [("padding", "0.3em")] ] [ text "Contact us" ]
      ]
    ]

innovatorsTarrifListItem : String -> String -> String -> String -> String -> String -> String -> Html Msg
innovatorsTarrifListItem label mp yp sp ideas organizations region =
  li [ style [("float", "left"), ("margin-left", "2em")] ]
    [ div [ class "tarrifBorderedItem" ]
      [ h4 [ class "tarrifBorderedTitle", style [("color", "white")] ] [ text label ]
      , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text ("$" ++ mp ++ "/mth") ]
      , p [ class "marginedSkyblue", style [ ("color", "white") ] ] [ text ("$" ++ yp ++ "/yr*") ]
      , p [ class "marginedSkyblue", style [ ("color", "gold") ] ] [ text ("*save $" ++ sp) ]
      , p [ class "smallWhiteCentered", style [ ("font-size", "small") ] ] [ text "Ideas" ]
      , p [ class "marginedSkyblue" ] [ text ("Up to " ++ ideas) ]
      , p [ class "smallWhiteCentered", style [ ("font-size", "small") ] ] [ text "Connect to" ]
      , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text ( organizations ++ " organizations") ]
      , p [ class "smallWhiteCentered", style [ ("font-size", "small") ] ] [ text "Region" ]
      , p [ class "marginedSkyblue", style[ ("font-size", "120%") ] ] [ text region ]
      , button [ class "subscribeButtonStyle" ] [ text "Subscribe" ]
      ]
    ]
