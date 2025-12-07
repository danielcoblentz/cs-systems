public class Drawing extends Art {
    public Drawing() {
        System.out.println("Drawing constructor");
    }

    @Override
    public void draw() {
        super.draw();
        System.out.println("Adding line work and shading");
    }
}
