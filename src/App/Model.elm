module App.Model exposing (Model, init)

import App.Messages exposing (Msg)

import ChordBrowser.Model


type alias Model =
    { browser : ChordBrowser.Model.Model }


initialModel : Model
initialModel =
    { browser = ChordBrowser.Model.init }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )
