

#imports
import math
from abc import ABC, abstractmethod




class Shape(ABC):  
    def __init__(self, name: str = "Unnamed"):  


        if not isinstance(name, str) or not name.strip():
            raise ValueError("name must be a non-empty string")
        self.name = name            
        self._kind = self.__class__.__name__
        self.__id = id(self)        


    @abstractmethod
    def area(self):
        pass


    @abstractmethod
    def perimeter(self):
        pass


    def __str__(self):    
        return f"{self._kind}('{self.name}')"


    @abstractmethod
    def toString(self):
        pass


# rectangle class
class Rectangle(Shape):
    def __init__(self, length, width, name="Rectangle"):
        super().__init__(name)
        #  checking for valid inputs
        if length <= 0 or width <= 0:
            raise ValueError("length and width must be positive")
        self._length = length  
        self._width = width  


    def area(self):
        return self._length * self._width


    def perimeter(self):
        return 2 * (self._length + self._width)
   
    def toString(self):
        return f"{self.name}: Length={self._length}, Width={self._width}, Area={self.area()}"




# circle class
class Circle(Shape):
    def __init__(self, radius, name="Circle"):
        super().__init__(name)
        if radius <= 0:
            raise ValueError("radius must be positive")
        self._radius = radius  


    def area(self):
        return math.pi * self._radius ** 2


    def perimeter(self):
        return 2 * math.pi * self._radius
   
    def toString(self):
        return f"{self.name}: Radius={self._radius}, Area={self.area():.2f}"




# triangle class
class Triangle(Shape):
    def __init__(self, a=None, b=None, c=None, height=None, base=None, name="Triangle"):
        super().__init__(name)
        if base is not None and height is not None:
            if base <= 0 or height <= 0:
                raise ValueError("base and height must be positive")
            self._base = base
            self._height = height
            self._a = self._b = self._c = None  
        elif a is not None and b is not None and c is not None:
            if a <= 0 or b <= 0 or c <= 0:
                raise ValueError("side lengths must be positive")
            # tri inequality check
            if a + b <= c or a + c <= b or b + c <= a:
                raise ValueError("sides do not form a valid triangle")
            self._a = a
            self._b = b
            self._c = c
            self._base = self._height = None
        else:
            raise ValueError("provide either three sides (a, b, c) or base and height")


    def area(self):
        if self._base is not None and self._height is not None:
            return 0.5 * self._base * self._height
        else:
            s = (self._a + self._b + self._c) / 2
            return math.sqrt(s * (s - self._a) * (s - self._b) * (s - self._c))


    def perimeter(self):
        if self._a is not None and self._b is not None and self._c is not None:
            return self._a + self._b + self._c
        else:
            raise ValueError("Cannot calculate perimeter without all three sides")
   
    def toString(self):
        if self._base is not None and self._height is not None:
            return f"{self.name}: Base={self._base}, Height={self._height}, Area={self.area():.2f}"
        else:
            return f"{self.name}: Sides=({self._a}, {self._b}, {self._c}), Area={self.area():.2f}, Perimeter={self.perimeter():.2f}"




if __name__ == "__main__":
    # single loop of shapes (not sure if we need this double check plz)
    shapes = [
        Rectangle(5.0, 3.0, "my rectangle"),
        Circle(4.0, "My circle"),
        Triangle(3, 4, 5, name="my triangle (sides)"),
        Triangle(base=6, height=8, name="My triangle (base/height)")
    ]
   
    print(" Polymorphism demonstration")
    print("Processing a collection of different shapes:")
    print()
   
    total_area = 0
    for shape in shapes:
        print(f"shape: {shape}")
        print(f"details: {shape.toString()}")
        area = shape.area()
        total_area += area
        print(f"area: {area:.2f}")
       
        try:
            perimeter = shape.perimeter()
            print(f"perimeter: {perimeter:.2f}")
        except ValueError as e:
            print(f"perimeter: {e}")
   
    print(f"total area of all shapes: {total_area:.2f}")
    print()
   
    # single input from user
    print("user input mode")
    print("pick one shape: rectangle, circle, triangle")
    choice = input("enter choice: ").strip().lower()




    if choice == "rectangle":
        try:
            length = float(input("enter length: "))
            width = float(input("enter width: "))
            rect = Rectangle(length, width)
            print(rect.toString())
            print(f"rectangle perimeter: {rect.perimeter()}")
        except ValueError as e:
            print(f"Error: {e}")

    elif choice == "circle":
        try:
            radius = float(input("enter radius: "))
            circle = Circle(radius)
            print(circle.toString())
            print(f"circle circumference: {circle.perimeter()}")
        except ValueError as e:
            print(f"Error: {e}")

    elif choice == "triangle":
        try:
            use_height = input("use base/height? (y/n): ").strip().lower()
            if use_height == "y":
                base = float(input("base: "))
                height = float(input("height: "))
                tri = Triangle(base=base, height=height)
            else:
                print("enter 3 sides of the triangle:")
                a = float(input("side a: "))
                b = float(input("side b: "))
                c = float(input("side c: "))
                tri = Triangle(a, b, c)

            print(tri.toString())
            try:
                print(f"triangle perimeter: {tri.perimeter()}")
            except ValueError as e:
                print(f"perimeter: {e}")
        except ValueError as e:
            print(f"Error: {e}")

    else: # invalid input
        print("unknown shape")





