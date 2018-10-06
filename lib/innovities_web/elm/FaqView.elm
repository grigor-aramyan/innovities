module FaqView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Messages exposing (..)


faqView : Html Msg
faqView =
  div [ id "faq", style [ ("margin", "auto"), ("width", "62%")]]
    [ h3 [ style [("color", "gold")] ] [ text "FAQ" ]
    , p [ style [("font-size", "small")] ] [ text "Tons of innovative ideas are born every day, even every hour, but are quite often not put into action as the right users in need of them are not easy to be found, or idea generators do not know how or whom to approach. On the other hand, there are a lot of companies/organizations seeking/looking for fresh, innovative ideas or solutions, but have limited resources and/or do not know where to find them." ]
    ]
