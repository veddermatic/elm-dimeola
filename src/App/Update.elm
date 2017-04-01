module App.Update exposing (update)

import App.Model exposing (Model, Page(..))
import App.Messages exposing (..)


-- import App.Messages exposing (Msg)  -- NOT LIKE THIS!

import ChordBrowser.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UrlChange location ->
            ( { model | page = pageFromHash location.hash }
            , Cmd.none
            )

        BrowserMsg browserMsg ->
            let
                ( browserModel, browserCmd ) =
                    ChordBrowser.Update.update browserMsg model.browser
            in
                ( { model | browser = browserModel }
                , Cmd.map BrowserMsg browserCmd
                )

        FlashcardsMsg msg ->
            ( model, Cmd.none )


pageFromHash : String -> Page
pageFromHash hash =
    case hash of
        "#flashcards" ->
            FlashcardPage

        "#browse" ->
            BrowsePage

        _ ->
            BrowsePage



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
