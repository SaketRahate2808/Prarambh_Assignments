using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Customer
    {
        public int ProdId { get; set; }
        public string ProdName { get; set; }

        public float ProdPrice { get; set; }
        public int ProdQuantity { get; set; }

        public Customer()
        {
            ProdId = 0;
            ProdName = "";
            ProdPrice = 0;
            ProdQuantity = 0;
        }

        public Customer(int prodid, string prodname, float prodprice, int prodquantity)
        {
            ProdId = prodid;
            ProdName = prodname;
            ProdPrice = prodprice;
            ProdQuantity = prodquantity;
        }

        public void ShowDetails()
        {
            Console.WriteLine($"[Product Details]  ProdId: {ProdId}, Product Name : {ProdName},Product Price : {ProdPrice} , Product Quantity: {ProdQuantity}");
        }

    }




    internal class Program
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer(); 
            Console.WriteLine("Enter the details of the products ");
            Console.WriteLine("Enter the Product ID");
            customer.ProdId = int.Parse(Console.ReadLine());
            Console.WriteLine($"The product ID is {customer.ProdId}");

            Console.WriteLine("Enter the Product Name");
            customer.ProdName = Console.ReadLine();
            Console.WriteLine($"The product Name is {customer.ProdName}");

            Console.WriteLine("Enter the Product Price");
            customer.ProdPrice = float.Parse(Console.ReadLine());
            Console.WriteLine($"The product Price is {customer.ProdPrice}");

            Console.WriteLine("Enter the Product Quantity");
            customer.ProdQuantity = int.Parse(Console.ReadLine());
            Console.WriteLine($"The product Quantity is {customer.ProdQuantity}");

            customer.ShowDetails();
        }
    }
}
