#include <iostream>
#include <string>

class Vehicle {
public:
    explicit Vehicle(std::string name) : name_(std::move(name)) {
        std::cout << "Vehicle constructed: " << name_ << '\n';
    }

    virtual ~Vehicle() = default;

    virtual std::string description() const {
        return "Generic vehicle: " + name_;
    }

protected:
    std::string name_;
};

class Car : public Vehicle {
public:
    Car(std::string name, int doors) : Vehicle(std::move(name)), doors_(doors) {}

    std::string description() const override {
        return "Car (" + name_ + ") with " + std::to_string(doors_) + " doors";
    }

private:
    int doors_;
};

int main() {
    Vehicle bike("Road bike");
    Car sedan("Sedan", 4);

    std::cout << bike.description() << '\n';
    std::cout << sedan.description() << '\n';
    return 0;
}
