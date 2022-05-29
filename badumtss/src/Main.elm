port module Main exposing (main)

import Browser
import Browser.Events exposing (onKeyPress)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Json.Decode as Decode


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Int


type Msg
    = CharacterKey Char
    | ControlKey String


subscriptions : Model -> Sub Msg
subscriptions _ =
    onKeyPress keyDecoder



-- why do you use map, when there is only one value?


keyDecoder : Decode.Decoder Msg
keyDecoder =
    Decode.map toKey (Decode.field "key" Decode.string)


toKey : String -> Msg
toKey keyValue =
    case String.uncons keyValue of
        Just ( char, "" ) ->
            CharacterKey char

        _ ->
            ControlKey keyValue


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CharacterKey 'j' ->
            ( model, playAudio "j" )

        CharacterKey 'k' ->
            ( model, playAudio "k" )

        CharacterKey 'i' ->
            ( model + 1, playAudio "i" )

        _ ->
            ( model, Cmd.none )


port playAudio : String -> Cmd msg


view : Model -> Html Msg
view model =
    div []
        [ text <| String.fromInt model
        , div [ class "keys" ]
            [ button [ class "key", onClick (CharacterKey 'j') ] [ text "J" ]
            , button [ class "key", onClick (CharacterKey 'k') ] [ text "K" ]
            , button [ class "key", onClick (CharacterKey 'i') ] [ text "I" ]
            ]
        ]



{-
   subscriptions2 : Model -> Sub Msg
   subscriptions2 _ =
       onKeyPress (Decode.succeed KeyPressed)
-}
