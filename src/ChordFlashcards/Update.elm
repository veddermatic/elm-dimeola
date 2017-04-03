module ChordFlashcards.Update exposing (update)

import Random exposing (generate, Generator, pair)
import Random.List exposing (choose)
import ChordFlashcards.Model exposing (Model, CardState(..))
import ChordFlashcards.Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartTimer ->
            ( { model | chordsToShow = model.selectedChords }
            , generate NewCardData (choosePairGenerator model.selectedChords model.selectedForms)
            )

        StopTimer ->
            ( { model | timerRunning = False }, Cmd.none )

        ResetTimer ->
            ( { model
                | timerRunning = False
                , timerTick = 0
              }
            , Cmd.none
            )

        KeyToggle key ->
            let
                newList = addOrRemove key model.selectedKeys
            in
                ( { model | selectedKeys = newList }, Cmd.none )

        FormToggle form ->
            let
                newList = addOrRemove form model.selectedForms
            in
                ( { model | selectedForms = newList }, Cmd.none )

        ChordToggle chord ->
            let
                newList = addOrRemove chord model.selectedChords
            in
                ( { model | selectedChords = newList }, Cmd.none )

        ClearChords ->
            ( { model | selectedChords = [] }, Cmd.none )

        ClearForms ->
            ( { model | selectedForms = [] }, Cmd.none )

        ClearKeys ->
            ( { model | selectedKeys = [] }, Cmd.none )

        NewCardData data ->
            let
                ( chordData, formData ) = data
                ( newChord, remainingChords ) = chordData
                ( newForm, _ ) = formData 
            in
                case newChord of
                    Nothing ->
                        ( { model
                            | timerTick = 0 
                            , timerRunning = False
                            , cardState = ChordName
                          }
                        , Cmd.none 
                        )
                    _ ->
                        ( { model
                            | timerTick = 0 
                            , timerRunning = True
                            , cardState = ChordName
                            , currentForm = newForm
                            , currentChord = newChord
                            , chordsToShow = remainingChords
                          }
                        , Cmd.none 
                        )

        TimerTick _ ->
            if model.timerTick > model.showForSeconds then
                case model.cardState of
                    Diagram ->
                        ( model
                        , generate NewCardData (choosePairGenerator model.chordsToShow model.selectedForms)
                        )
                    ChordName ->
                        ( { model
                            | cardState = Diagram 
                            , timerTick = 0
                          }
                        , Cmd.none
                        )

            else
                ( { model | timerTick = model.timerTick + 1 }
                , Cmd.none
                )


chooseGenerator : List String -> Generator (Maybe String, List String)
chooseGenerator list =
    choose list


choosePairGenerator : List String -> List String -> Generator ((Maybe String, List String), (Maybe String, List String))
choosePairGenerator chordList formList =
    pair (chooseGenerator chordList) (chooseGenerator formList)


addOrRemove : String -> List String -> List String
addOrRemove val list =
    if List.member val list then
        List.filter (\a -> a /= val) list
    else
        val :: list


grabChord : List String -> (Maybe String, List String)
grabChord currentChords =
    ( Nothing, [] )
