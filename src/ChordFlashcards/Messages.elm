module ChordFlashcards.Messages exposing (Msg(..))
-- module ChordFlashcards.Messages exposing (..)  -- OG version

import Time exposing (Time)

type Msg
    = TimerTick Time
    | ChordToggle String
    | FormToggle String
    | KeyToggle String
    | NewCardData ((Maybe String, List String), (Maybe String, List String))
    | StopTimer
    | StartTimer
    | ResetTimer
    | ClearChords
    | ClearForms
    | ClearKeys
