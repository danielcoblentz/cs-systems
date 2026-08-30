# cs-systems

Coursework from three systems courses: computer organization,
operating systems, and programming languages.
Each course has its own folder with a README describing what is in it.

| Folder | Course | Term |
| --- | --- | --- |
| `CS226-Computer-Organization-and-Design/` | Computer Organization and Design | Fall 2024 |
| `CS464-Operating-Systems/` | Operating Systems | Spring 2025 |
| `CS471-Programming-Languages/` | Programming Languages | Fall 2025 |

Most of the repository is course material I was given: slide decks, assignment
sheets, reading, and example programs.
My own work is the RISC-V assembly in `CS226-.../Homework/`, the C, Python, and
Scheme under `CS471-.../Assignments/`, and the write-ups in
`CS471-.../final-project/`.
CS464 was a written course, so there is no code of mine in it.

Within each course the layout is the same idea: `Homework/` or `Assignments/`
for graded work, `lecture-slides/` for the decks, and a folder of reference
material.

## Building the code

- RISC-V assembly needs RARS, which is checked in at
  `CS226-Computer-Organization-and-Design/RARS/`.
  `java -jar "rars1_6 (1).jar" a nc file.asm` assembles a file without opening
  the GUI.
- The C in `CS471-.../Assignments/Project_1/` and `CS471-.../resources/`
  needs gcc with `-fopenmp`, and the MPI examples need `mpicc`.
- The lex and yacc examples need bison and flex.
  `CS471-.../resources/LexAndYaccCode/build.txt` has the commands.
