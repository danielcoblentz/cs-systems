# CS226 Computer Organization and Design

Fall 2024. RISC-V assembly, data representation, and the basics of processor
design.
My work in this folder is the assembly under `Homework/`; everything else is
course material I was given.

## Layout

`Homework/Homework-1` through `Homework/Homework-7`
Each folder holds the assignment sheet and whatever I turned in for it.
Homework 4 through 7 include my RISC-V source (`hw4.asm`, `hw5.asm`,
`hw6.asm`, `hw7.asm`) plus the memory dumps and screenshots the write-ups
asked for.
Homework 1 through 3 were written answers only, so there is no code.

`lecture-slides/`
PDF exports of the course decks, grouped by chapter.
Chapters 1 through 5 have their own folders; `Computer Performance/` and
`Data Representation/` cover the two topics that spanned several lectures.

`sample-code/`
Example programs handed out in class: branching, system calls, integer
multiply, divide-by-zero handling, floating point, and a find-largest routine
written in both assembly and Java.

`exam/`
The final exam topic list, plus the articles on Moore's law and hardware
trends that the last part of the course was built around.

`RARS/`
The RARS 1.6 simulator jar used to assemble and run everything in
`Homework/`, with a short description of the tool.
Run it with `java -jar "rars1_6 (1).jar"`.

`CS 226 Fall 2024 Course Syllabus (1).docx`
The syllabus.

## Running the assembly

Open a `.asm` file in RARS, assemble, then run.
To check that a file assembles without opening the GUI:

    java -jar "RARS/rars1_6 (1).jar" a nc "Homework/Homework-6/hw6.asm"

All four homework programs assemble clean under RARS 1.6.
