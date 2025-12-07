public class Student extends Person {
    private final String major;
    private final double gpa;

    public Student(String name, int age, String major, double gpa) {
        super(name, age);
        if (major == null || major.isBlank()) {
            throw new IllegalArgumentException("Major must not be empty");
        }
        if (gpa < 0.0 || gpa > 4.0) {
            throw new IllegalArgumentException("GPA must be between 0.0 and 4.0");
        }
        this.major = major.trim();
        this.gpa = gpa;
    }

    public String getMajor() {
        return major;
    }

    public double getGpa() {
        return gpa;
    }

    @Override
    public String describe() {
        return super.describe() + " — " + major + " major, GPA " + String.format("%.2f", gpa);
    }
}
