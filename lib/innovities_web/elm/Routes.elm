module Routes exposing (..)

import UrlParser as UP exposing (..)
import Navigation exposing (Location)

type Route =
  HomeRoute
  | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
  UP.oneOf
      [ UP.map HomeRoute top
      , UP.map HomeRoute (UP.s "innovators")
      , UP.map HomeRoute (UP.s "organizations")
      , UP.map HomeRoute (UP.s "innovators-pricing")
      , UP.map HomeRoute (UP.s "organizations-pricing")
      , UP.map HomeRoute (UP.s "about-us")
      , UP.map HomeRoute (UP.s "contacts")
      , UP.map HomeRoute (UP.s "faq") ]


parseLocation : Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route ->
      route

    Nothing ->
      NotFoundRoute
