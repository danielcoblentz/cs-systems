class Animal {
    private final String name;

    Animal(String name) {
        this.name = name;
    }

    public void speak() {
        System.out.println(name + " makes a sound.");
    }
}

class Dog extends Animal {
    Dog(String name) {
        super(name);
    }

    @Override
    public void speak() {
        System.out.println("Woof! I'm a dog.");
    }
}

public class Inheritance {
    public static void main(String[] args) {
        Animal generic = new Animal("Creature");
        Animal fido = new Dog("Fido");

        generic.speak();
        fido.speak();
    }
}
