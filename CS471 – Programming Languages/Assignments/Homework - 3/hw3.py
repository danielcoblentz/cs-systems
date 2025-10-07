import math

# main class which will extend to other shapes
class Shape:
    def area(self):
        raise NotImplementedError("Subclass must implement area()")

    def perimeter(self):
        raise NotImplementedError("subclass must implement perimeter()")
    # still wokring on this method and implemnting
    def toString(self, text, nums=None):
        return text + " " + str(nums)

# rectangle class
class Rectangle(Shape):
    def __init__(self, length, width):
        # error checking for vallid inputs
        if length < 0 or width < 0:
            print("length and width must be positive")
        self.length = length
        self.width = width

    def area(self):
        return "the area of hte rectangle is " + self.length * self.width

    def perimeter(self):
        return 2 * (self.length + self.width)


# circle class
class Circle(Shape):
    def __init__(self, radius):
        if radius < 0:
            print("radius must be positive")
        self.radius = radius

    def area(self):
        return math.pi * self.radius ** 2

    def perimeter(self):
        return 2 * math.pi * self.radius


# triangle class 
class Triangle(Shape):
    def __init__(self, a, b, c, height=None, base=None):
        if a < 0 or b < 0 or c < 0:
            print("side lengths must positive")
        self.a = a
        self.b = b
        self.c = c
        self.height = height
        self.base = base

    def area(self):
        if self.base is not None and self.height is not None:
            return 0.5 * self.base * self.height
        

    def perimeter(self):
        return self.a + self.b + self.c


if __name__ == "__main__":
    print("pick one shape: rectangle, circle, triangle")
    choice = input("enter  choice: ").strip().lower()

    if choice == "rectangle":
        length = float(input("Enter length: "))
        width = float(input("Enter width: "))
        rect = Rectangle(length, width)
        print(rect.toString("Rectangle area:", rect.area()))
        print(f"Rectangle perimeter: {rect.perimeter()}")

    elif choice == "circle":
        radius = float(input("enter radius: "))
        circle = Circle(radius)
        print(f"circle area: {circle.area()}")
        print(f"circle circumference: {circle.perimeter()}")

    elif choice == "triangle":
        print("enter 3 sides of the triangle:")
        a = float(input("side a: "))
        b = float(input("side b: "))
        c = float(input("side c: "))
        use_height = input("do you also want to enter base and height? (y/n): ").strip().lower()

        if use_height == "y":
            base = float(input("base: "))
            height = float(input("height: "))
            tri = Triangle(a, b, c, base=base, height=height)
        else:
            tri = Triangle(a, b, c)

        print(f"triangle area: {tri.area()}")
        print(f"triangle perimeter: {tri.perimeter()}")

