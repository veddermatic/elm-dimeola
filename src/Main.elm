module Main exposing (main)

import Navigation
import App.Model exposing (init, Model)
import App.Messages exposing (Msg(..))
import App.View exposing (rootView)
import App.Update exposing (update)
import App.Subscriptions exposing (subscriptions)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
    { init = init
    , view = rootView
    , update = update
    , subscriptions = subscriptions
    }
