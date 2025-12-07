interface Dinosaur {
    void roar();
}

interface Herbivore {
    void graze();
}

interface Carnivore {
    void hunt();
}

class Triceratops implements Dinosaur, Herbivore {
    @Override
    public void roar() {
        System.out.println("Triceratops bellows with three mighty horns!");
    }

    @Override
    public void graze() {
        System.out.println("Triceratops grazes peacefully.");
    }
}

class Velociraptor implements Dinosaur, Carnivore {
    @Override
    public void roar() {
        System.out.println("Velociraptor screeches sharply.");
    }

    @Override
    public void hunt() {
        System.out.println("Velociraptor hunts in a coordinated pack.");
    }
}

public class Jurassic {
    public static void main(String[] args) {
        Dinosaur herbivore = new Triceratops();
        Dinosaur carnivore = new Velociraptor();

        herbivore.roar();
        carnivore.roar();

        if (herbivore instanceof Herbivore) {
            ((Herbivore) herbivore).graze();
        }
        if (carnivore instanceof Carnivore) {
            ((Carnivore) carnivore).hunt();
        }
    }
}
