module App.Model exposing (Model, init)

import App.Messages exposing (Msg)

import ChordBrowser.Model
import ChordFlashcards.Model


type alias Model =
    { browser : ChordBrowser.Model.Model 
    , flashcards : ChordFlashcards.Model.Model
    }


initialModel : Model
initialModel =
    { browser = ChordBrowser.Model.init
    , flashcards = ChordFlashcards.Model.init
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )
