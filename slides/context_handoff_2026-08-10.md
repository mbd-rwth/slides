# Context Handoff: Sustainability in CS&E deck

Date: 2026-08-10

Primary deck:
- `slides/index.qmd`

Related style and bibliography files:
- `slides/metafiles/format.scss`
- `slides/references.bib`

## Current slide storyline

The deck is a talk on `Sustainability in Computational Science and Engineering` with this current arc:

1. SDGs and Brundtland framing
2. CS&E definition and role
3. Observation that sustainability is visible in applications but rarely explicit in method-oriented CS&E
4. Historical pivot to Carlowitz and delayed dynamics
5. General sustainability framing
6. Internal CS&E perspective: computing, software, methods, human capability, institutions
7. Closing claim that sustainable CS&E is a methodology

## Important edits completed in this session

### 1. Acronym normalization

Across `slides/index.qmd`, visible acronym usage was normalized from `CSE` to `CS&E` / `CS&amp;E` / `CS\&E` depending on context.

### 2. CS&E definition slide

There is now a slide:
- `## Computational Science and Engineering (CS\&E)`

Current intended structure:
- top: centered statement that CS&E sits at the intersection of applied mathematics, computer science, and engineering/applied sciences
- middle: a `framework-card` containing
  - left text: Goal / Objective / Focus
  - right: Venn diagram
- bottom: challenge bullets (`What makes it hard`)

Relevant reusable classes in `format.scss`:
- `.cse-overlap-card`
- `.cse-venn`
- `.cse-circle`
- `.cse-circle--math`
- `.cse-circle--cs`
- `.cse-circle--eng`
- `.cse-core`

Important design constraint from the user:
- avoid creating new SCSS logic per slide where possible
- prefer Quarto semantics, with minimal embedded HTML only where needed

### 3. Observation / bridge slide

The earlier “Intermediate Conclusions” style slide was reworked into:
- `## Observations about sustainability and CS\&E`

It uses two side-by-side boxes with a two-sided arrow between them via:
- `.framework-bridge`
- `.framework-bridge-arrow`

### 4. Carlowitz references

`slides/references.bib` now contains:
- `@carlowitz_1713_biblio` for the original 1713 work
- `@carlowitz_2021_oekom` for the modern oekom edition

User preference:
- cite the original version in the slides

The Carlowitz quote block in `slides/index.qmd` currently uses:
- `[@carlowitz_1713_biblio]`

The small citation block font-size typo was fixed from `1.em` to `0.7em`.

### 5. Timeline slide

A new slide was inserted immediately after:
- `## Three sustainability aspects, and why they matter now`

Current title:
- `## A timeline for how this question arrived here`

It uses reveal fragments to show milestones iteratively.

Milestones currently in the slide:
- 2025: von Kármán Conference
- 2026: JuliaCon
- 1713: Carlowitz
- 1987: Brundtland
- 2015: SDGs
- 2030: Future of CS&E

Important note:
- `1987` and `2015` were used because those are the historically correct dates for the Brundtland Report and the SDG adoption

Timeline styling lives in `slides/metafiles/format.scss` under:
- `.timeline-slide`
- `.timeline-track`
- `.timeline-event`
- `.timeline-year`
- `.timeline-card`

Latest user request on this slide:
- the timeline should have the small circles on a single horizontal line
- all boxes should be below the line
- vertical connectors should connect the circles to the boxes

This restructuring was already applied in the shared timeline SCSS.

## Files currently modified in the worktree

From `git status --short`:
- `M slides/index.qmd`
- `M slides/metafiles/format.scss`
- `M slides/references.bib`
- `M slides/wood_response_times_matrix.html`

Untracked files currently present:
- `slides/images/DSCF4312.JPG`
- `slides/images/DSCF4329.JPG`
- `slides/images/FAIR-susceptibility.jpeg`
- `slides/images/brundtland_report_book_cover.jpg`
- `slides/wood_response_times_matrixorig.html`

## Things that still need visual checking

No render/preview was completed in this session.

High-probability follow-up checks:

1. Verify the `Computational Science and Engineering (CS&E)` slide visually:
   - Venn alignment
   - text width balance left vs right
   - spacing between the top line, card, and challenge bullets

2. Verify the new timeline slide visually:
   - horizontal spacing between milestone cards
   - whether any cards collide on smaller revealjs widths
   - whether the fragment sequence feels natural in presentation mode

3. There are earlier known source issues still worth checking later:
   - some image attributes had malformed width strings earlier in the deck (`{width=90%"}` style)
   - duplicate headings were previously present and were partly reworked during this session

## Preferred continuation point

Next best step:
- render or preview `slides/index.qmd`
- inspect the CS&E definition slide and the timeline slide first
- then do small spacing/layout fixes rather than more structural rewrites
