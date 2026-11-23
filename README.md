# School Course Notes Template

A clean, English-first LaTeX template for a student society's shared course notes.
Each course is organised into three main parts:

1. Knowledge Notes
2. TTL Materials
3. Past Papers

The design is intentionally restrained: serif body text, sans-serif headings, one
muted colour system, clear theorem styles, and subtle information boxes.

## Files

- `course-notes.cls` - all layout, typography, environments, and metadata commands
- `main.tex` - course metadata and document structure
- `frontmatter/revision-history.tex` - version history
- `chapters/knowledge-notes.tex` - sample knowledge chapter
- `chapters/ttl-materials.tex` - sample TTL sheet
- `chapters/past-papers.tex` - sample past-paper treatment
- `chapters/editorial-guidelines.tex` - project-wide writing and review rules

## Compilation

Recommended command:

```bash
latexmk -xelatex main.tex
```

The template also uses only widely available TeX Live packages and can normally be
compiled with pdfLaTeX:

```bash
latexmk -pdf main.tex
```

## Student and editor editions

Show solutions:

```latex
\documentclass[solutions]{course-notes}
```

Hide all `coursesolution` environments:

```latex
\documentclass[nosolutions]{course-notes}
```

## Course metadata

Edit the metadata block at the beginning of `main.tex`:

```latex
\School{Department of Mathematical Sciences}
\CourseCode{MTH123}
\CourseTitle{Course Name}
\AcademicYear{2026--2027}
\Term{Semester 1}
\Instructor{Teaching Team}
\Coordinator{Student Society Editorial Group}
\DocumentVersion{1.0.1}
\LastUpdated{15 July 2026}
```

## Main environments

Standard mathematical environments:

- `definition`, `theorem`, `lemma`, `proposition`, `corollary`
- `example`, `exercise`, `remark`, `observation`, `assumption`, `proof`

Information boxes:

- `learningobjectives`
- `keypoint`
- `examnote`
- `commonerror`
- `editorialnote`

Course-material environments:

- `ttlproblem`
- `pastpaperproblem`
- `coursesolution`
- `markscheme`

## English-first and optional Chinese text

The template is designed for English documents. If substantial Chinese text is needed,
compile with XeLaTeX and add `xeCJK` plus an available CJK font in `main.tex`. Keep the
main terminology and mathematical notation consistent with the English course materials.

## Editorial principle

Do not modify the class file separately for each course. Improvements to the shared
layout should be reviewed once and propagated to all course repositories through a
versioned central copy.
