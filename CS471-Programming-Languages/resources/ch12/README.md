# Chapter 12 examples

Inheritance, polymorphism, and basic object orientation.

Java: `Person.java`, `Student.java`, `Contact.java`, `Inheritance.java`,
`Inheritence.java`, `Hide.java`, `Chess.java`, `Detergent.java`,
`Jurassic.java`, `Cartoon.java`, plus `Art.java` and `Drawing.java`.
`TestPersonStudent.java` has a main method that exercises the first few.

C++: `inheritance.cpp`, `inheritence.cpp`, `polymorphism.cpp`, `pet.cpp`,
`inclass_cpp_1.cpp`, `inclass_2_cpp.cpp`.

`jurassic.ajav` is an earlier version of `Jurassic.java` saved with a typo in
the extension, so nothing compiles it.

Prebuilt binaries are in `bin/`: `polymorphism`, `in_class_2`, and three
`.class` files.

## Building

    javac *.java && java TestPersonStudent
    g++ -std=c++17 polymorphism.cpp -o polymorphism_demo && ./polymorphism_demo
