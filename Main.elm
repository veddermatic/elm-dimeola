module Main exposing (main)

import Html exposing (program)
import ChordBook

main =
    program
    { init = ChordBook.init
    , view = ChordBook.view
    , update = ChordBook.update
    , subscriptions = ChordBook.subscriptions
    }
