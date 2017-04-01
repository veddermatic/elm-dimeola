module App.Messages exposing (Msg(..)) -- always export like so!

import Navigation exposing (Location)

import ChordBrowser.Messages
import ChordFlashcards.Messages

type Msg
    = NoOp
    | UrlChange Location
    | BrowserMsg ChordBrowser.Messages.Msg
    | FlashcardsMsg ChordFlashcards.Messages.Msg
    
