\version "2.22.1"

\pointAndClickOff

\header {
  title = "Clapping Music"
  composer = "Steve Reich."
}

\paper {
  left-margin = 18\mm
  markup-system-spacing.basic-distance = 10
}

\layout {
  indent = 0\mm
  ragged-right = ##t
}

musa = \drummode { cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"  }

musb = \drummode { cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:" cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 \bar ":|.|:" cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 \bar ":|.|:" r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 \bar ":|.|:" cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 \bar ":|.|:" cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 \bar ":|.|:" r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 \bar ":|.|:" cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:" r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 \bar ":|.|:" cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 \bar ":|.|:" cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 \bar ":|.|:" r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 \bar ":|.|:" cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:"  }

<<
  \time 12/8
  \new DrumStaff \with {
    instrumentName = "Clap 1 "
    shortInstrumentName = "Cl. 1 "
    \remove "Time_signature_engraver"
    \override StaffSymbol.line-count = #1
    \override Rest.staff-position = 0 } \musa

  \new DrumStaff \with {
    instrumentName = "Clap 2 "
    shortInstrumentName = "Cl. 2 "
    \remove "Time_signature_engraver"
    \override StaffSymbol.line-count = #1 } \musb
>>