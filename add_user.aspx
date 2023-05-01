<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_user.aspx.cs" Inherits="add_user" %>

<!DOCTYPE html>
<html lang="en">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User - Medical</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
       <script type="text/javascript">

         $(function () {
             initdropdown();
         })
         function initdropdown() {
            $(".js-example-placeholder-single").select2({
                placeholder: "...Choose",
                allowClear: true
            });
        };
    </script>
      <%drDBEntities db = new drDBEntities();

          string r = "",u="",n="",f="";
          if( Session["user"]!=null )
          {
              // r = Session["role"].ToString();
              u = Session["user"].ToString();


              //if (r == "HR"||r=="CEO")
              //{

              //}else
              //{
              //     Response.Redirect("/login.aspx");
              //}
          }
          else
          {
              Response.Redirect("/login.aspx");
          }

                   %>
</head>
<body>
     <div id="auth">
        
<div class="row h-100">
    <div class="col-lg-5 col-12">
        <div id="auth-left">
            <div class="auth-logo">
                <a href="index.aspx"><img src="assets/images/logo/logo2.png" style="width:70%; height:70%" alt="Logo"></a>
            </div>
            <h1 class="auth-title">Add User</h1>
            <p class="auth-subtitle mb-5">Here you can add new user.</p>
    <form id="form1" runat="server">

           <%-- <form action="index.html">--%>
                <div class="form-group position-relative has-icon-left mb-4">
                    <asp:TextBox ID="name" required CssClass="form-control form-control-xl" runat="server" placeholder="Name"></asp:TextBox>

                    <%--<input type="text" class="form-control form-control-xl" placeholder="Email">--%>
                    <div class="form-control-icon">
                        <i class="bi bi-person-plus"></i>
                    </div>
                </div>
                <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="user" required CssClass="form-control form-control-xl" runat="server" placeholder="Username"></asp:TextBox>

                    <%--<input type="text" class="form-control form-control-xl" placeholder="Username">--%>
                    <div class="form-control-icon">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <div class="form-group position-relative has-icon-left mb-4">
                            <asp:TextBox ID="pass" required  CssClass="form-control form-control-xl" runat="server" placeholder="Password"></asp:TextBox>

                    <%--<input type="password" class="form-control form-control-xl" placeholder="Password">--%>
                    <div class="form-control-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                </div>
                <%--<div class="form-group position-relative has-icon-left mb-4">
                    <input type="password" class="form-control form-control-xl" placeholder="Confirm Password">
                    <div class="form-control-icon">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                </div>--%>
         <div class="form-group position-relative has-icon-left mb-4">
                            <%--<asp:TextBox ID="role" required CssClass="form-control form-control-xl" runat="server" placeholder="Role"></asp:TextBox>--%>
              <asp:DropDownList ToolTip="select2"  ID="role" required AppendDataBoundItems="true" placeholder="Role" CssClass=" form-control form-control-xl form-select form-select-lg js-example-placeholder-single" runat="server">
                                <asp:ListItem></asp:ListItem>
                             

                                 <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>User</asp:ListItem>


                                
                            </asp:DropDownList>
                    <%--<input type="text" class="form-control form-control-xl" placeholder="Username">--%>
                    <div class="form-control-icon">
                        <i class="bi bi-bag-check"></i>
                    </div>
                </div>
                             <asp:Button ID="btn" CssClass="btn btn-primary btn-block btn-lg shadow-lg mt-5" OnClick="btn_Click" runat="server" Text="Add" />

                <%--<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Sign Up</button>--%>
            </form>
            <div class="text-center mt-5 text-lg fs-4">
               <%-- <p class='text-gray-600'>Already have an account? <a href="auth-login.html" class="font-bold">Log
                        in</a>.</p>--%>
            </div>
        </div>
    </div>
    <div class="col-lg-7 d-none d-lg-block">
        <div id="auth-right">

        </div>
    </div>
</div>

    </div>
    <%--</form>--%>
</body>
</html>
