using System;
class UserAccessControl
{
    static void Geometry(int side)
    {
        int Area = side * side;
        Console.WriteLine($"The area of the sqaure is {Area}");
    }

    static void Geometry(double length, double breadth)
    {
        double Area = length * breadth;
        Console.WriteLine($"The area of the sqaure is {Math.Round(Area, 2)}");
        

    }

    static void Geometry(float radius)
    {
        float Area = (float)(Math.PI * radius * radius);
        Console.WriteLine($"The area of the sqaure is {Math.Round(Area, 2)}");

    }


    static void Main()
    {
        Console.WriteLine("Enter the side for square ");
        int s = int.Parse(Console.ReadLine());
        Console.WriteLine("Enter the length of the rectangle ");
        double l = double.Parse(Console.ReadLine());

        Console.WriteLine("Enter the breadth of the rectangle ");
        double b = double.Parse(Console.ReadLine());

        Console.WriteLine("Enter the radius of the circle ");
        float r = float.Parse(Console.ReadLine());
        Geometry(s);
        Geometry(l, b);
        Geometry((float)r);
    }
}
