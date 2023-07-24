import click
import subprocess
from fractions import Fraction
from jinja2 import Template


@click.command()
@click.option('--raw', default='clapping.raw')
@click.option('--out', type=click.Choice(['text', 'lilypond']),
              default='text')
def transform(raw, out):
    """ Transform raw event output from Tidal Cycles """
    with open(raw, "r") as f:
        lines = f.readlines()

    # note starts expressed as ratios
    raw_starts = [
        line.split(']')[1].split('(')[1].split(')')[0].split('>')[0]
        for line in lines
    ]

    # notes: "cs5" in "...|n: 1.0n (cs5)"
    notes = [
        line.split(' ')[2].split('(')[1].split(')')[0]
        for line in lines
    ]

    # get number of measures and number of beats per measure
    bars, length = bar_counts(raw_starts)

    # assuming even distribution of notes per bar; that is, that each voice
    # plays as often as the other
    notes_per_bar = int(len(raw_starts) / bars)

    # prepare a list of tuples: (bar number, note start, note)
    note_starts = [
        (
            int(t[0]),
            Fraction(unvulgar(t[1].removeprefix(t[0]) or '0')),
            t[2]
        )
        for t in zip(
                [x for y in [
                    [str(n)] * notes_per_bar for n in range(bars)
                ] for x in y],
                raw_starts,
                notes
        )
    ]

    # prepare a list of list of lists: bars, each containing rows of beats
    # for each voice, including hits (True) and rests (False)
    with_rests = [
        [
            [
                Fraction(beat, length) in [
                    n[1] for n in [
                        n for n in note_starts if n[2] == note
                    ] if n[0] == bar
                ] for beat in range(length)
            ] for note in sorted(list(set(notes)))
        ] for bar in range(bars)
    ]

    # text output
    if out == 'text':
        click.echo(
            '\n\n'.join(
                ['\n'.join(
                    [''.join(
                        ['1' if beat else '0' for beat in bar]
                    ) for bar in w]
                ) for w in with_rests]
            )
        )
    # LilyPond and PDF output
    elif out == 'lilypond':
        with open('template.ly', 'r') as f:
            output = Template(f.read()).render(
                a=[bar[0] for bar in with_rests],
                b=[bar[1] for bar in with_rests]
            )
        with open('clapping.ly', 'w') as f:
            f.write(output)
        subprocess.run(['lilypond', 'clapping.ly'])


fractions = {
    '½': '1/2',
    '⅓': '1/3',
    '⅔': '2/3',
    '¼': '1/4',
    '¾': '3/4',
    '⅕': '1/5',
    '⅖': '2/5',
    '⅗': '3/5',
    '⅘': '4/5',
    '⅙': '1/6',
    '⅚': '5/6',
    '⅐': '1/7',
    '⅛': '1/8',
    '⅜': '3/8',
    '⅝': '5/8',
    '⅞': '7/8',
    '⅑': '1/9',
    '⅒': '1/10'
}


def unvulgar(val):
    """ Replace vulgar fraction with 'x/y' """
    if val in fractions:
        return fractions[val]
    else:
        return val


def bar_counts(starts):
    """ Return number of bars and number of beats per bar """
    # select all ratios with vulgar fraction glyphs and strip them out
    vulgar = ''.join(fractions.keys())
    frac_starts = [
        s.rstrip(vulgar)
        for s in starts
        if any(c in s for c in vulgar)
    ]

    # confirm that the number prefixes for these ratios make a continuous
    # range; the top of that range plus one is the number of measures
    nums = sorted(list(set([int(f or '0') for f in frac_starts])))
    assert nums == list(range(bars := max(nums) + 1))

    # for non-vulgar ratios, confirm that the denominator is always the same;
    # this number is the number of beats or positions per bar
    slash_starts = [s.split('/')[1] for s in starts if '/' in s]
    assert len(set(slash_starts)) == 1
    length = slash_starts[0]

    return bars, int(length)
