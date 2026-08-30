# CS471 Programming Languages

Fall 2025.
Syntax and parsing, then a tour of the functional, object-oriented, logic, and
parallel paradigms.
Follows Sebesta.

## Layout

`Assignments/`
Homework 0 through 6, the lexer and parser exercise, the Prolog work, and
`Project_1`, the OpenMP scaling study.
`Assignments/Source-code/` holds the Scheme examples from class.

`In-Class-Assignments/`
Short exercises done during lecture, with the notes and diagrams that go
with them.

`lecture-slides/`
The slide decks. See `lecture-slides/README.md`, which also explains which
files in there are broken.

`final-project/`
The JavaScript write-up and presentation.

`resources/`
Reference material and example code handed out during the course.
See `resources/README.md`.

## My code

- `Assignments/Homework-2/` recursive descent parser work in C
  (`debug.c`, `integrated.c`, `parser.c`; `front.c` is the book's lexer).
- `Assignments/Homework-3/hw3.py` and `Assignments/Homework-4/hw4.py`
- `Assignments/Project_1/parallel_speedup_demo.c` with `plots.py` for the
  charts and `openmp_results.md` for the numbers.
  Build it with `gcc -O3 -fopenmp parallel_speedup_demo.c -o
  parallel_speedup_demo`.
