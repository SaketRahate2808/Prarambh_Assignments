using System;
using static System.Formats.Asn1.AsnWriter;
class UserAccessControl
{
    class Customer
    {
        public int CustId { get; set; }
        public string Name { get; set; }

        public string City { get; set; }    

        public  Customer()
        {
            CustId = 0;
            Name = "";
            City = "";
        }

        public Customer(int custid)
        {
            CustId = custid;
        }

        public Customer(string name)
        {
            Name = name;
        }

        public Customer(int custid, string name, string city)
        {
            Name = name;
            CustId = custid;
            City = city;
        }

        public Customer(int custid, string name)
        {
            Name = name;
            CustId = custid;
        }

        public void ShowDetails()
        {
            Console.WriteLine($"[Customer Details] Name : {Name}, CustId: {CustId}, City: { City}");
        }

    }



    static void Main()
    {
        Customer c1 = new Customer();
        Customer c2 = new Customer(10256);
        Customer c3 = new Customer(10256,"Scott");
        Customer c4 = new Customer(10256, "Scott ", "Hyderabad");


        c1.ShowDetails();
        c2.ShowDetails();
        c3.ShowDetails();
        c4.ShowDetails();

        Console.ReadLine();


    }
}
