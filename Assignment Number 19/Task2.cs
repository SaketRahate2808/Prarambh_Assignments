namespace ConsoleApp4
{
    interface IPayment
    {
        void Pay(double amount);
    }

    class CreditCardPayment : IPayment
    {
        public void Pay(double amount)
        {
            Console.WriteLine("Payment using Credit Card");
            Console.WriteLine($"The amount paid will be {amount}");
        }
    }

    class UPIPayment : IPayment
    {
        public void Pay(double amount)
        {
            Console.WriteLine("Payment using UPI");
            Console.WriteLine($"The amount paid will be {amount}");
        }
    }

    class PayPalPayment : IPayment
    {
        public void Pay(double amount)
        {
            Console.WriteLine("Payment using PayPal");
            Console.WriteLine($"The amount paid will be {amount}");
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            CreditCardPayment payment = new CreditCardPayment();
            payment.Pay(129.32);
            UPIPayment uPIPayment = new UPIPayment();
            uPIPayment.Pay(234.43);
            PayPalPayment payment3 = new PayPalPayment();
            payment3.Pay(843.32);
        }
    }
}
