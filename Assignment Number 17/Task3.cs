using System;

class UserAccessControl
{
    // Basic message logger
    static void Logger(string message)
    {
        Console.WriteLine($"[INFO] Message: {message}");
    }

    // Logger with level
    static void Logger(string message, string level)
    {
        Console.WriteLine($"[{level.ToUpper()}] Message: {message}");
    }

    // Logger with level and timestamp
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
        Logger(msg);                        // Basic
        Logger(msg, level);                 // With level
        Logger(msg, level, timestamp);      // With level and timestamp
    }
}
