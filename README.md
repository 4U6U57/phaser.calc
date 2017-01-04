# phasers

*Set phasers to stun.*

Basic phasor (complex/polar number) calculator command line tool, written in Bash.

## Usage

Below is the syntax for the various subcommands supported by `phasers`

```bash
phasers [h|help] # shows supported operations
phasers [rp|p] REAL IMAG # converts real to polar
phasers [pr|r] RAD THETA # converts polar to real
phasers [pmult|pdiv] RAD1 THETA1 RAD2 THETA2 # multiplies/divides two polar numbers
phasers [rplus|rminus] REAL1 IMAG1 REAL2 IMAG2 # adds/subtracts two real numbers
```

## Why?

I wrote this script in around an hour while procrastinating doing homework for Intro to Circuits
(EE 101). The homework involved repetitive calculations of basic operations on complex numbers,
resulting in many square roots, degree to radian conversions, etc. I decided that taking the time
to automate these calculations would be a better use of my time than punching it out on the
calculator by hand. (It helps that I was typesetting my homework as opposed to writing it out, 
so I could easily copy and paste betweeen Google Docs and the command prompt).

### But Why Bash?

It was an interesting choice to use *Bash*, I'll admit. 10 minutes into the project I was already 
regretting this decision, as Bash does not support floating point arithmetic. I ended up using the
`bc` command line calculator to get around this, but the implementation is less than ideal.

As to why exactly I turned to Bash into the first place, it was because I didn't know Python. :sweat:
Big mistake.
