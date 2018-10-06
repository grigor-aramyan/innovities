module Models exposing (..)

import Routes exposing (Route)


type alias Model =
  { route : Route
  , pricingOpened : PricingOpen
  , getStartedOpened : Bool
  , loginOpened : Bool
  , registerIdeaGeneratorOpened : Bool
  , registerCompanyOpened : Bool
  , landingUsername : String
  , landingEmail : String
  , landingCompany : String
  , landingShortIdea : String
  , landingSignUpMobileVisible : Bool
  , landingUsernameError : String
  , landingEmailError : String
  , landingCompanyError : String
  , landingShortIdeaError : String
  , landingPromoRegisterError : String
  , landingInputFieldsVisible : Bool
  }

type alias PromoRegistration =
  { full_name : String
  , email : String
  , prefered_organization : String
  , short_description : String
  , error : String
  }

type PricingOpen =
  Opened
  | Closed
