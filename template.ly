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

musa = \drummode { {% for bar in a %}{%- for note in bar %}{{ 'cgh8' if note else 'r8' }} {% endfor %}\bar ":|.|:" {% endfor %} }

musb = \drummode { {% for bar in b %}{% for note in bar %}{{ 'cgl8' if note else 'r8' }} {% endfor %}\bar ":|.|:" {% endfor %} }

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
