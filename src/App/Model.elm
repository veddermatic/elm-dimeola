module App.Model exposing (Model, init, Page(..))

import Navigation
import App.Messages exposing (Msg)

import ChordBrowser.Model
import ChordFlashcards.Model


type Page
    = BrowsePage
    | FlashcardPage

    
type alias Model =
    { page : Page
    , browser : ChordBrowser.Model.Model 
    , flashcards : ChordFlashcards.Model.Model
    }


initialModel : Model
initialModel =
    { page = BrowsePage 
    , browser = ChordBrowser.Model.init
    , flashcards = ChordFlashcards.Model.init
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( initialModel, Cmd.none )
