using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using Stripe;

namespace proj1
{
    public partial class try2 : System.Web.UI.Page
    {
        /*public string sessionId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            StripeConfiguration.ApiKey = "sk_test_tR3PYbcVNZZ796tH88S4VQ2u";
            var options = new Stripe.Checkout.SessionCreateOptions
            {
                SuccessUrl = "https://example.com/success",
                CancelUrl = "https://example.com/cancel",
                PaymentMethodTypes = new List<string> { "card" },
                LineItems = new List<Stripe.Checkout.SessionLineItemOptions>
    {
        new Stripe.Checkout.SessionLineItemOptions
        {
            Name = "Service",
            Amount = 200, // Amount in cents
            Currency = "inr", // Currency
            Quantity = 2,
        },
    },
                Mode = "payment", // Set the mode to payment
            };

            var service = new Stripe.Checkout.SessionService();
            Stripe.Checkout.Session stripeSession = service.Create(options);
            sessionId = stripeSession.Id;

        }
        }*/
    }
}