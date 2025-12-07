public class Contact {
    private final Person person;
    private final String email;
    private final String phone;

    public Contact(Person person, String email, String phone) {
        if (person == null) {
            throw new IllegalArgumentException("Person is required");
        }
        this.person = person;
        this.email = email == null ? "" : email.trim();
        this.phone = phone == null ? "" : phone.trim();
    }

    public Person getPerson() {
        return person;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder(person.describe());
        if (!email.isEmpty()) {
            builder.append(" | email: ").append(email);
        }
        if (!phone.isEmpty()) {
            builder.append(" | phone: ").append(phone);
        }
        return builder.toString();
    }
}
