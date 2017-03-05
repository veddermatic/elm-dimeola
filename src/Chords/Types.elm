module Chords.Types exposing ( StringInfo
                               , Note
                               , Barre
                               , Fingering(..)
                               , rootNote
                               , plainNote
                              )

type alias StringInfo =
    { notes: List Fingering }

type Fingering
    = Single Note
    | Barred Barre

-- TODO: convert this to Finger or something?? I guess Note is okay for now..
type alias Note =
    { fret: Int
    , finger: Int
    , barre: Bool
    , rootNote: Bool
    }

type alias Barre =
    { startFret: Int
    , endFret: Int
    , rootString: Maybe Int
    , finger: Int
    }

-- helper to generate a Note that is signified as the root of the chord
rootNote : Int -> Int -> Fingering
rootNote fret finger =
    Single ( Note fret finger False True )


-- helper to generate a Note that is a plain old regular note
plainNote : Int -> Int -> Fingering
plainNote fret finger =
    Single ( Note fret finger False False )



