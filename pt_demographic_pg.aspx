<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pt_demographic_pg.aspx.cs" Inherits="pt_demographic_pg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="app">
        <% 
            drDBEntities db = new drDBEntities();
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                int p_id = int.Parse(Request.QueryString["p_id"].ToString());

        %>
        <div id="sidebar" class="active d-print-none">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.aspx">
                                <img src="assets/images/logo/logo2.png" style="width: 70%; height: 70%" alt="Logo" srcset=""></a>
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
                            <a href="pt_demographic_pg.aspx?p_id=<%=p_id %>" class='sidebar-link '>
                                <i class="bi bi-stack"></i>
                                <span>Patient Demographics</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="visit_information.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-grid-1x2-fill"></i>
                                <span>Visit Information</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="microbioligy_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-hexagon-fill"></i>
                                <span>Microbiology</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="medication_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span>Medications &amp; Complications</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="PFT_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-pen-fill"></i>
                                <span>PFT</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="cxr_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Chest XR or CT</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="img.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-camera-fill"></i>
                                <span>file Uploader </span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
                            <a href="allPatients.aspx" class='sidebar-link'>
                                <i class="bi bi-pentagon-fill"></i>
                                <span>All Patients</span>
                            </a>
                        </li>


                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>

        <div id="main">
            <div class=" alert-light-danger ">

               <%-- <asp:validationsummary validationgroup="b" runat="server"
                    headertext="please check inputs :" />--%>

            </div>
          
            <header class="mb-3 d-print-none">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            <div class="page-heading">
                <div class="page-title">
                    <div class="row d-print-none">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Patient Demographics</h3>
                            <p class="text-subtitle text-muted">Please enter patient infomation and proceed to next step</p>
                            <div class="float-end">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_1.aspx?p_id=<%=p_id %>" title="Print"></a></button>
                            </div>
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
                    <div class="row match-height d-print-block">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Patient Demographics</h4>

                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">

                                                    <% 

                                                        var x = (from it in db.add_patient_tb
                                                                 where it.id == p_id && it.del == false
                                                                 select new { it }).ToList();
                                                    %>
                                                    <% if (x != null)
                                                        {
                                                            //  int i = 1;
                                                            foreach (var item in x)
                                                            {
                                                                // var c = item.it.code;

                                                    %>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="name">Name</label>
                                                            <asp:textbox runat="server" id="name" clientidmode="Static" cssclass="form-control"
                                                                placeholder="Patient name"></asp:textbox>
                                                            <%--<asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator4" controltovalidate="name" errormessage="enter patient name ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Birth Date</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="p_date_of_birth" cssclass="form-control"
                                                                placeholder="Patient date of birth"></asp:textbox>
                                                            <%--<asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator3" controltovalidate="p_date_of_birth" errormessage="enter date of birth ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>


                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Gender</label>
                                                            <div class="form-check">

                                                                <asp:radiobuttonlist repeatdirection="Horizontal" cssclass=" form-group container " id="p_gender" runat="server" clientidmode="Static">

                                                                    <asp:ListItem Value="male" Text="Male" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="female" Text="Female" runat="server" />

                                                                </asp:radiobuttonlist>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Sweat Chloride value at diagnosis (mmol/L)</label>
                                                            <asp:textbox runat="server" id="sweat_chloride" clientidmode="Static" cssclass="form-control"></asp:textbox>
                                                           <%-- <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator5" controltovalidate="sweat_chloride" errormessage="enter sweat chloride value ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Date Sweat Chloride test was performed</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="date_sweat_chloride" cssclass="form-control "></asp:textbox>
                                                            <%--<asp:requiredfieldvalidator
                                                                cssclass="form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator1" controltovalidate="date_sweat_chloride" errormessage="enter date of sweat chloride ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>CFTR Genotype (1 st mutation)</label>
                                                            <asp:textbox runat="server" id="CFTR_1" clientidmode="Static" cssclass="form-control"></asp:textbox>
                                                           <%-- <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator6" controltovalidate="CFTR_1" errormessage="enter CFTR Genotype (1 st mutation) ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>CFTR Genotype (2 nd mutation)</label>
                                                            <asp:textbox runat="server" id="CFTR_2" clientidmode="Static" cssclass="form-control"></asp:textbox>
                                                            <%--<asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator7" controltovalidate="CFTR_2" errormessage="enter CFTR Genotype (2 nd mutation) ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Date of CFTR Genotyping</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="Date_of_CFTR" cssclass="form-control"></asp:textbox>
                                                            <%--<asp:requiredfieldvalidator
                                                                cssclass="form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator2" controltovalidate="Date_of_CFTR" errormessage="enter date of CFTR ">
                                                            </asp:requiredfieldvalidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:button id="save"  cssclass="btn btn-primary me-1 mb-1" onclick="save_Click" runat="server" text="Save"></asp:button>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </section>
                <!-- // Basic Vertical form layout section end -->


                <footer>
                    <div class="footer clearfix mb-0 text-muted d-print-none">
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
        <%}
                }
            }
        %>
    </div>
</asp:Content>

