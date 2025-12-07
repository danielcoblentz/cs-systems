public class TestPersonStudent {
    public static void main(String[] args) {
        Person ada = new Person("Ada Lovelace", 36);
        Student grace = new Student("Grace Hopper", 25, "Computer Science", 3.92);

        Contact contact = new Contact(grace, "grace.hopper@example.edu", "555-0101");

        System.out.println("Person:  " + ada);
        System.out.println("Student: " + grace.describe());
        System.out.println("Contact: " + contact);
    }
}
