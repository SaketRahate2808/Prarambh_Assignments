using System;

class UserAccessControl
{
    static void Logger(string message)
    {
        Console.WriteLine($"[INFO] Message: {message}");
    }
    static void Logger(string message, string level)
    {
        Console.WriteLine($"[{level.ToUpper()}] Message: {message}");
    }
    static void Logger(string message, string level, float timestamp)
    {
        Console.WriteLine($"[{level.ToUpper()}] Message: {message} | Timestamp: {timestamp}");
    }

    static void Main()
    {
        Console.WriteLine("Enter the message:");
        string msg = Console.ReadLine();

        Console.WriteLine("Enter the level of the message (INFO, WARNING, ERROR):");
        string level = Console.ReadLine();

        Console.WriteLine("Enter the timestamp for the message:");
        float timestamp = float.Parse(Console.ReadLine());

        Console.WriteLine("\n--- Logging Outputs ---");
        Logger(msg);                       
        Logger(msg, level);                 
        Logger(msg, level, timestamp);      
    }
}
