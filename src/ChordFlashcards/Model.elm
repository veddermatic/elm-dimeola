module ChordFlashcards.Model exposing (Model, init, CardState(..))


type CardState
    = ChordName
    | Diagram

type alias Model =
    { currentChord : Maybe String
    , currentForm : Maybe String
    , currentKey : Maybe String
    , selectedChords : List String
    , selectedForms : List String
    , selectedKeys : List String
    , chordsToShow : List String
    , timerRunning : Bool
    , timerTick : Int
    , showForSeconds : Int
    , cardState : CardState
    }


init : Model
init =
    { currentChord = Nothing
    , currentForm = Nothing
    , currentKey = Nothing
    , selectedChords = []
    , selectedForms = []
    , selectedKeys = []
    , chordsToShow = []
    , timerRunning = False
    , timerTick = 0
    , showForSeconds = 5
    , cardState = ChordName
    }

