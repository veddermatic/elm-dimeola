module Chords.FormII exposing (formII)

import Chords.Types exposing(..)


-- all the data for Form II chords
formII : String -> List Fingering
formII chordName =
    case chordName of
        "Major" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , Barred (Barre 2 4 4 Nothing 3)
            ]

        "Maj7" ->
            [ (rootNote 1 2 1)
            , (plainNote 2 4 3)
            , (plainNote 3 3 2)
            , (plainNote 4 4 4)
            ]

-- TODO: handle the two forms!
        "7" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , (plainNote 2 4 3)
            , (plainNote 4 4 4)
            ]

        "Maj6" ->
            [ (rootNote 1 2 2)
            , (plainNote 3 1 1)
            , (plainNote 2 4 3)
            , (plainNote 4 4 4)
            ]

        "minor" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , (plainNote 4 3 2)
            , (plainNote 2 4 3)
            , (plainNote 3 4 4)
            ]

        "minor/Maj7" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , (plainNote 4 3 2)
            , (plainNote 2 4 3)
            , (plainNote 3 3 4)
            ]

        "m7" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , (plainNote 4 3 2)
            , (plainNote 2 4 3)
            ]

        "m6" ->
            [ (rootNote 1 2 2)
            , (plainNote 3 1 1)
            , (plainNote 2 4 4)
            , (plainNote 4 3 3)
            ]

        "Maj6/9" ->
            [ (rootNote 1 3 2)
            , Barred (Barre 2 3 2 Nothing 1)
            , (plainNote 4 3 3)
            , (plainNote 5 3 4)
            ]

        "Maj9" ->
            [ (rootNote 1 3 2)
            , (plainNote 2 2 1)
            , (plainNote 3 4 4)
            , (plainNote 4 3 3)
            ]

        "m9" ->
            [ (rootNote 1 3 2)
            , (plainNote 2 1 1)
            , (plainNote 3 3 3)
            , (plainNote 4 3 4)
            ]

        "9" ->
            [ (rootNote 1 3 2)
            , Barred (Barre 3 4 3 Nothing 3)
            , (plainNote 2 2 1)
            ]

        "o" ->
            [ (rootNote 1 2 2)
            , (plainNote 2 3 3)
            , (plainNote 3 1 1)
            , (plainNote 4 3 4)
            ]

        "7(b9)" ->
            [ (rootNote 1 3 3)
            , (plainNote 2 2 1)
            , (plainNote 3 3 4)
            , (plainNote 4 2 2)
            ]

        "7(#9)" ->
            [ (rootNote 1 3 2)
            , (plainNote 2 2 1)
            , (plainNote 3 3 3)
            , (plainNote 4 4 4)
            ]

-- TODO: HANDLE BOTH!!
        "7(b5)" ->
            [ Barred (Barre 1 5 2 (Just 1) 1)
            , (plainNote 2 3 2)
            , (plainNote 4 4 3)
            ]

-- TODO: HANDLE BOTH!!
        "7(#5)" ->
            [ Barred (Barre 1 5 1 (Just 1) 1)
            , (plainNote 2 4 4)
            , (plainNote 4 3 3)
            ]

        "Maj7(b5)" ->
            [ (rootNote 1 2 1)
            , (plainNote 2 3 2)
            , (plainNote 3 3 3)
            , (plainNote 4 4 4)
            ]

        "Maj7(#5)" ->
            [ (rootNote 1 1 1)
            , (plainNote 2 4 4)
            , (plainNote 3 2 2)
            , (plainNote 4 3 3)
            ]

        "m7(b5)" ->
            [ (rootNote 1 2 1)
            , (plainNote 2 3 3)
            , (plainNote 3 2 2)
            , (plainNote 4 3 4)
            ]

        "7sus4" ->
            [ (plainNote 0 3 2)
            , (plainNote 2 3 3)
            , (plainNote 3 3 4)
            , (plainNote 4 1 1)
            , (ghostNote 1 3)
            ]

        "m11" ->
            [ (plainNote 0 3 2)
            , (plainNote 2 3 3)
            , (plainNote 3 3 4)
            , (plainNote 4 1 1)
            , (ghostNote 1 3)
            ]

        "9sus4 / 11" ->
            [ (rootNote 1 3 2)
            , (plainNote 3 3 3)
            , (plainNote 4 3 4)
            , (plainNote 5 1 1)
            ]

        "9(+11)" ->
            [ (rootNote 1 3 2)
            , Barred (Barre 2 5 2 Nothing 1)
            , (plainNote 3 3 3)
            , (plainNote 4 3 4)
            ]

        "13" ->
            [ (rootNote 1 2 1)
            , Barred (Barre 4 5 4 Nothing 4)
            , (plainNote 3 2 2)
            ]

        "13(b9)" ->
            [ (rootNote 1 2 2)
            , Barred (Barre 2 4 1 Nothing 1)
            , (plainNote 3 2 3)
            , (plainNote 5 4 4)
            ]

        "13(#9)" ->
            [ (rootNote 1 2 1)
            , (plainNote 3 2 2)
            , (plainNote 4 3 3)
            , (plainNote 5 4 4)
            ]

        _ ->
            []
