module Chords.FormII exposing (formII)

import Chords.Types exposing(..)


-- all the data for Form I chords
formII : String -> List StringInfo
formII chordName =
    case chordName of
        "Major" ->
            []

        "Maj7" ->
            []

        "7" ->
            []

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
            []

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
