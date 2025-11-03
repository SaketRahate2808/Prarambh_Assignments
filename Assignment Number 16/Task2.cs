namespace ConsoleApp1
{
    internal class Program
    {
        static void ShowEvenNumbers()
        {
            int i = 0;

            while (i <= 20)
            {
                Console.Write($"{i}  ");
                i = i + 2; //   i +=  2;
            }
        }

        static void ShowOddNumbers()
        {
            int i = 1;

            while (i <= 20)
            {
                Console.Write($"{i}  ");
                i = i + 2; //   i +=  2;
            }
        }

        static void ShowFiveMultiples()
        {
            for (int j = 1; j <= 10; j++)
            {
                Console.Write($"{j * 5} ");
            }
        }

        //    3  5  6  9   10   12  15  18  20  21  24  25  27  30
        static void ShowCustomNumbers()
        {
            for (int i = 1; i <= 30; i++)
            {
                if (i % 3 == 0 || i % 5 == 0)
                {
                    Console.Write($"{i} ");
                }
            }
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Program loops");
            Console.WriteLine("Enter 1 for finding even numbers ");
            Console.WriteLine("Enter 2 for finding odd numbers ");
            Console.WriteLine("Enter 3 to find multiples of 5");
            Console.WriteLine("Enter 4 to find the list of custom numbers");
            Console.WriteLine("Exit");

            Console.WriteLine("Enter a valid number to perform the operation");
            int choice = int.Parse(Console.ReadLine());


            switch (choice)
            {
                case 1:
                    ShowEvenNumbers();
                    Console.WriteLine();
                    break;

                case 2:
                    ShowOddNumbers();
                    Console.WriteLine();
                    break;

                case 3:
                    ShowFiveMultiples();
                    Console.WriteLine();
                    break;

                case 4:
                    ShowCustomNumbers();
                    Console.WriteLine();
                    break;

                default:
                    Console.WriteLine("Exit the program and enter a valid choice");
                    break;
            }


            Console.ReadLine();
        }
    }
}
