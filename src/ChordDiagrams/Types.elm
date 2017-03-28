module ChordDiagrams.Types
    exposing
        ( Note
        , Barre
        , Fingering(..)
        , rootNote
        , plainNote
        , ghostNote
        )


type Fingering
    = Single Note
    | Barred Barre
    | Ghost Note


type alias Note =
    { string : Int
    , fret : Int
    , finger : Int
    , rootNote : Bool
    }


type alias Barre =
    { startString : Int
    , endString : Int
    , fret : Int
    , rootString : Maybe Int
    , finger : Int
    }



-- helper to generate a Note that is signified as the root of the chord


rootNote : Int -> Int -> Int -> Fingering
rootNote string fret finger =
    Single (Note string fret finger True)



-- helper to generate a Note that is a plain old regular note


plainNote : Int -> Int -> Int -> Fingering
plainNote string fret finger =
    Single (Note string fret finger False)



-- helper to make a "ghost" root note when there is none
-- in the chord


ghostNote : Int -> Int -> Fingering
ghostNote string fret =
    Ghost (Note string fret 0 True)
