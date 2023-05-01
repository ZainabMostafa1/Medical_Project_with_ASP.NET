<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_pt.aspx.cs" Inherits="add_pt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <div class="d-flex justify-content-between">
            <div class="logo">
                <a href="index.aspx"><img src="assets/images/logo/logo2.png" style="width:70%; height:70%" alt="Logo" srcset=""></a>
            </div>
            <div class="toggler">
                <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
            </div>
        </div>
    </div>
    <div class="sidebar-menu">
        <ul class="menu">
            <li class="sidebar-title">Menu</li>
             <li class="sidebar-item  ">
                <a href="index.aspx" class='sidebar-link'>
                    <i class="bi bi-grid-fill"></i>
                    <span>Home</span>
                </a>
            </li>
            <li class="sidebar-item active ">
                <a href="add_pt.aspx" class='sidebar-link '>
                    <i class="bi bi-stack"></i>
                    <span>Add New Patient </span>
                </a>
            </li>
            
            <li class="sidebar-item  ">
                <a href="allPatients.aspx" class='sidebar-link'>
                    <i class="bi bi-pentagon-fill"></i>
                    <span>All Patients</span>
                </a>
            </li>
            
             <%if (Session["user_id"] != null)
    {
        drDBEntities db2 = new drDBEntities();
        int uid = int.Parse(Session["user_id"].ToString());
        var up = db2.user.FirstOrDefault(a => a.id == uid);
        if (up.type == "Admin")
        {


                        %>
             <li class="sidebar-item  has-sub">
                <a href="#" class='sidebar-link'>
                    <i class="bi bi-stack"></i>
                    <span>Users</span>
                </a>
                <ul class="submenu ">
                    <li class="submenu-item ">
                        <a href="add_user.aspx">Add User</a>
                    </li>
                   <li class="submenu-item ">
                        <a href="all_users.aspx">All Users</a>
                    </li>
                </ul>
            </li>
            
          <%}
    } %>
            
        </ul>
    </div>
    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
</div>
        </div>
          
    <div id="main">
          <div class=" alert-light-danger ">
                
                <asp:ValidationSummary ValidationGroup="b" runat="server"
                    HeaderText="please check inputs :" />

            </div>
        <asp:Button runat="server" ID="close" class="btn btn-outline-primary btn-block btn-lg" Text="Seccess" Visible="false"></asp:Button>
         <asp:Panel ID="message" CssClass="col-md-6 " runat="server" Visible="false">
        <div class="alert alert-light-success color-success"><i class="bi bi-check-circle"></i> added
                            successfully</div>
             

             <a href="add_pt.aspx" class="btn btn-outline-success">Ok</a>
             </asp:Panel>
        <asp:Panel ID="formContent" runat="server">
                    
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Add New Patient</h3>
                        <p class="text-subtitle text-muted">Please enter patient infomation </p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Patient</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <section id="basic-vertical-layouts">
                <div class="row match-height">
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Add New Patient </h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form form-vertical">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="name">Name</label>
                                                        <asp:TextBox runat="server" ID="name" ClientIDMode="Static" CssClass="form-control"
                                                            placeholder="Patient name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator
                            CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator4" ControlToValidate="name" ErrorMessage="enter patient name ">
                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                              
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Code</label>
                                                        <asp:TextBox runat="server" ID="code_tx" Enabled="false" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                              <asp:RequiredFieldValidator
                            CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="code_tx" ErrorMessage="enter patient code ">
                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Date </label>
                                                        <asp:TextBox ValidationGroup="b" runat="server" TextMode="Date" ID="date_tx" CssClass="form-control "></asp:TextBox>
                                                         <asp:RequiredFieldValidator
                            CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator1" ControlToValidate="date_tx" ErrorMessage="enter date ">
                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-12 d-flex justify-content-end">
                        <asp:Button ID="save" ValidationGroup="b" CssClass="btn btn-primary me-1 mb-1" OnClick="save_Click" runat="server" Text="Save"></asp:Button>

                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     </asp:Panel>
                </div>
               
            </section>
            <!-- // Basic Vertical form layout section end -->


            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved</p>
                        <%--<p>2021 &copy; Medical</p>--%>
                    </div>
                    <div class="float-end">
                        <p>
                            Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span>by <a
                                href="https://www.linkedin.com/in/zainab-mostafa-92828011b/">Zainab Mostafa</a>
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    
</asp:Content>

