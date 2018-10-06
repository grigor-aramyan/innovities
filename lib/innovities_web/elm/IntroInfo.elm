module IntroInfo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Messages exposing (..)
import Models exposing (..)


infoView : Model -> Html Msg
infoView model =
  let
    registerCompanyOpened = model.registerCompanyOpened
    registerIdeaGeneratorOpened = model.registerIdeaGeneratorOpened
  in
    div [ class "uk-flex uk-flex-middle" ]
      [ div [ class "uk-width-2-3" ]
        [ h1 [ style [ ("width", "50%"), ("font-weight", "bold"), ("text-align", "left"), ("padding-left", "0.5em"), ("padding-top", "0.5em") ] ] [ text "INNOVITIES WE TRUST" ]
        , p [ style [ ("font-size", "1em"), ("width", "42%"), ("text-align", "left"), ("color", "gold"), ("padding-left", "2.8em")] ] [ text "Innovities is a social platform where innovative ideas are found by those who need them."]
        ]
      , div [ class "uk-width-1-3" ]
        [ if registerCompanyOpened then registerCompanyView
            else if registerIdeaGeneratorOpened then registerIdeaGeneratorView
            else defaultView model
        ]
      ]

registerCompanyView : Html Msg
registerCompanyView =
  div []
    [ img [ style [("width", "12%"), ("height", "20%")], src "/images/case.png" ] []
    , p [ style [("font-size", "small"), ("margin-top", "3%")] ] [ text "Company" ]
    , div [ class "uk-flex uk-child-width-1-2" ]
      [ div []
        [ input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], placeholder "Company Name" ] []
        , input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], class "uk-margin-small-top", placeholder "Password" ] []
        ]
      , div []
        [ input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], placeholder "E-mail" ] []
        , input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], class "uk-margin-small-top", placeholder "Country" ] []
        ]
      ]
    , label [ class "uk-margin-small-top", style [("margin-left", "1em"), ("font-size", "80%"), ("color", "gold")] ]
      [ input [ type_ "checkbox", style [("margin-right", "0.3em")] ] []
      , text "I agree to the Terms of Service and understand the Privacy statement."
      ]
    , label [ style [("font-size", "80%"), ("color", "gold"), ("margin-right", "5.5em")] ]
      [ input [ type_ "checkbox", style [("margin-right", "0.3em")] ] []
      , text "Please email me your free weekly Innovation Newsletter."
      ]
    , button [ class "subscribeButtonStyle uk-margin-small-top", style [("padding", "2.5em"), ("padding-top", "0.3em"), ("padding-bottom", "0.3em")] ] [ text "Sign-Up" ]
    , p [ style [("font-size", "small")] ] [ text "OR CONNECT WITH" ]
    , img [ style [("margin-right", "0.8em"), ("width", "2.5em"), ("height", "2.5em")], src "/images/facebook_trans_icon.png" ] []
    , img [ style [("width", "2.5em"), ("height", "2.5em")], src "/images/google_plus_trans_icon.png" ] []
    ]


registerIdeaGeneratorView : Html Msg
registerIdeaGeneratorView =
  div []
    [ img [ style [("width", "8%"), ("height", "16%")], src "/images/head.png" ] []
    , p [ style [("font-size", "small"), ("margin-top", "3%")] ] [ text "Idea Generator" ]
    , div [ class "uk-flex uk-child-width-1-2" ]
      [ div []
        [ input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], placeholder "Name Surname" ] []
        , input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], class "uk-margin-small-top", placeholder "Password" ] []
        ]
      , div []
        [ input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], placeholder "E-mail" ] []
        , input [ style [("color", "cornflowerblue"), ("padding", "0.2em")], class "uk-margin-small-top", placeholder "Country" ] []
        ]
      ]
    , label [ class "uk-margin-small-top", style [("margin-left", "1em"), ("font-size", "80%"), ("color", "gold")] ]
      [ input [ type_ "checkbox", style [("margin-right", "0.3em")] ] []
      , text "I agree to the Terms of Service and understand the Privacy statement."
      ]
    , label [ style [("font-size", "80%"), ("color", "gold"), ("margin-right", "5.5em")] ]
      [ input [ type_ "checkbox", style [("margin-right", "0.3em")] ] []
      , text "Please email me your free weekly Innovation Newsletter."
      ]
    , button [ class "subscribeButtonStyle uk-margin-small-top", style [("padding", "2.5em"), ("padding-top", "0.3em"), ("padding-bottom", "0.3em")] ] [ text "Sign-Up" ]
    , p [ style [("font-size", "small")] ] [ text "OR CONNECT WITH" ]
    , img [ style [("margin-right", "0.8em"), ("width", "2.5em"), ("height", "2.5em")], src "/images/facebook_trans_icon.png" ] []
    , img [ style [("width", "2.5em"), ("height", "2.5em")], src "/images/google_plus_trans_icon.png" ] []
    ]

defaultView : Model -> Html Msg
defaultView model =
  let
    getStartedOpened = model.getStartedOpened
    getStartedButtonStyle =
      if getStartedOpened then
        style [("background", "grey")]
      else
        style [("background", "orange")]

    loginOpened = model.loginOpened
  in
    div []
      [ if loginOpened then div[][] else button [ onClick OnGetStartedButtonsSwitch, class "startButtonsStyle", getStartedButtonStyle ] [ text "GET STARTED!"]
      , if getStartedOpened && (not loginOpened) then getStartedView else br[][], br[][]
      , if loginOpened then loginView else button [ onClick OnLoginButtonSwitch, class "startButtonsStyle", style [("background", "cornflowerblue")] ] [ text "LOG IN" ]
      ]


loginView : Html Msg
loginView =
  div []
    [ input [ style [("color", "cornflowerblue"), ("padding", "0.5em")], placeholder "Username" ] []
    , br[][]
    , input [ style [("margin-top", "0.3em"), ("color", "cornflowerblue"), ("padding", "0.5em")], placeholder "Password" ] []
    , br[][], br[][]
    , button [ class "startButtonsStyle", style [("margin-left", "2em"), ("width", "10em"), ("background", "cornflowerblue")] ] [ text "LOG IN" ]
    , p [ style [("font-size", "small"), ("margin-left", "3.8em"), ("margin-top", "2em")] ] [ text "OR CONNECT WITH" ]
    , img [ style [("margin-left", "7em"), ("margin-right", "0.8em"), ("width", "2.5em"), ("height", "2.5em")], src "/images/facebook_icon.png" ] []
    , img [ style [("width", "2.5em"), ("height", "2.5em")], src "/images/linkedin_icon.png" ] []
    ]


getStartedView : Html Msg
getStartedView =
  div [ class "uk-flex uk-flex-center" ]
    [ a [ onClick OnIdeaGeneratorRegistrationOpen, class "uk-width-1-4", style [("margin-left", "1.5em")] ]
      [ div []
        [ img [ style [("width", "20%"), ("height", "40%"), ("margin-top", "10%")], src "/images/head.png" ] []
        , p [ style [("font-size", "small")] ] [ text "Idea Generator" ]
        ]
      ]
    , a [ onClick OnCompanyRegistrationOpen, class "uk-width-1-4", style [("margin-left", "1.5em")] ]
      [ div []
        [ img [ style [("width", "24%"), ("height", "40%"), ("margin-top", "21%")], src "/images/case.png" ] []
        , p [ style [("font-size", "small") ] ] [ text "Company" ]
        ]
      ]
    ]
