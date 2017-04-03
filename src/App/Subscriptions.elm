module App.Subscriptions exposing (subscriptions)

import App.Model exposing (Model)
import App.Messages exposing (Msg(..))
import ChordFlashcards.Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    let
        timerSub =
            ChordFlashcards.Subscriptions.subscriptions model.flashcards
    in
        Sub.batch [ Sub.map FlashcardsMsg timerSub ]
