module TopMembersList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Messages exposing (..)
import Models exposing (..)


organizationsList : Model -> Html Msg
organizationsList model =
  div [ id "organizations", style [("margin-top", "5em")] ]
    [ h3 [ style [("color", "gold")] ] [ text "Organisations" ]
    , ul [ class "tarrifPlansStyle", style [("width", "75%"), ("margin-top", "4em")] ]
      [ organizationsListItem "My Company" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." "USA"
      , organizationsListItem "Friends' Company" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." "Armenia"
      , organizationsListItem "Families Firm" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." "Russia"
      ]
    ]

organizationsListItem : String -> String -> String -> Html Msg
organizationsListItem name bio country =
  li [ style [("float", "left"), ("margin-left", "3em")] ]
    [ div [ class "tarrifBorderedItem", style [("width", "16em"), ("height", "23em")] ]
      [ span [ attribute "uk-icon" "icon: mail; ratio: 2", style [("margin-left", "0.4em"), ("color", "gold"), ("float", "left")] ] []
      , img [ class "marginedUpRoundedImage", src "https://conferencesolutions.com/wp-content/uploads/2017/03/logo-1.png" ] []
      , p [ class "smallWhiteCentered", style [("font-size", "110%"), ("margin-left", "0.8em"), ("margin-right", "0.8em")] ] [ text name ]
      , p [ class "smallWhiteCentered", style [("font-size", "small"), ("margin-left", "0.8em"), ("margin-right", "0.8em")] ] [ text bio ]
      , addressView country False
      ]
    ]


innovatorsList : Model -> Html Msg
innovatorsList model =
  div [ id "innovators", style [("margin-top", "5em")] ]
    [ h3 [ style [("color", "gold"), ("font-weight", "bold")] ] [ text "Innovators" ]
    , ul [ class "tarrifPlansStyle", style [("width", "75%"), ("margin-top", "4em")] ]
      [ innovatorsListItem "Alan Moby" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." 3 "USA"
      , innovatorsListItem "Parker Smith" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." 4 "Armenia"
      , innovatorsListItem "Jonathan Nathal" "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were." 5 "Russia"
      ]
    ]

innovatorsListItem : String -> String -> Int -> String -> Html Msg
innovatorsListItem name bio rating country =
  li [ style [("float", "left"), ("margin-left", "3em")] ]
    [ div [ class "tarrifBorderedItem", style [("width", "16em"), ("height", "23em")] ]
      [ span [ attribute "uk-icon" "icon: mail; ratio: 2", style [("margin-left", "0.4em"), ("color", "gold"), ("float", "left")] ] []
      , img [ class "marginedUpRoundedImage", src "https://www.bea-sensors.com/wp/wp-content/uploads/2016/10/user_profile_male.jpg" ] []
      , p [ class "smallWhiteCentered", style [("font-size", "110%"), ("margin-left", "0.8em"), ("margin-right", "0.8em")] ] [ text name ]
      , p [ class "smallWhiteCentered", style [("font-size", "small"), ("margin-left", "0.8em"), ("margin-right", "0.8em")] ] [ text bio ]
      , ratingStarsView rating
      , addressView country True
      ]
    ]

addressView : String -> Bool -> Html Msg
addressView country forInnovators =
  let
    rightFloat =
      style [ ("float", "right"), ("margin-right", "0.8em"), ("margin-down", "0.8em") ]
    centerAlign =
      style [ ("margin-down", "0.8em") ]
  in
    div [ if forInnovators then rightFloat else centerAlign ]
      [ span [ attribute "uk-icon" "location", style [("color", "gold")] ] []
      , span [ style [("font-size", "small"), ("color", "gold") ] ] [ text country ]
      ]

ratingStarsView : Int -> Html Msg
ratingStarsView rating =
  let
    styled =
      style [("color", "gold")]
    styledDefault =
      style [("color", "white")]
  in
    div [ style [("float", "left"), ("margin-left", "0.8em"), ("margin-down", "0.8em")] ]
      [ span [ attribute "uk-icon" "star", if rating >= 1 then styled else styledDefault ] []
      , span [ attribute "uk-icon" "star", if rating >= 2 then styled else styledDefault ] []
      , span [ attribute "uk-icon" "star", if rating >= 3 then styled else styledDefault ] []
      , span [ attribute "uk-icon" "star", if rating >= 4 then styled else styledDefault ] []
      , span [ attribute "uk-icon" "star", if rating >= 5 then styled else styledDefault ] []
      ]
