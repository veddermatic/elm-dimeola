module ChordFlashcards.View exposing (rootView)

import Html exposing (Html, div, text)
import Html.Attributes exposing (..)
import ChordFlashcards.Messages exposing (..)
import ChordFlashcards.Model exposing (..)


rootView : Model -> Html Msg
rootView model =
    div [ class "contentPane" ]
        [ text "Pretend I am a flashcard thing!" ]
