module AboutUsView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Messages exposing (..)


aboutUsView : Html Msg
aboutUsView =
  div [ id "about-us", style [ ("margin", "auto"), ("width", "62%")] ]
    [ h3 [ style [("color", "gold")] ] [ text "About Us" ]
    , p [ style [("font-size", "small")] ] [ text "Tons of innovative ideas are born every day, even every hour, but are quite often not put into action as the right users in need of them are not easy to be found, or idea generators do not know how or whom to approach. On the other hand, there are a lot of companies/organizations seeking/looking for fresh, innovative ideas or solutions, but have limited resources and/or do not know where to find them." ]
    , p [ style [("font-size", "small")] ] [ text "That's where our platform provides a helping hand. Innovities is here to help connect both idea generators and companies who are looking for them." ]
    , p [ style [("font-size", "small")] ] [ text "You have a great idea or you need a solution for your business? Get registered and be a part of the world where ideas can turn into solution." ]
    ]
