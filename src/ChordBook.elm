module ChordBook exposing (..)

import Html exposing (Html, text, div, program, h1)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))
import Chords.Views as Chords
import Pickers.Views as Pickers
import PageElements.Views as PageEls


-- MODEL


type alias Model =
    { selectedChord : String
    , selectedForm : String
    , selectedKey : String
    }



-- outputs the default model for our init function


initialModel : Model
initialModel =
    { selectedChord = "Major"
    , selectedForm = "II"
    , selectedKey = "G"
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SelectChord chord ->
            ( { model | selectedChord = chord }, Cmd.none )

        SelectForm form ->
            ( { model | selectedForm = form }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "appContainer" ]
        [ PageEls.pageHeader
        , div
            [ class "contentPane" ]
            [ Pickers.pickerViews model.selectedForm model.selectedChord
            , Chords.chordDiagram model.selectedForm model.selectedChord
            ]
        , PageEls.pageFooter
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
