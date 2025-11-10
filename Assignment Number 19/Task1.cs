namespace ConsoleApp4
{
    abstract class Shape
    {
        public double Area { get; set; }
        public abstract double CalculateArea();
        public void DisplayArea()
        {
            Console.WriteLine($"The area is : {Area}");
        }
    }

    class Circle : Shape
    {
        public double radius;
        public Circle(double radius)
        {
            this.radius = radius;
        }

        public override double CalculateArea()
        {
            Area = Math.Round(Math.PI * radius * radius, 2);
            return Area;
        }
    }

    class Rectangle : Shape
    {
        public int length;
        public int breadth;

        public Rectangle(int length, int breadth)
        {
            this.length = length;
            this.breadth = breadth;
        }

        public override double CalculateArea()
        {
            Area = length * breadth;
            return Area;
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Circle c1 = new Circle(32.4);
            c1.CalculateArea();
            c1.DisplayArea();

            Rectangle r1 = new Rectangle(12, 43);
            r1.CalculateArea();
            r1.DisplayArea();
        }
    }
}
