module ChordDiagrams.FormI exposing (formI)

import ChordDiagrams.Types exposing (..)


-- all the data for Form I chords


formI : String -> List (List Fingering)
formI chordName =
    case chordName of
        "Major" ->
            [ [ Barred (Barre 0 5 2 (Just 0) 1)
              , (plainNote 1 4 3)
              , (plainNote 2 4 4)
              , (plainNote 3 3 2)
              ]
            ]

        "Maj7" ->
            [ [ (rootNote 0 2 1)
              , (plainNote 2 3 3)
              , (plainNote 3 3 4)
              , (plainNote 4 2 2)
              ]
            ]

        "7" ->
            [ [ (rootNote 0 2 1)
              , (plainNote 2 2 2)
              , (plainNote 3 3 4)
              , (plainNote 4 2 3)
              ]
            ]

        "Maj6" ->
            [ [ (rootNote 0 2 2)
              , (plainNote 2 1 1)
              , (plainNote 3 3 4)
              , (plainNote 4 2 2)
              ]
            ]

        "minor" ->
            [ [ Barred (Barre 0 5 2 (Just 0) 1)
              , (plainNote 1 4 3)
              , (plainNote 2 4 4)
              ]
            ]

        "minor/Maj7" ->
            [ [ Barred (Barre 0 5 2 (Just 0) 1)
              , (plainNote 1 4 2)
              , (plainNote 2 3 3)
              ]
            ]

        "m7" ->
            [ [ Barred (Barre 2 5 2 Nothing 3)
              , (rootNote 0 2 2)
              ]
            ]

        "m6" ->
            [ [ Barred (Barre 3 5 2 Nothing 3)
              , (plainNote 2 1 1)
              , (rootNote 0 2 2)
              ]
            ]

        "Maj6/9" ->
            [ [ Barred (Barre 1 4 2 Nothing 1)
              , (plainNote 4 3 3)
              , (rootNote 0 3 2)
              ]
            ]

        "Maj9" ->
            [ [ Barred (Barre 1 4 2 Nothing 1)
              , (plainNote 4 3 3)
              , (plainNote 2 4 4)
              , (rootNote 0 3 2)
              ]
            ]

        "m9" ->
            [ [ (plainNote 1 1 1)
              , (plainNote 2 3 3)
              , (plainNote 3 2 2)
              , (plainNote 4 3 4)
              , (ghostNote 0 3)
              ]
            ]

        "9" ->
            [ [ (plainNote 1 2 1)
              , (plainNote 2 3 3)
              , (plainNote 3 2 2)
              , (plainNote 4 3 4)
              , (ghostNote 0 3)
              ]
            ]

        "o" ->
            [ [ (rootNote 0 3 3)
              , (plainNote 2 2 1)
              , (plainNote 3 3 4)
              , (plainNote 4 2 2)
              ]
            ]

        "7(b9)" ->
            [ [ (plainNote 1 2 2)
              , (plainNote 2 3 3)
              , (plainNote 3 1 1)
              , (plainNote 4 3 4)
              , (ghostNote 0 3)
              ]
            ]

        "7(#9)" ->
            [ [ (rootNote 0 3 2)
              , (plainNote 1 2 1)
              , (Barred (Barre 2 5 3 Nothing 3))
              ]
            ]

        "7(b5)" ->
            [ [ (rootNote 0 3 2)
              , (plainNote 2 3 3)
              , (plainNote 3 4 4)
              , (plainNote 4 2 1)
              ]
            ]

        "7(#5)" ->
            [ [ (rootNote 0 3 1)
              , (plainNote 2 3 2)
              , (plainNote 3 4 3)
              , (plainNote 4 4 4)
              ]
            ]

        "Maj7(b5)" ->
            [ [ (rootNote 0 3 2)
              , (plainNote 2 4 3)
              , (plainNote 3 4 4)
              , (plainNote 4 2 1)
              ]
            ]

        "Maj7(#5)" ->
            [ [ (rootNote 0 3 1)
              , Barred (Barre 2 4 4 Nothing 2)
              ]
            ]

        "m7(b5)" ->
            [ [ (rootNote 0 3 2)
              , (plainNote 2 3 3)
              , (plainNote 3 3 4)
              , (plainNote 4 2 1)
              ]
            ]

        "7sus4" ->
            [ [ Barred (Barre 0 5 2 (Just 0) 1)
              , (plainNote 1 4 3)
              , (plainNote 3 4 4)
              ]
            ]

        "m11" ->
            [ [ (rootNote 0 4 2)
              , (plainNote 2 4 3)
              , (plainNote 3 4 4)
              , (plainNote 4 2 1)
              ]
            ]

        "9sus4 / 11" ->
            [ [ Barred (Barre 0 5 2 (Just 0) 1)
              , (plainNote 0 4 3)
              , (plainNote 3 4 4)
              ]
            ]

        "9(+11)" ->
            [ [ Barred (Barre 1 4 2 Nothing 1)
              , (rootNote 0 3 2)
              , (plainNote 2 3 3)
              ]
            ]

        "13" ->
            [ [ (rootNote 0 2 1)
              , (plainNote 2 2 2)
              , (plainNote 3 3 3)
              , (plainNote 4 4 4)
              ]
            ]

        "13(b9)" ->
            [ [ (ghostNote 0 2)
              , (plainNote 0 3 2)
              , (plainNote 2 2 1)
              , (plainNote 3 3 3)
              , (plainNote 4 4 4)
              ]
            ]

        "13(#9)" ->
            [ [ (ghostNote 0 1)
              , (plainNote 0 4 4)
              , (plainNote 2 1 1)
              , (plainNote 3 2 2)
              , (plainNote 4 3 3)
              ]
            ]

        _ ->
            [ [] ]
