<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="try2.aspx.cs" Inherits="proj1.try2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://js.stripe.com/v3/"></script>
    <script>
        var stripe = Stripe('pk_test_TYooMQauvdEDq54NiTphI7jx');
        var form = document.getElementById("form1");
        form.addEventListener("submit", function (e) {
            e.preventDefault();
            stripe.redirectToCheckOut({
                sessionId: "<%= sessionId %>"
            });
        } )
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button type="submit">CheckOut</button>
            
        </div>
       
    </form>
</body>
</html>
