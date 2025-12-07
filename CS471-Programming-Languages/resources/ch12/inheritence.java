/**
 * Simple inheritance demo kept self-contained to avoid clashing with the
 * top-level Contact/Person classes elsewhere in this folder.
 */
public class Inheritence { // keeping file's original spelling
    static class Name {
        protected String myName;

        Name() {}

        Name(String aName) {
            myName = aName;
        }

        public void setName(String name) {
            myName = name;
        }

        public void print() {
            System.out.println(myName);
        }
    }

    static class Contact extends Name {
        private String myAddress;

        Contact() {}

        Contact(String aName, String anAddress) {
            super(aName);
            myAddress = anAddress;
        }

        public void setAddress(String address) {
            myAddress = address;
        }

        @Override
        public void print() {
            super.print();
            System.out.println(myAddress);
        }
    }

    public static void main(String[] args) {
        Contact contact = new Contact();
        Name asName = contact; // polymorphic reference

        asName.setName("John McClane");
        contact.setAddress("137th floor, Nakatomi Plaza");

        asName.print(); // prints name then address via override
    }
}
