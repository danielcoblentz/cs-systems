class Base {
    public String identify() {
        return "Base::identify";
    }
}

class Derived extends Base {
    // Overrides the behavior rather than hiding it.
    @Override
    public String identify() {
        return "Derived::identify";
    }

    public void hideInPlainSight() {
        System.out.println("Derived is hiding extra behavior here");
    }
}

public class Hide {
    public static void main(String[] args) {
        Base asBase = new Derived();
        System.out.println(asBase.identify());

        if (asBase instanceof Derived) {
            ((Derived) asBase).hideInPlainSight();
        }
    }
}
