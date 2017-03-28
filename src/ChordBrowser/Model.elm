module ChordBrowser.Model exposing (Model, init)


type alias Model =
    { selectedChord : String
    , selectedForm : String
    , selectedKey : String
    }


init : Model
init =
    { selectedChord = "Major"
    , selectedForm = "II"
    , selectedKey = "G"
    }
