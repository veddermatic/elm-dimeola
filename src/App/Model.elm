module App.Model exposing (Model, init, Page(..), pageFromHash)

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


initialModel : String ->  Model
initialModel locationHash =
    { page = pageFromHash locationHash 
    , browser = ChordBrowser.Model.init
    , flashcards = ChordFlashcards.Model.init
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( initialModel location.hash, Cmd.none )


pageFromHash : String -> Page
pageFromHash hash =
    case hash of
        "#flashcards" ->
            FlashcardPage

        "#browse" ->
            BrowsePage

        _ ->
            BrowsePage
