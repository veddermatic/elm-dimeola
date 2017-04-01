module ChordFlashcards.Update exposing (update)

import ChordFlashcards.Model exposing (Model)
import ChordFlashcards.Messages exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
