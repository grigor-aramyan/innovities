module Networking exposing (..)

import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline as Pipeline exposing (..)
import Json.Encode as Encode exposing (..)
import Http exposing (..)

import Messages exposing (..)
import Models exposing (PromoRegistration)


api : String
api =
  "http://localhost:4000/api/"


promoRegisterUri : String
promoRegisterUri =
  api ++ "promo/registration"



-- CALLS


promoRegister : PromoRegistration -> Http.Request PromoRegistration
promoRegister promoData =
  let
    body =
      promoData
        |> promoDataEncoder
        |> Http.jsonBody
  in
    Http.post promoRegisterUri body promoDataDecoder


promoRegisterCmd : PromoRegistration -> Cmd Msg
promoRegisterCmd promoData =
  Http.send PromoRegistrationCallCompleted (promoRegister promoData)



-- ENCODERS

promoDataEncoder : PromoRegistration -> Encode.Value
promoDataEncoder promoData =
  Encode.object
    [ ("full_name", Encode.string promoData.full_name)
    , ("email", Encode.string promoData.email)
    , ("prefered_organization", Encode.string promoData.prefered_organization)
    , ("short_description", Encode.string promoData.short_description)]



-- DECODERS

promoDataDecoder : Decoder PromoRegistration
promoDataDecoder =
  let
    decoder =
      map5 PromoRegistration
        (Decode.field "full_name" Decode.string)
        (Decode.field "email" Decode.string)
        (Decode.field "prefered_organization" Decode.string)
        (Decode.field "short_description" Decode.string)
        (Decode.field "error" Decode.string)
  in
    at ["data"] decoder
