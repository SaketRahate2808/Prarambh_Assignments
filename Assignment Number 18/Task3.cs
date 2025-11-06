using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Employee
    {
        public int EmpId { get; set; }
        public string EmpName { get; set; }
        public string EmpJob { get; set; }

        public double Basic {  get; set; }
        public double HRA { get; set; }
        public double DA { get; set; }
        public double IT { get; set; }
        public double PF { get; set; }
        public double GrossSalary { get; set; }

        public Employee()
        {
            EmpId = 0;
            EmpName = "";
            EmpJob = "";
            Basic = 0;
            HRA = 0;
            DA = 0;
            IT = 0;
            PF = 0;
            GrossSalary = 0;
        }

        //public Employee(int prodid, string prodname, float prodprice, int prodquantity)
        //{
        //    ProdId = prodid;
        //    ProdName = prodname;
        //    ProdPrice = prodprice;
        //    ProdQuantity = prodquantity;
        //}

        public void CalcGrossSalary()
        {
            HRA = (float)Math.Round(0.15 * Basic, 2);
            DA = (float)Math.Round(0.08 * Basic, 2);
            IT = (float)Math.Round(0.10 * Basic, 2);
            PF = (float)Math.Round(0.05 * Basic,2);

            GrossSalary = Basic + HRA + DA - IT - PF;
        }
        public void PrintDetails()
        {
            Console.WriteLine($"The details of the employee are :\nEmployee Name :{EmpName}\nEmployee ID : {EmpId}\nEmployee Job: {EmpJob}\nBasic : {Basic}\nHRA: {HRA}\nDA: {DA}\nIT {IT}\nPF: {PF} ");
        }

    }




    internal class Program
    {
        static void Main(string[] args)
        {
            Employee e1 = new Employee();
            Console.WriteLine("Enter the details of the employee ");
            Console.WriteLine("Enter the Employee ID");
            e1.EmpId = int.Parse(Console.ReadLine());
            Console.WriteLine($"The employee ID is {e1.EmpId}");

            Console.WriteLine("Enter the Employee Name");
            e1.EmpName = Console.ReadLine();
            Console.WriteLine($"The Employee Name is {e1.EmpName}");

            Console.WriteLine("Enter the Employee Job");
            e1.EmpName = Console.ReadLine();
            Console.WriteLine($"The Employee job is {e1.EmpName}");

            Console.WriteLine("Enter the Basic Price");
            e1.Basic = float.Parse(Console.ReadLine());
            Console.WriteLine($"The Basic Price is {e1.Basic}");

            e1.CalcGrossSalary();
            e1.PrintDetails();
        }
    }
}
