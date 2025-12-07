#include <iostream>
#include <string>

class Pet {
public:
    explicit Pet(std::string name) : name_(std::move(name)) {}
    virtual ~Pet() = default;

    virtual void speak() const {
        std::cout << name_ << " makes a noise.\n";
    }

protected:
    std::string name_;
};

class Cat : public Pet {
public:
    using Pet::Pet;

    void speak() const override {
        std::cout << name_ << " says meow!\n";
    }
};

class Dog : public Pet {
public:
    using Pet::Pet;

    void speak() const override {
        std::cout << name_ << " says woof!\n";
    }
};

int main() {
    Cat luna("Luna");
    Dog rufus("Rufus");

    luna.speak();
    rufus.speak();
    return 0;
}
