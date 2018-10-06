module ContactUsView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Messages exposing (..)


contactUsView : Html Msg
contactUsView =
  div [ id "contacts", style [("margin", "auto"), ("width", "50%")] ]
    [ h3 [ style [("color", "gold")] ] [ text "Contact us" ]
    , span []
      [ input [ style [("color", "black"), ("padding", "0.5em"), ("width", "20em"), ("margin-right", "1em")], placeholder "First Name" ] []
      , input [ style [("color", "black"), ("padding", "0.5em"), ("width", "20em"), ("margin-left", "1em")], placeholder "E-mail" ] []
      ]
    , textarea [ style [("width", "42em"), ("color", "black"), ("padding", "0.5em"), ("margin-top", "1em")], placeholder "Message", rows 4 ] []
    , br[][]
    , button [ class "subscribeButtonStyle", style [("padding", "1.5em"), ("padding-top", "0.5em"), ("padding-bottom", "0.5em")] ] [ text "Send" ]
    ]
