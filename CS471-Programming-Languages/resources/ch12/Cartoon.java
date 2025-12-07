public class Cartoon extends Drawing {
    public Cartoon() {
        System.out.println("Cartoon constructor");
    }

    @Override
    public void draw() {
        super.draw();
        System.out.println("Exaggerating proportions for humor");
    }

    public static void main(String[] args) {
        Cartoon cartoon = new Cartoon();
        cartoon.draw();
    }
}
