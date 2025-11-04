using System;

class UserAccessControl
{
    static void EmailSimulator(String sender="defaultsender@gmail.com" , String recipient="defaultrecepient@gmail.com" , String subject="No subject" , String message="This is a demo message", bool isImp = false)
    {

        Console.WriteLine("Sender: " + sender);
        Console.WriteLine("Recipient: " + recipient);
        Console.WriteLine("Subject: " + subject);
        Console.WriteLine("Message: " + message);
        Console.WriteLine("Important: " + (isImp ? "Yes" : "No"));

    }
    static void Main()
    {
        EmailSimulator("alice@example.com", "bob@example.com",  "Meeting Update", "Please join the meeting at 3 PM.", true);
        EmailSimulator("bob@example.com", "alice@gmail.com");
        EmailSimulator();

    }
}
