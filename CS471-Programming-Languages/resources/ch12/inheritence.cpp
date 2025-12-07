#include <iostream>
#include <cstring>

using namespace std;

class Name
{
public:
        Name(void) { myName = 0; }

        Name(const char* aName)
        {	myName = new char[strlen(aName)+1];
        	strcpy(myName,aName);
	}

        ~Name(void) { delete[] myName; }


        void SetName(const char* n)
        {
                delete [] myName;
                myName = new char[strlen(n)+1];
                strcpy(myName,n);
        }


        virtual void Print(void) const { cout << myName << endl; }


private:
        char* myName;
};

class Contact: public Name
{
public:
        Contact(void) { myAddress = 0; }
        Contact(const char* aName, const char* aAddress):Name(aName)
        {
		myAddress = new char[strlen(aAddress)+1];
		strcpy(myAddress, aAddress);
	}

        ~Contact(void) { delete[] myAddress; }

        void SetAddress(const char* c)
        {
		delete [] myAddress;
                myAddress = new char[strlen(c)+1];
                strcpy(myAddress,c);
        }

        void Print(void) const
        {
                Name::Print();
                cout << myAddress << endl;
        }

private:
        char* myAddress;
};

int main(void)
{
        Name * aName = new Contact();

        aName->SetName("John McClane");
        //aName->SetAddress("137th floor, Nakatome Towers"); // This won't work, as 'Name' does not have 'SetAddress'

        aName->Print();

        
}