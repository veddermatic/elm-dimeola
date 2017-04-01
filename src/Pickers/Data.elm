module Pickers.Data exposing (chordNames, chordForms, keys)


-- Gives a list of all the names of all the chords. Well, at least the
-- ones in the book.


chordNames : List String
chordNames =
    [ "Major"
    , "Maj7"
    , "7"
    , "Maj6"
    , "minor"
    , "minor/Maj7"
    , "m7"
    , "m6"
    , "Maj9"
    , "m9"
    , "Maj6/9"
    , "9"
    , "7(b9)"
    , "7(#9)"
    , "o"
    , "7(b5)"
    , "7(#5)"
    , "Maj7(#5)"
    , "Maj7(b5)"
    , "m7(b5)"
    , "7sus4"
    , "m11"
    , "9sus4 / 11"
    , "9(+11)"
    , "13"
    , "13(b9)"
    , "13(#9)"
    ]



-- Gives a list of all ten "forms" describes in the book
-- TODO : move this out of here


chordForms : List String
chordForms =
    [ "I"
    , "II"
    , "III"
      {-
         , "IV"
         , "V"
         , "VI"
         , "VII"
         , "VIII"
         , "IX"
         , "X"
      -}
    ]



-- List of all the musical  notes / keys. Even the wierd ones.
-- TODO : move this out of here


keys : List String
keys =
    [ "Ab"
    , "A"
    , "A♯"
    , "Bb"
    , "B"
    , "B#"
    , "Cb"
    , "C"
    , "C#"
    , "Db"
    , "D"
    , "D#"
    , "Eb"
    , "E"
    , "E#"
    , "Fb"
    , "F"
    , "F#"
    , "Gb"
    , "G"
    , "G#"
    ]



