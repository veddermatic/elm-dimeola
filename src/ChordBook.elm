module ChordBook exposing (..)

import Html exposing (Html, text, li, ul, div, program)
import Messages exposing (Msg(..))

import Chords.Views as Chords 


-- MODEL

type alias Model =
    { selectedChord: String
    , selectedPosition: String
    , selectedKey: String
    }

-- outputs the default model for our init function
initialModel : Model
initialModel = 
    { selectedChord = "7"
    , selectedPosition = "I"
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



-- VIEW
view: Model -> Html Msg
view model =
    div []
        [ ul [] ( Chords.chordListView model.selectedKey ) 
        , Chords.chordDiagram model.selectedPosition model.selectedChord
        , div [] [ text model.selectedChord ]
        , div [] [ text model.selectedKey ]
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
