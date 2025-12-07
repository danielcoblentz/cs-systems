public class Person {
    private final String name;
    private final int age;

    public Person(String name, int age) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("Name must not be empty");
        }
        if (age < 0) {
            throw new IllegalArgumentException("Age must be non-negative");
        }
        this.name = name.trim();
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String describe() {
        return name + " (" + age + "y)";
    }

    @Override
    public String toString() {
        return describe();
    }
}
