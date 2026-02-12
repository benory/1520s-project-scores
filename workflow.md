# The 1520s Project and the Josquin Research Project (JRP)  
## Editorial Workflow: MuseScore / Sibelius → Digital Edition

**Last updated:** February 2026  
Supported by the National Endowment for the Humanities (Scholarly Editions and Translations Grant, 2025–2028)

---

## Overview

This document describes the complete editorial workflow for preparing Renaissance polyphony for publication in The 1520s Project and the Josquin Research Project (JRP). This guide is intended for project editors and external collaborators.

The workflow ensures: consistent editorial standards; accurate analytical processing; clean Humdrum/MEI export; interoperability with digital tools (MEI, Verovio); and long-term sustainability and reproducibility.

---

## Table of Contents

1. [General Principles](#general-principles)  
2. [Starting a New Edition](#starting-a-new-edition)  
3. [Mensuration and Time Signatures](#mensuration-and-time-signatures)  
4. [Clefs and Voice Labels](#clefs-and-voice-labels)  
5. [Note Values and Reduction Policy](#note-values-and-reduction-policy)  
6. [Editorial Accidentals](#editorial-accidentals)  
7. [Fermatas and Orthography](#fermatas-and-orthography)  
8. [Section Names and Analytical Tags](#section-names-and-analytical-tags)
9. [Metadata and Attribution](#metadata-and-attribution)  
10. [Critical Commentary](#critical-commentary)  
11. [Submission Workflow](#submission-workflow)  
12. [File Naming Conventions](#file-naming-conventions)  
13. [Final Deliverables](#final-deliverables)  

---

# General Principles

- Transcribe **original note values** (no reduction).
- Use modern clefs (treble, treble-8vb, bass).
- Normalize mensuration across voices.
- Encode editorial interventions clearly.
- Ensure compatibility with MEI export and 1520s/JRP analytical tools.

---

# Starting a New Edition

Editors may begin in one of three ways:

## 1. Template File

Template files are available, including: `4vv_no_flats_MenCutC` (a file with four blank staves, no flat signature, and in 2/1 to match Cut-C mensuration) and `4vv_1flat_MenCircle`.

Templates ensure correct mensuration, proper staff configuration, and standardized layout

---

## 2. Optical Music Recognition (OMR)

Both **Sibelius** and **MuseScore** have OMR software (for Sibelius, PhotoScore; for MuseScore, `File > Import PDF`). You can use these to generate a first draft of a score. All OMR output must be carefully corrected.

---

## 3. Existing Transcription

If beginning from an existing edition donated to the project:
- Correct errors
- Normalize note values/remove reduction
- Apply 1520s/JRP tagging conventions
- Prepare critical commentary

---

# Mensuration and Time Signatures

## Standard Mappings

| Mensuration Sign | Encode As |
|------------------|----------|
| Cut-C, C, O2, Cut-C2, Reverse-C | 2/1 |
| O, 3, O/3, Cut-O/3 | 3/1 |
| C-dot | 6/2 |
| O-dot | 9/2 |

---

## Tagging Mensurations

- For **MenCutC (2/1)** and **MenCircle (3/1)** → no additional tagging required.
- For any other mensuration → add a label above each staff.

Naming conventions are: `MenC`, `MenCutC`, `MenCircle`, `MenCutC3`, `MenCircleOver3`, `MenReverseC`, etc.

If no mensuration sign appears in the source, add above m. 1: "Mensuration signs are editorial"

---

## Voices in Different Mensurations

All voices must use the same meter in the transcription. Then add technical instructions above relevant staff: `rscale:1/2`, `barlines:2`, `barlines:3`, or `barlines:2, dashed`.

`rscale:1/2` causes the note values we print to be half the length of the ones you've entered (e.g., whole notes become half notes). You can also use `rscale:1/4`.

`barlines:2` makes barlines appear only every other measure. Use `barlines:3` to make the barline appear every three measures, etc.

For unusual mensurations where the beat is on the breve: use either `barlines:2, dashed` (for `MenCutC2` and `MenReverseC`) or `barlines:3`, dashed (for `MenCircle2`). This will create dashed barlines, with a full barline only after every two or three breves, resepctively.

---

# Clefs and Voice Labels

## Clefs

Use only treble, treble-octave, and bass. Choose clefs based on vocal ranges (don't blindly follow editions). When in doubt, probably use treble-octave.

---

## Voice Labels

Standard ordering:
- Superius (before ca. 1480: usually Discantus)
- Altus (before ca. 1480: usually Contratenor)
- Tenor
- Bassus

All voice names must be unique. 

For The 1520s Project, use only Superius, Altus, Tenor and Bassus, or permutations thereof, such as Superius I, Altus II, etc.

---

# Note Values and Reduction
Use **original values**, correcting the edition's reduction. Be careful in cases where the edition adopts 2:1 reduction here but 4:1 there.

---

# Editorial Accidentals

In most cases, ignore the published edition. Insert obvious editorial accidentals as you go, placing sharps, flats, and natural signs on the staff in parentheses. We want editorial accdientals only for cadential inflection and clear melodic tritone leaps or outlines.

---

# Fermatas

Add these—but omit fermatas on the last note of a section.

---

## Orthography

- Use “e” instead of “ae" except when the earliest source explicitly uses "ae"
- The Josquin Research Project does not capitalize on "Domine," "Dominus," "Deus," etc., and only capitalizes proper names (e.g., "Antonius," "Maria," or "Christus"). The 1520s Project capitalizes "Domine," "Dominus," and "Deus," in addition to proper names.

---

# Section Names and Analytical Tags

For any piece in two sections or more, label each, as in: `Section: Kyrie I`; `Section: Qui tollis`; `Section: Mente tota` (as a "Technique" in Sibelius or as "System Text" in MuseScore above the first measure). Do not add full text underlay or include it from a PDF processed using OMR. If, however, full underlay is present in a pre-existing MuseScore/Sibelius/Finale file, you can retain it if it seems plausible.

Add explanatory information as appropriate, above the relevant staff, as a “Technique.” Do this for imitation canons and clear cantus-firmus quotations, as in:
- Canon at the upper 5th (A→S, 2 breves)
- T = T of Okeghem’s D’ung aultre amer
- MS: e’ [error]
- T governed by a repeat sign

---

# Metadata and Attribution

## Composer

Enter in Composer field.

## Transcriber

Enter in Arranger field: Name YYYY/MM/DD (example: Jane Smith 2026/02/10)

## Source (if from facsimile)

Add above m. 1: Source: Bologna Q16

## File Naming Conventions

Use the internal **piece ID** consistently across:
- Sibleius/MuseScore file
- PDF
- MusicXML
- Text file
- Scan (if applicable)

Example: `Ric1001a-Missa_O_genitrix-Kyrie`

---

# Final Deliverables

Each completed edition must include:

- Notation file (.mscz or .sib)
- PDF engraving
- MusicXML
- Text file (if applicable)

All files must conform to the project's editorial policy.

---

# Critical Commentary

For each source or edition:
1. Enter one row per source.
2. Upload music text as `.txt` file (filename = piece ID).
3. Optional: add 1–3 sentences describing source relationships.

Mass Ordinary movements do not require separate text files. One set of source entries per mass is sufficient.

---

# Submission Workflow

## Stage 1 — Draft

- Upload notation file (MuseScore or Sibelius)
- Upload `.txt` file for the text
- Upload scan (if newly created)
- Highlight work in tracking sheet (yellow)

---

## Stage 2 — Completed Edition

After review:

- Incorporate revisions
- Upload three files:
    - Notation file (.mscz or .sib)
    - PDF
    - MusicXML
- Enter completion date in tracking sheet

---

## Stage 3 — MusicXML to Humdrum Conversion

After editorial corrections are complete and the final MusicXML file has been exported, convert the file to Humdrum format using the `humlib` tools.

### Command-Line Workflow

1. Convert MusicXML to Humdrum using `musicxml2hum`.
2. Apply the appropriate project-specific `humextra` filter:
   - `1520ify` for *The 1520s Project*
   - `jrpize` for the *Josquin Research Project (JRP)*
3. Renumber measures using `barnum -a` to ensure consistent bar numbering.

This should look like the following:

```bash
musicxml2hum example_piece.musicxml | 1520ify | barnum -a > example_piece.krn
```

---

## License

Unless otherwise specified, editorial workflow documentation is released under CC BY-NC-SA 4.0.
