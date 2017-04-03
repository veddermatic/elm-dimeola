module App.Update exposing (update)

import App.Model exposing (Model, Page(..), pageFromHash)
import App.Messages exposing (..)
import ChordBrowser.Update as BrowserUpdate
import ChordFlashcards.Update as FlashcardUpdate
import ChordFlashcards.Messages as FlashcardMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UrlChange location ->
            let
                newPage =
                    pageFromHash location.hash

                ( newFlashcards, _ ) =
                    FlashcardUpdate.update FlashcardMsg.StopTimer model.flashcards
            in
                ( { model
                    | page = newPage
                    , flashcards = newFlashcards
                  }
                , Cmd.none
                )

        BrowserMsg browserMsg ->
            let
                ( browserModel, browserCmd ) =
                    BrowserUpdate.update browserMsg model.browser
            in
                ( { model | browser = browserModel }
                , Cmd.map BrowserMsg browserCmd
                )

        FlashcardsMsg flashcardMsg ->
            let
                ( flashcardModel, flashcardCmd ) =
                    FlashcardUpdate.update flashcardMsg model.flashcards
            in
                ( { model | flashcards = flashcardModel }
                , Cmd.map FlashcardsMsg flashcardCmd
                )
