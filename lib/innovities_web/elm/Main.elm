module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Navigation exposing (Location)

import Messages exposing (..)
import Routes exposing (..)
import Models exposing (..)
import TarrifPlans exposing (..)
import TopMembersList exposing (..)
import AboutUsView exposing (..)
import ContactUsView exposing (..)
import FaqView exposing (..)
import FooterView exposing (..)
import HeaderView exposing (..)
import IntroInfo exposing (..)
import LandingPageView exposing (..)
import Networking exposing (..)
import Ports exposing (..)
import TestView exposing (testView)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }


init : Location -> (Model, Cmd Msg)
init location =
    let
      currentRoute =
        parseLocation location
    in
      ( initialModel currentRoute, Cmd.none )

initialModel : Route -> Model
initialModel route =
    Model route Closed False False False False "" "" "" "" False "" "" "" "" "" True


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        PromoRegistrationCallCompleted promoRegData ->
          case promoRegData of
            Ok promoRegData ->
              if (String.length promoRegData.error == 0) then
                ( { model | landingInputFieldsVisible = False }, showPromoRegistrationConfirmDialog "" )
              else
                ( { model | landingPromoRegisterError = promoRegData.error }, Cmd.none )
            Err error ->
              ( { model | landingPromoRegisterError = "Չսպասված սխալ գրանցման ժամանակ: Կապվեք մեզ հետ, խնդրեմ" }, Cmd.none )
        OnLandingSignUpMobileClick ->
          ( { model | landingSignUpMobileVisible = True }, Cmd.none )
        OnLandingSignUp ->
          let
            username = model.landingUsername
            email = model.landingEmail
            prefOrganization = model.landingCompany
            shortIdea = model.landingShortIdea


            usernameError =
              if (String.isEmpty username) then
                "Պարտադիր է լրացնել"
              else
                ""

            emailError =
              if (String.isEmpty email) then
                "Պարտադիր է լրացնել"
              else if (not ((String.contains "@" email) && (String.contains "." email))) then
                "Էլ. հասցեի ֆորմատը սխալ է"
              else
                ""

            cmd =
              if (String.isEmpty usernameError && String.isEmpty emailError && String.isEmpty model.landingCompanyError && String.isEmpty model.landingShortIdeaError) then
                promoRegisterCmd (PromoRegistration username email prefOrganization shortIdea "")
              else
                Cmd.none
          in
            ( { model | landingUsernameError = usernameError, landingEmailError = emailError }, cmd )
        OnLandingShortIdeaType shortIdea ->
          let
            ideaError =
              if (String.length shortIdea) > 200 then
                "Առավելագույնը 200 նիշ:"
              else
                ""
          in
            ( { model | landingShortIdea = shortIdea, landingShortIdeaError = ideaError }, Cmd.none )
        OnLandingCompanyType company ->
          let
            companyError =
              if (String.length company) > 30 then
                "Առավելագույնը 30 նիշ:"
              else
                ""
          in
            ( { model | landingCompany = company, landingCompanyError = companyError }, Cmd.none )
        OnLandingEmailType email ->
          ( { model | landingEmail = email }, Cmd.none )
        OnLandingUsernameType name ->
          ( { model | landingUsername = name }, Cmd.none )
        OnIdeaGeneratorRegistrationOpen ->
          ( { model | registerIdeaGeneratorOpened = True }, Cmd.none )
        OnCompanyRegistrationOpen ->
          ( { model | registerCompanyOpened = True }, Cmd.none )
        OnLoginButtonSwitch ->
          ( { model | loginOpened = not model.loginOpened }, Cmd.none )
        OnGetStartedButtonsSwitch ->
          ( { model | getStartedOpened = not model.getStartedOpened }, Cmd.none )
        OnPricingClose ->
          ( { model | pricingOpened = Closed }, Cmd.none )
        OnPricingOpen ->
          let
            reverted =
              case model.pricingOpened of
                Opened -> Closed
                Closed -> Opened
          in
            ( { model | pricingOpened = reverted }, Cmd.none )
        OnLocationChange location ->
          let
            newRoute =
              parseLocation location
          in
            ( { model | route = newRoute }, Cmd.none)
        OnTestMessage ->
          ( model, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
    div [ class "uk-height-large" ]
    [ div [ class "uk-container", style [("paddingTop", "12px")] ]
      [ page model
      ]
    ]

page : Model -> Html Msg
page model =
  let
    currentRoute = model.route
  in
    case currentRoute of
      HomeRoute ->
        landingView model
      NotFoundRoute ->
        div [] [ text "not found" ]



homeView : Model -> Html Msg
homeView model =
  div []
    [ headerView model
    , br [][], br [][], br [][]
    , infoView model
    , ideaGeneratorsPlan
    , organizationsPlan
    , innovatorsList model
    , organizationsList model
    , br[][], br[][], br[][]
    , aboutUsView
    , br[][], br[][], br[][]
    , contactUsView
    , br[][], br[][], br[][]
    , faqView
    , br[][], br[][], br[][]
    , br[][], br[][], br[][]
    , br[][], br[][], br[][]
    , br[][], br[][]
    , footerView
    ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
