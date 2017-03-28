module ChordFlashcards.Model exposing (Model, init)


type alias Model =
    { currentChord : String
    , currentForm : String
    , currentKey : String
    , selectedChords : List String
    , selectedForms : List String
    , selectedKeys : List String
    }


init : Model
init =
    { currentChord = ""
    , currentForm = ""
    , currentKey = ""
    , selectedChords = []
    , selectedForms = []
    , selectedKeys = []
    }

