module ChordFlashcards.Subscriptions exposing (subscriptions)

import Time exposing (Time, second)
import ChordFlashcards.Model exposing (Model)
import ChordFlashcards.Messages exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.timerRunning then
        Time.every second TimerTick
    else
        Sub.none
