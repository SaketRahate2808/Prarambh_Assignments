using System;
public class NegativeNumberException : Exception
{
    public NegativeNumberException(string message) : base(message) { }
}

class ArrayReader
{
    static void Main()
    {
        try
        {
            Console.WriteLine("Enter the number of elements in the array:");
            int size = int.Parse(Console.ReadLine());

            int[] numbers = new int[size];

            for (int i = 0; i < size; i++)
            {
                Console.WriteLine($"Enter number {i + 1}:");
                int num = int.Parse(Console.ReadLine());
                if (num < 0)
                {
                    throw new NegativeNumberException("Negative numbers are not allowed.");
                }

                numbers[i] = num;
            }

            Console.WriteLine("\nArray entered successfully:");
            foreach (int n in numbers)
            {
                Console.Write(n + " ");
            }
        }
        catch (FormatException)
        {
            Console.WriteLine("Error: Please enter a valid integer.");
        }
        catch (NegativeNumberException ex)
        {
            Console.WriteLine("Custom Exception: " + ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Unexpected error: " + ex.Message);
        }
    }
}
