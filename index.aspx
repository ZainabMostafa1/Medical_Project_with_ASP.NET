<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <%drDBEntities db = new drDBEntities();
         string n = "";
         if (Session["role"] != null)
             {
         //    if (Session["role"].ToString() == "Teacher" || Session["role"].ToString() == "StageManager"|| Session["role"].ToString()=="Maneger" || Session["role"].ToString()=="CEO" )
         //    {
         if (Session["user_id"] != null)
         {
             if (Session["name"] != null)
             {
                 n = Session["name"].ToString();
             }
             else
             {
                 Response.Redirect("/login.aspx");
             }
         }
         else { Response.Redirect("/login.aspx"); }
         } else { Response.Redirect("/login.aspx"); }                %>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.aspx">
                                <img src="assets/images/logo/logo2.png" style="width:70%; height:70%" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>
                        <li class="sidebar-item active ">
                            <a href="index.aspx" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
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
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h3>Home</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12 col-lg-9">
                        <div class="row">
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon purple">
                                                    <i class="iconly-boldShow"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <%
                                                    drDBEntities db1 = new drDBEntities();
                                                    var xx = (from it in db1.add_patient_tb
                                                             where  it.del == false
                                                             select new { it }).Count();

                                                    var xx2 = (from it in db1.user
                                                             where  it.del == false
                                                             select new { it }).Count();
                                                     %>
                                                <h6 class="text-muted font-semibold" >Patients number</h6>
                                                <h6 class="font-extrabold mb-0 " ><%=xx %></h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon blue">
                                                    <i class="iconly-boldProfile"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Doctors number</h6>
                                                <h6 class="font-extrabold mb-0"><%=xx2 %></h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <%--<div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon green">
                                                    <i class="iconly-boldAdd-User"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Following</h6>
                                                <h6 class="font-extrabold mb-0">80.000</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="col-6 col-lg-3 col-md-6">
                                <%--<div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon red">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Saved Post</h6>
                                                <h6 class="font-extrabold mb-0">112</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-3">
                        <div class="card">
                            <div class="card-body py-4 px-5">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-xl">
                                        <img src="assets/images/faces/1doctoranimated.gif" alt="Face 1">
                                    </div>
                                    <div class="ms-3 name">
                                        <h5 class="font-bold">Dr. <%=n %></h5>
                                       <a href="/login.aspx?off=true"> <h6 class="text-muted mb-0">Sign.out</h6></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
                <!-- Basic card section start -->
                <section id="content-types">
                    <div class="row">

                        <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <a href="add_pt.aspx">
                                    <div class="card-content">
                                        <img class="card-img-top img-fluid" src="assets/images/samples/doctor at laptop patient monitoring.jpg" alt="Card image cap"
                                            style="height: 20rem" />
                                        <div class="card-body">
                                            <h4 class="card-title">Add Patient</h4>
                                            <p class="card-text">
                                                Add New Patient
                                            </p>
                                            <p class="card-text">
                                            </p>
                                            <%--<button  class="btn btn-primary block" >Add</button>--%>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <a href="allPatients.aspx">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <h4 class="card-title">All Patients</h4>
                                            <p class="card-text">
                                                View All Patients
                                            </p>
                                            <p class="card-text">
                                            </p>
                                            <small class="text-muted">here you can see all Patients data and edit or delete them </small>
                                        </div>
                                        <img class="card-img-bottom img-fluid" src="assets/images/samples/internal-medicine.jpg"
                                            alt="Card image cap" style="height: 20rem; object-fit: cover;">
                                    </div>
                                </a>
                            </div>
                        </div>
                          <%if (Session["user_id"] != null)
    {
        drDBEntities db2 = new drDBEntities();
        int uid = int.Parse(Session["user_id"].ToString());
        var up = db.user.FirstOrDefault(a => a.id == uid);
        if (up.type == "Admin")
        {


                        %>
                           <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <a href="add_user.aspx">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <h4 class="card-title">Add User</h4>
                                            <p class="card-text">
                                                Add new user 
                                            </p>
                                            <p class="card-text">
                                            </p>
                                            <small class="text-muted">here you can  add new user  </small>
                                        </div>
                                        <img class="card-img-bottom img-fluid" src="assets/images/samples/bg_3.jpg"
                                            alt="Card image cap" style="height: 20rem; object-fit: cover;">
                                    </div>
                                </a>
                            </div>
                        </div>
                          <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <a href="all_users.aspx">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <h4 class="card-title">All Users</h4>
                                            <p class="card-text">
                                                 View All Users
                                            </p>
                                            <p class="card-text">
                                            </p>
                                            <small class="text-muted">here you can view all users and edit or delete them </small>
                                        </div>
                                        <img class="card-img-bottom img-fluid" src="assets/images/samples/image_5.jpg"
                                            alt="Card image cap" style="height: 20rem; object-fit: cover;">
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic Card types section end -->

                <%}
    } %>

            </div>
            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved
                        </p>
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
    </div>
</asp:Content>

