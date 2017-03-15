module Chords.FormIII exposing (formIII)

import Chords.Types exposing (..)


-- all the data for Form I chords


formIII : String -> List (List Fingering)
formIII chordName =
    case chordName of
        "Major" ->
            [ [ Barred (Barre 2 3 4 Nothing 1)
              , (plainNote 1 6 3)
              , (rootNote 0 7 4)
              ]
            ]

        "Maj7" ->
            [ [ (plainNote 3 3 1)
              , (plainNote 2 4 2)
              , (plainNote 1 6 3)
              , (rootNote 0 7 4)
              ]
            ]

        "7" ->
            [ [ (plainNote 3 2 1)
              , (plainNote 2 4 2)
              , (plainNote 1 6 3)
              , (rootNote 0 7 4)
              ]
            ]

        "Maj6" ->
            [ [ (plainNote 3 1 1)
              , (plainNote 2 4 2)
              , (plainNote 1 6 3)
              , (rootNote 0 7 4)
              ]
            ]

        "minor" ->
            [ [ Barred (Barre 2 3 4 Nothing 1)
              , (plainNote 1 5 2)
              , (rootNote 0 7 4)
              ]
            ]

        "minor/Maj7" ->
            [ [ (plainNote 3 3 1)
              , (plainNote 2 4 2)
              , (plainNote 1 5 3)
              , (rootNote 0 7 4)
              ]
            ]

        "m7" ->
            [ [ (plainNote 3 2 1)
              , (plainNote 2 4 2)
              , (plainNote 1 5 3)
              , (rootNote 0 7 4)
              ]
            ]

        "m6" ->
            [ [ (plainNote 3 1 1)
              , (plainNote 2 4 2)
              , (plainNote 1 5 3)
              , (rootNote 0 7 4)
              ]
            ]

        "Maj9" ->
            [ [ (plainNote 4 2 1)
              , (plainNote 3 3 2)
              , (plainNote 2 4 3)
              , (plainNote 1 6 4)
              , (ghostNote 0 7)
              ]
            ]

        "m9" ->
            [ [ Barred (Barre 3 4 2 Nothing 1)
              , (plainNote 2 4 3)
              , (plainNote 1 5 4)
              , (ghostNote 0 7)
              ]
            ]

        "Maj6/9" ->
            [ [ (plainNote 1 6 3)
              , (plainNote 2 6 4)
              , (plainNote 3 4 2)
              , (plainNote 4 2 1)
              , (ghostNote 0 7)
              ]
            ]

        "9" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 6 2)
              , (plainNote 4 4 1)
              ]
            ]

        "7(b9)" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 5 2)
              , (plainNote 4 4 1)
              ]
            ]

        "7(#9)" ->
            [ [ (rootNote 0 7 2)
              , (plainNote 2 7 3)
              , (plainNote 3 7 4)
              , (plainNote 4 4 1)
              ]
            ]

        "o" ->
            [ [ (rootNote 0 7 2)
              , (plainNote 3 7 4)
              , (plainNote 4 6 2)
              , (plainNote 5 4 1)
              ]
            ]

        "7(b5)" ->
            [ [ (plainNote 0 5 4)
              , (plainNote 2 3 1)
              , (plainNote 3 4 2)
              , (plainNote 4 4 3)
              , (ghostNote 0 7)
              ]
            ]

        "7(#5)" ->
            [ [ (plainNote 0 5 2)
              , (plainNote 2 5 3)
              , Barred (Barre 3 4 4 Nothing 1)
              , (ghostNote 0 7)
              ]
            ]

        "Maj7(#5)" ->
            [ [ (rootNote 0 7 4)
              , (plainNote 1 6 3)
              , (plainNote 2 5 2)
              , (plainNote 3 3 1)
              ]
            ]

        "Maj7(b5)" ->
            [ [ (rootNote 0 7 4)
              , (plainNote 1 6 3)
              , Barred (Barre 2 3 3 Nothing 1)
              ]
            ]

        "m7(b5)" ->
            [ [ (rootNote 0 7 4)
              , (plainNote 1 5 3)
              , (plainNote 2 3 2)
              , (plainNote 3 2 1)
              ]
            ]

        "7sus4" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 4 1)
              , (plainNote 4 5 2)
              ]
            ]

        "m11" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 4 1)
              , (plainNote 4 5 2)
              ]
            ]

        "9sus4 / 11" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 6 2)
              , (plainNote 4 5 1)
              ]
            ]

        "9(+11)" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , Barred (Barre 1 4 6 Nothing 1)
              ]
            ]

        "13" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , Barred (Barre 3 5 4 Nothing 1)
              ]
            ]

        "13(b9)" ->
            [ [ (rootNote 0 7 3)
              , (plainNote 2 7 4)
              , (plainNote 3 5 2)
              , Barred (Barre 4 5 4 Nothing 1)
              ]
            ]

        "13(#9)" ->
            [ [ (rootNote 0 7 2)
              , (plainNote 2 7 3)
              , (plainNote 3 7 4)
              , Barred (Barre 4 5 4 Nothing 1)
              ]
            ]

        _ ->
            [ [] ]
