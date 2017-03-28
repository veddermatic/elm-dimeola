module Main exposing (main)

import Html exposing (program)
import App.Model exposing (init)
import App.View exposing (rootView)
import App.Update exposing (update)
import App.Subscriptions exposing (subscriptions)

main =
    program
    { init = init
    , view = rootView
    , update = update
    , subscriptions = subscriptions
    }
