module App.Update exposing (update)

import App.Model exposing (Model)
import App.Messages exposing (..)
-- import App.Messages exposing (Msg)  -- NOT LIKE THIS!

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        -- TODO: Pass this along to the Browse update!
        BrowserMsg msg ->
            ( model, Cmd.none )

        -- make it: ({model | browse = ..update model.browse}, Cmd.none)
{-
    CHECK THIS PATTERN OUT THOUGH:

    CounterMsg counterMsg ->
        let
            ( counterModel, counterCmd ) =
                App.Counter.Update.update counterMsg model.counter
        in
            ( { model | counter = counterModel }
            , Cmd.map CounterMsg counterCmd -- AH HA! "wraps" message w/o the kid having to know anything about parent!
            )

    -- he sends back a tuple so he can do commands if need be! Fancy!

-}

