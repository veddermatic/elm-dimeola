module ChordBrowser.Update exposing (update)

import ChordBrowser.Model exposing (Model)
import ChordBrowser.Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectChord chord ->
            ( { model | selectedChord = chord }, Cmd.none )

        SelectForm form ->
            ( { model | selectedForm = form }, Cmd.none )
