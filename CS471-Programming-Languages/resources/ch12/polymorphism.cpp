#include <cmath>
#include <iostream>
#include <memory>
#include <vector>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

class Shape {
public:
    virtual ~Shape() = default;
    virtual double area() const = 0;
    virtual std::string name() const = 0;
};

class Rectangle : public Shape {
public:
    Rectangle(double width, double height) : width_(width), height_(height) {}

    double area() const override { return width_ * height_; }
    std::string name() const override { return "Rectangle"; }

private:
    double width_;
    double height_;
};

class Circle : public Shape {
public:
    explicit Circle(double radius) : radius_(radius) {}

    double area() const override { return M_PI * radius_ * radius_; }
    std::string name() const override { return "Circle"; }

private:
    double radius_;
};

void print_area(const Shape& shape) {
    std::cout << shape.name() << " area: " << shape.area() << '\n';
}

int main() {
    std::vector<std::unique_ptr<Shape>> shapes;
    shapes.emplace_back(std::make_unique<Rectangle>(3.0, 4.0));
    shapes.emplace_back(std::make_unique<Circle>(2.0));

    for (const auto& shape : shapes) {
        print_area(*shape);
    }
    return 0;
}
