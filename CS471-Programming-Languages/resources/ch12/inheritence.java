public class Name {
    protected String myName;

    public Name(){}
	
    public Name(String aName){myName = aName;}

    public void setName(String name) {
        myName = name;
    }

    public void print() {
        System.out.println(myName);
    }
}

public class Contact extends Name {
    private String myAddress;
   
    public Contact(){}
	
    public Contact(String aName, String aAddress){
	super(aName);
	myAddress = aAddress;}


    public void setAddress(String address) {
        myAddress = address;
    }

    @Override
    public void print() {
        super.print();
        System.out.println(myAddress);
    }

    public static void main(String[] args) {
        Name aName = new Contact(); // Polymorphic reference

        aName.setName("John McClane");

        aName.setAddress("137th floor, Nakatome Towers");

        aName.print();
    }
} {
    
}
