namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the user level score (1 to 25):");
            int userScore = int.Parse(Console.ReadLine());

            if (userScore < 1 || userScore > 25)
            {
                Console.WriteLine("Invalid user level score. It must be between 1 and 25.");
                return;
            }

            Console.WriteLine("Does the user have admin access? (true/false):");
            bool isAdmin = bool.Parse(Console.ReadLine());

            Console.WriteLine("Does the user have special permissions? (true/false):");
            bool hasSpecialPermission = bool.Parse(Console.ReadLine());

            // Add scores based on conditions
            if (isAdmin)
            {
                userScore += 50;
            }

            if (hasSpecialPermission)
            {
                userScore += 25;
            }

            // Determine access level
            string accessLevel;
            if (userScore >= 75)
            {
                accessLevel = "Full Access";
            }
            else if (userScore >= 50)
            {
                accessLevel = "Admin Access";
            }
            else if (userScore >= 25)
            {
                accessLevel = "Standard Access";
            }
            else
            {
                accessLevel = "Restricted Access";
            }

            Console.WriteLine($"Final Access Score: {userScore}");
            Console.WriteLine($"Access Level: {accessLevel}");
        }
    }
}
