module App.Messages exposing (Msg(..)) -- always export like so!

import ChordBrowser.Messages

type Msg
    = NoOp
    | BrowserMsg ChordBrowser.Messages.Msg
    
