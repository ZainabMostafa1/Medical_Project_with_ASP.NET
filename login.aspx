<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - medical</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
     <script type="text/javascript">
       if (Sys != null) {
           Sys.Application.add_load(AppLoad);
       }

       function AppLoad() {
           Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

           function beginRequest(sender, args) {
               // show the popup


               document.getElementById("statusPopup").style.position = "fixed";
               document.getElementById("statusPopup").style.display = "";

           }

           function endRequest(sender, args) {
               document.getElementById("statusPopup").style.display = "none";
               seconds = 60 * 1;
           }
       }

</script>
</head>
<body>
       <div id="auth">
         <div id="statusPopup" style="display: none; z-index: 1000; left: 49%; top: 49%;">
        <div>              
            <img src="../assets/images/bg/rings.gif" alt="Loading......" />
        </div>
    </div>
<div class="row h-100">
    <div class="col-lg-5 col-12">
        <div id="auth-left">
            <div class="auth-logo">
                <a href="index.aspx"><img src="assets/images/logo/logo2.png" style="width:70%; height:70%" alt="Logo"></a>
            </div>
            <h1 class="auth-title">Log in.</h1>
            <p class="auth-subtitle mb-5">Log in with your data.</p>

             <form action="login.aspx" runat="server" method="post">
    
                <div class="form-group position-relative has-icon-left mb-4">
                    <asp:TextBox runat="server" id="TextBox1" type="text" class="form-control form-control-xl" placeholder="Username"></asp:TextBox>
                    <div class="form-control-icon">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <div class="form-group position-relative has-icon-left mb-4">
                    <asp:TextBox runat="server" id="TextBox2" TextMode="Password" class="form-control form-control-xl" placeholder="Password"></asp:TextBox>
                    <div class="form-control-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                </div>
               <%-- <div class="form-check form-check-lg d-flex align-items-end">
                    <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label text-gray-600" for="flexCheckDefault">
                        Keep me logged in
                    </label>
                </div>--%>

         <asp:Button ID="Button1" CssClass="btn btn-primary btn-block btn-lg shadow-lg mt-5" runat="server" Text="Log in" OnClick="Button1_Click" />

                
            </form>
           <%-- <div class="text-center mt-5 text-lg fs-4">
                <p class="text-gray-600">Don't have an account? <a href="auth-register.html" class="font-bold">Sign
                        up</a>.</p>
                <p><a class="font-bold" href="auth-forgot-password.html">Forgot password?</a>.</p>
            </div>--%>
        </div>
    </div>
    <div class="col-lg-7 d-none d-lg-block">
        <div id="auth-right">

        </div>
    </div>
</div>

    </div>
</body>
</html>
