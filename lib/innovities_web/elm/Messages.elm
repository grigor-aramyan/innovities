module Messages exposing (..)

import Navigation exposing (Location)
import Http exposing (..)

import Models exposing (PromoRegistration)

type Msg =
  OnLocationChange Location
  | OnPricingOpen
  | OnPricingClose
  | OnGetStartedButtonsSwitch
  | OnLoginButtonSwitch
  | OnIdeaGeneratorRegistrationOpen
  | OnCompanyRegistrationOpen
  | OnLandingUsernameType String
  | OnLandingEmailType String
  | OnLandingCompanyType String
  | OnLandingShortIdeaType String
  | OnLandingSignUp
  | OnLandingSignUpMobileClick
  | PromoRegistrationCallCompleted (Result Http.Error PromoRegistration)
  | OnTestMessage
