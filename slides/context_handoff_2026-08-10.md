# Context Handoff: Sustainability in CS&E deck

Created: 2026-08-10  
Last updated: 2026-08-11

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

### 6. Shared design tokens and styling approach

The consolidation of shared colors, surfaces, spacing, and shadows in
`slides/metafiles/format.scss` is complete. The deck rendered successfully
after the consolidation.

The shared tokens are defined at the start of the SCSS file and are the
default source for future styling decisions:

- text and surfaces: `$deck-title-text`, `$deck-ink`,
  `$deck-text-secondary`, `$deck-text-muted`, `$deck-surface`, `$deck-white`
- semantic/accent colors: `$deck-green-dark`, `$deck-green-primary`,
  `$deck-green-muted`, `$deck-green-message`, `$deck-green-accent`,
  `$deck-blue`, `$deck-red`, `$deck-orange`, `$deck-yellow`
- borders: `$deck-border-subtle`, `$deck-border-default`
- shadows: `$deck-shadow-card`, `$deck-shadow-compact`
- radii: `$deck-radius-small`, `$deck-radius-medium`, `$deck-radius-card`,
  `$deck-radius-panel`
- shared dimensions and spacing: `$deck-content-wide`, `$deck-gap-layout`,
  `$deck-padding-card`

Approach for future work:

1. Reuse these shared tokens instead of introducing new literal colors,
   shadows, radii, widths, gaps, or padding in individual components.
2. If a genuinely recurring design value is missing, add one shared token and
   use it consistently; do not create a token for a one-off adjustment.
3. Keep component classes responsible for layout and meaning, while the token
   layer controls the common visual language.
4. Prefer native Quarto/RevealJS structure and attributes. Use custom HTML and
   SCSS only when the native syntax cannot express the required layout or
   behavior cleanly.
5. Avoid new slide-specific component families where an existing shared class
   can be reused or modestly extended.
6. Preserve UTF-8 without BOM and CRLF working-tree line endings for edited
   source files. With the repository's Git configuration, `git ls-files --eol`
   should report `i/lf w/crlf` for these files.

### Protected components

Do not modify the timelines or the SDG grid unless the user gives an explicit
instruction to work on that component. This restriction includes:

- their content and source markup in `slides/index.qmd`
- their layout, appearance, and responsive behavior in `format.scss`
- timeline fragments, arrows, SVG markers, milestones, legends, and sequencing
- SDG-grid items, images, tooltips, interactions, and grid arrangement

General cleanup, harmonization, refactoring, or native-Quarto conversion does
not by itself authorize changes to either protected component.

Related cleanup already completed:

- confirmed unused component families were removed from `format.scss`
- repeated hard-coded design values were replaced with the shared tokens
- repeated card implementations were consolidated without changing slide markup:
  - `.sdg-taxonomy-card` and `.framework-card` share one standard-card rule
  - `.timeline-card` intentionally remains separate because its compact
    dimensions and typography serve a different layout role
- custom `.question-box`, `.highlight-box`, and `.question-slide-center`
  implementations were replaced with native Quarto/RevealJS syntax:
  - the standalone research question uses a slide-level `.center` class and a
    native `callout-tip`
  - the Brundtland definition uses a native `callout-note`
  - the SCSS selectors and tokens used only by the removed helpers were deleted
- the global pale cover-image background remains centrally controlled in SCSS
- RevealJS's native progress bar remains disabled (`progress: false`); the
  custom seedling-to-tree growth widget is the deck's intentional progress
  indicator and is offset from the right edge to leave room for slide numbers
- timeline SVG marker IDs are unique per SVG to prevent arrowheads resolving
  to a marker on another, hidden slide

## Files currently modified in the worktree

From `git status --short` on 2026-08-11:
- `M slides/index.qmd`
- `M slides/metafiles/format.scss`

The context handoff file itself becomes modified by this update.

## Things that still need visual checking

The deck has since been rendered successfully after the SCSS consolidation and
the timeline marker fix. A full visual presentation-mode review is still useful.

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
