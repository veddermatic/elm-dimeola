module App.Messages exposing (Msg(..)) -- always export like so!

import ChordBrowser.Messages
import ChordFlashcards.Messages

type Msg
    = NoOp
    | BrowserMsg ChordBrowser.Messages.Msg
    | FlashcardsMsg ChordFlashcards.Messages.Msg
    
