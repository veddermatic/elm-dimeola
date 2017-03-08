module ChordBook exposing (..)

import Html exposing (Html, text, li, ul, div, program)
import Html.Attributes exposing (..)
import Messages exposing (Msg(..))

import Chords.Views as Chords 


-- MODEL

type alias Model =
    { selectedChord: String
    , selectedForm: String
    , selectedKey: String
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

update: Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SelectChord chord ->
            ( { model | selectedChord = chord }, Cmd.none )

        SelectForm form ->
            ( { model | selectedForm = form }, Cmd.none )


chordInfo : Model -> String
chordInfo model =
    "Form " ++ model.selectedForm ++ " : " ++ model.selectedChord

-- VIEW
view: Model -> Html Msg
view model =
    div [ style [("display", "flex")
                , ("justify-content", "space-around")
                , ("font-family", "Helvetica")
                ] 
        ]
        [ ul [] Chords.chordListView
        , ul [] Chords.formListView
        , Chords.chordDiagram model.selectedForm model.selectedChord
        , div [] [ text (chordInfo model) ]
        ]


-- SUBSCRIPTIONS
subscriptions: Model -> Sub Msg
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
