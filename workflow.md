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

Template files are available, including: `4vv_no_flats_MenCutC` and `4vv_1flat_MenCircle`.

Templates ensure correct mensuration, proper staff configuration, and standardized layout

---

## 2. Optical Music Recognition (OMR)

- **Sibelius**: PhotoScore  
- **MuseScore**: `File > Import PDF`

All OMR output must be carefully corrected.

---

## 3. Existing Transcription

If beginning from an existing edition donated to the project:
- Correct errors
- Normalize note values
- Remove reduction
- Apply 1520s/JRP tagging conventions

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

All voices must use the same meter in the transcription. Then add technical instructions above relevant staff: `rscale:1/2`, `barlines:2`, `barlines:3`, or `barlines:2, dashed`

---

# Clefs and Voice Labels

## Clefs

Use only:
- Treble  
- Treble-8vb  
- Bass  

Choose clefs based on vocal range.

---

## Voice Labels

Standard ordering:
- Superius (before ca. 1480: Discantus)
- Altus (before ca. 1480: Contratenor)
- Tenor
- Bassus

All voice names must be unique. For The 1520s Project, use only Superius, Altus, Tenor and Bassus, or permutations thereof, such as Superius I, Altus II, etc.

---

# Note Values and Reduction
- Use **original note values**.
- Correct reductions (2:1, 4:1, etc.).
- Ensure consistency across the entire piece.

---

# Editorial Accidentals

Insert editorial accidentals when:
- Required for cadential inflection  
- Clear melodic tritone implication  
- Strong contrapuntal necessity  

Policy:
- Place on staff
- Use parentheses
- Do not blindly follow published editions

---

# Fermatas and Orthography

## Fermatas
- Add fermatas where musically appropriate
- Omit fermatas on final note of section

---

## Orthography

- Use “e” instead of “ae" except when the earliest source explicitly uses "ae"

Capitalization policy:
- Do not capitalize “domine,” “deus,” etc.
- Capitalize proper names only

---

# Section Names and Analytical Tags

For multi-section works, add section labels:
- Section: Kyrie I
- Section: Qui tollis
- Section: Mente tota

Add as:

- System Text (MuseScore)
- Technique (Sibelius)

---

## Analytical / Explanatory Tags

Add above relevant staff when applicable:

Examples:
- Canon at the upper 5th (A→S, 2 breves)
- T = T of Okeghem’s D’ung aultre amer
- MS: e’ [error]
- T governed by a repeat sign

Use sparingly but consistently.

---

# Metadata and Attribution

## Composer

Enter in Composer field.

## Transcriber

Enter in Arranger field: Name YYYY/MM/DD (example: Jane Smith 2026/02/10)

## Source (if from facsimile)

Add above m. 1: Source: Bologna Q16

---

# Critical Commentary

For each source or edition:

1. Enter one row per source.
2. Upload music text as `.txt` file (filename = piece ID).
3. Optional: add 1–3 sentences describing source relationships.

Mass Ordinary movements do not require separate text files.

---

# Submission Workflow

## Stage 1 — Draft

- Upload notation file (MuseScore or Sibelius)
- Upload `.txt` text file
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

Project leadership will rename file with official prefix.

---

# File Naming Conventions

Use the internal **piece ID** consistently across:

- Notation file
- PDF
- MusicXML
- Text file
- Scan (if applicable)

Example: Ric1001a-Missa_O_genitrix-Kyrie

# Final Deliverables

Each completed edition must include:

- Notation file (.mscz or .sib)
- PDF engraving
- MusicXML
- Text file (if applicable)

All files must conform to the project's editorial policy.

---

## License

Unless otherwise specified, editorial workflow documentation is released under CC BY-NC-SA 4.0.
