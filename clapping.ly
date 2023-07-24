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

musa = \drummode { cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:"cgh8 cgh8 cgh8 r8 cgh8 cgh8 r8 cgh8 r8 cgh8 cgh8 r8 \bar ":|.|:" }

musb = \drummode { cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:"cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 \bar ":|.|:"cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 \bar ":|.|:"r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 \bar ":|.|:"cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 \bar ":|.|:"cgl8 r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 \bar ":|.|:"r8 cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 \bar ":|.|:"cgl8 r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:"r8 cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 \bar ":|.|:"cgl8 cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 \bar ":|.|:"cgl8 r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 \bar ":|.|:"r8 cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 \bar ":|.|:"cgl8 cgl8 cgl8 r8 cgl8 cgl8 r8 cgl8 r8 cgl8 cgl8 r8 \bar ":|.|:" }

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