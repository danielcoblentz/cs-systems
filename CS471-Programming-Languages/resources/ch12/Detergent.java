class Cleanser {
    private final StringBuilder log = new StringBuilder();

    public void append(String action) {
        log.append(action).append(' ');
    }

    public void dilute() {
        append("dilute()");
    }

    public void apply() {
        append("apply()");
    }

    public void scrub() {
        append("scrub()");
    }

    @Override
    public String toString() {
        return log.toString().trim();
    }
}

public class Detergent extends Cleanser {
    public void foam() {
        append("foam()");
    }

    // Demonstrates overriding.
    @Override
    public void scrub() {
        append("Detergent.scrub()");
        super.scrub();
    }

    public static void main(String[] args) {
        Detergent detergent = new Detergent();
        detergent.dilute();
        detergent.apply();
        detergent.scrub();
        detergent.foam();
        System.out.println(detergent);
    }
}
