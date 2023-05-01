<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cxr_pg.aspx.cs" Inherits="cxr_pg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%--<link rel="stylesheet" href="assets/vendors/sweetalert2/sweetalert2.min.css">--%>
     <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
<link rel="stylesheet" href="assets/vendors/sweetalert2/sweetalert2.min.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
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
                        <li class="sidebar-item  ">
                            <a href="index.aspx" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="sidebar-item  ">
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
                        <li class="sidebar-item active ">
                            <a href="cxr_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Chest XR or CT</span>
                            </a>
                        </li>
                         <li class="sidebar-item  ">
                            <a href="img.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-camera-fill"></i>
                                <span>File Uploader </span>
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

                <asp:ValidationSummary ValidationGroup="b" runat="server"
                    HeaderText="please check inputs :" />

            </div>
           
            <header class="mb-3 d-print-none">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            <div class="page-heading">
                <div class="page-title d-print-none">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Chest XR or CT</h3>
                            <p class="text-subtitle text-muted">Please enter patient infomation and click save button</p>
                             <div class="float-end">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_6.aspx?p_id=<%=p_id %>" title="Print"></a></button>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first d-print-none">
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
                <section id="basic-vertical-layouts ">
                    <div class="row match-height d-print-block">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Chest XR or CT</h4>
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




                                                    <%--<div class="card-body">
                        <div class="row">
                            <div class="col-md-4 col-12">
                                <button id="success" class="btn btn-outline-success btn-lg btn-block">Success</button>
                            </div>
                            </div>
                                                        </div>--%>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Was a CXR or CT scan performed at this visit?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="cxr_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="Yes" Text="Yes" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="No" Text="No" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Reason(s) a CXR or CT scan was performed at this visit</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="reason_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                                                            <asp:ListItem>Patient sick</asp:ListItem>
                                                                            <asp:ListItem>Follow up routine</asp:ListItem>
                                                                            <asp:ListItem>Follow up after exacerbation</asp:ListItem>
                                                                            <asp:ListItem>Other</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Other:</label>
                                                                    <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" TextMode="MultiLine" ID="other_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>CXR Findings</label>
                                                            <asp:TextBox  style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" ID="CXR_Findings_tx" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                            <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>


                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>CT Findings</label>
                                                                    <asp:TextBox  style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" ID="CT_Findings_tx" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Bronchiectasis</label>
                                                                    <asp:TextBox runat="server" ID="Bronchiectasis_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>



                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Bronchial Wall Thickening</label>
                                                                    <asp:TextBox runat="server" ID="BronchialWallThickening_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Atelectasis</label>
                                                                    <asp:TextBox runat="server" ID="Atelectasis_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                                <br />
                                                            </div>


                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Mucous Plugging</label>
                                                                    <asp:TextBox runat="server" ID="MucousPlugging_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Air Trapping</label>
                                                                    <asp:TextBox runat="server" ID="AirTrapping_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Opacity</label>
                                                                    <asp:TextBox runat="server" ID="Opacity_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Ground Glass Appearance</label>
                                                                    <asp:TextBox runat="server" ID="GroundGlassAppearance_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Other Findings</label>
                                                                    <asp:TextBox  style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" ID="OtherFindings_tx" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="save"  OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>
<%--<button id="success" class="btn btn-outline-success btn-lg btn-block">Success</button>--%>

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


                <footer class="d-print-none">
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
        <%}
                }
            }
        %>
        <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_tx.ClientID%>'));
    </script>
         <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=CXR_Findings_tx.ClientID%>'));
    </script>
         <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=CT_Findings_tx.ClientID%>'));
    </script>
         <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=OtherFindings_tx.ClientID%>'));
    </script>
   <%--     <script>
            document.getElementById('success').addEventListener('click', (e) => {
                Swal.fire({
                    icon: "success",
                    title: "Success"
                })
            })
            
        </script>--%>
       <%-- <script>

        </script>
        <script src="assets/js/extensions/sweetalert2.js"></script>
<script src="assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>--%>
    </div>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    
<script src="assets/js/extensions/sweetalert2.js"></script>
<script src="assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>

    <script src="assets/js/main.js"></script>
</asp:Content>

