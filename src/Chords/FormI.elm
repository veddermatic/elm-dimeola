module Chords.FormI exposing (formI)

import Chords.Types exposing(..)


-- all the data for Form I chords
formI : String -> List StringInfo
formI chordName =
    case chordName of
        "Major" ->
            []

        "Maj7" ->
            [ StringInfo [ (rootNote 2 1) ]
            , StringInfo [] 
            , StringInfo [ (plainNote 3 3) ] 
            , StringInfo [ (plainNote 3 4) ] 
            , StringInfo [ (plainNote 2 2) ] 
            , StringInfo [] 
            ]

        "7" ->
            [ StringInfo [ (rootNote 2 1) ]
            , StringInfo [] 
            , StringInfo [ (plainNote 2 2) ] 
            , StringInfo [ (plainNote 3 4) ] 
            , StringInfo [ (plainNote 2 3) ] 
            , StringInfo [] 
            ]

        "Maj6" ->
            []

        "minor" ->
            []

        "minor/Maj7" ->
            []

        "m7" ->
            []

        "m6" ->
            []

        "Maj6/9" ->
            []

        "Maj9" ->
            []

        "m9" ->
            [ StringInfo []
            , StringInfo [ (plainNote 1 1) ] 
            , StringInfo [ (plainNote 3 3) ] 
            , StringInfo [ (plainNote 2 4) ] 
            , StringInfo [ (plainNote 3 2) ] 
            , StringInfo [] 
            ]

        "9" ->
            []

        "o" ->
            []

        "7(b9)" ->
            []

        "7(#9)" ->
            []

        "7(b5)" ->
            []

        "7(#5)" ->
            []

        "Maj7(b5)" ->
            []

        "Maj7(#5)" ->
            []

        "m7(b5)" ->
            []

        "7sus4" ->
            []

        "m11" ->
            []

        "9sus4 / 11" ->
            []

        "9(+11)" ->
            []

        "13" ->
            []

        "13(b9)" ->
            []

        "13(#9)" ->
            []

        _ ->
            []
