\version "2.22.1"

\pointAndClickOff

\header {
  title = "Clapping Music"
  composer = "Steve Reich."
}

\layout {
  indent = 0\mm
  ragged-right = ##t
}

musa = \drummode { {% for bar in a %}{%- for note in bar %}{{ 'cgh8' if note else 'r8' }} {% endfor %}\bar ":|.|:"{% endfor %} }

musb = \drummode { {% for bar in b %}{% for note in bar %}{{ 'cgl8' if note else 'r8' }} {% endfor %}\bar ":|.|:"{% endfor %} }

<<
  \new DrumStaff \with {
    drumStyleTable = #congas-style
    \remove "Time_signature_engraver"
    \override StaffSymbol.line-count = #2
    \override StaffSymbol.staff-space = #2
    \hide Stem
    \override Stem.Y-extent = ##f
  } <<
  \new DrumVoice \with {\override Rest.staff-position = 1} {\time 12/8 \voiceOne \musa }
  \new DrumVoice \with {\override Rest.staff-position = -1} {\time 12/8 \voiceTwo \musb }
    >>
>>
