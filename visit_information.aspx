<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="visit_information.aspx.cs" Inherits="visit_information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="app">
        <% 
            drDBEntities db = new drDBEntities();
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                int p_id = int.Parse(Request.QueryString["p_id"].ToString());

        %>
        <div id="auth">
         <div id="statusPopup" style="display: none; z-index: 1000; left: 49%; top: 49%;">
        <div>              
            <img src="../assets/images/bg/rings.gif" alt="Loading......" />
        </div>
    </div>
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
                        <li class="sidebar-item active ">
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


                        <%--<li class="sidebar-item  has-sub">
                <a href="#" class='sidebar-link'>
                    <i class="bi bi-stack"></i>
                    <span>Components</span>
                </a>
                <ul class="submenu ">
                    <li class="submenu-item ">
                        <a href="component-alert.html">Alert</a>
                    </li>
                   
                </ul>
            </li>--%>
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main">
            <div class=" alert-light-danger ">

                <%--<asp:ValidationSummary ValidationGroup="b" runat="server"
                    HeaderText="please check inputs :" />--%>

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
                            <h3>Visit Information</h3>
                            <p class="text-subtitle text-muted">Please enter patient infomation and proceed to next step</p>
                       <div class="float-end d-print-none">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_2.aspx?p_id=<%=p_id %>" title="Print"></a></button>
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
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Visit Information</h4>

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
                                                            <label>Date of Visit</label>
                                                            <asp:TextBox ValidationGroup="b" OnTextChanged="date_of_visit_TextChanged" AutoPostBack="true" runat="server" TextMode="Date" ID="date_of_visit" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator3" ControlToValidate="date_of_visit" ErrorMessage="enter date of visit ">
                                                            </asp:RequiredFieldValidator>
                                                        </div>


                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="name">Patient's age (in years at most recent birthday) </label>
                                                            <asp:TextBox runat="server" ID="age" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-danger" ID="RegularExpressionValidator12"
                                                                ControlToValidate="age" runat="server"
                                                                ErrorMessage="enter age in numbers"
                                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                                            </asp:RegularExpressionValidator>
                                                            <%--<asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator4" ControlToValidate="age" ErrorMessage="enter patient age ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Patient's current medications</label>
                                                            <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" runat="server" ID="medication_tx" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="medication_tx" ErrorMessage="enter Patient's current medications ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Patient's Height (cm)</label>
                                                            <asp:TextBox ValidationGroup="b" runat="server" ID="p_height" CssClass="form-control "></asp:TextBox>
                                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-danger" ID="RegularExpressionValidator1"
                                                                ControlToValidate="p_height" runat="server"
                                                                ErrorMessage="enter height in cm"
                                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                                            </asp:RegularExpressionValidator>
                                                            <%--<asp:RequiredFieldValidator
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator1" ControlToValidate="p_height" ErrorMessage="enter patient height ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Patient's Weight (kg)</label>
                                                            <asp:TextBox ValidationGroup="b" runat="server" ID="p_weight" CssClass="form-control "></asp:TextBox>
                                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-danger" ID="RegularExpressionValidator2"
                                                                ControlToValidate="p_weight" runat="server"
                                                                ErrorMessage="enter weight in kg"
                                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                                            </asp:RegularExpressionValidator>
                                                            <%--<asp:RequiredFieldValidator
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator8" ControlToValidate="p_weight" ErrorMessage="enter patient weight ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group ">
                                                            <label>Has the patient experienced a pulmonary exacerbation since the last visit ?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="pulmonary_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="  Yes" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="no" Text="  No" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Has the patient increased airway clearance, exercise, and/or bronchodilators due to increased symptoms of pulmonary exacerbation?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="airway_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="  Yes" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="no" Text="  No" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Has the patient started or increased oral antibiotics in response to increased pulmonary symptoms?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="oral_rb_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass=" form-group container " ID="oral_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" Selected="True" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 form-group" runat="server" id="div_oral" visible="false">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>How long (in days) was the patient treated with oral antibiotics for increased pulmonary symptoms?</label>
                                                                    <asp:TextBox runat="server" ID="days_oral" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                        CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator6" ControlToValidate="days_oral" ErrorMessage="enter days of oral treatment ">
                                                                    </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Date :</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" ID="date_oral" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                        CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator9" ControlToValidate="date_oral" ErrorMessage="enter date of oral treatment ">
                                                                    </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Has the patient started or increased inhaled antibiotics in response to increased pulmonary symptoms?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="inhaled_rb_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass=" form-group container " ID="inhaled_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" Selected="True" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12" runat="server" id="div_inhaled" visible="false">
                                                        <div class="form-group">
                                                            <label>How long (in days) was the patient treated with inhaled antibiotics for increased pulmonary symptoms?</label>
                                                            <asp:TextBox runat="server" ID="days_inhaled_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator2" ControlToValidate="days_inhaled_tx" ErrorMessage="enter days of inhaled treatment ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Has the patient started intravenous antibiotics in response to increased pulmonary symptoms?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="intravenous_rb_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass=" form-group container " ID="intravenous_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" Selected="True" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12" runat="server" id="div_intravenous" visible="false">
                                                        <div class="form-group">
                                                            <label>How long (in days) was the patient treated with intravenous antibiotics for increased pulmonary symptoms?</label>
                                                            <asp:TextBox runat="server" ID="days_intravenous_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                            <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator7" ControlToValidate="days_intravenous_tx" ErrorMessage="enter days of intravenous treatment ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>


                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Was the patient hospitalized in the prior three months, or since the last study visit?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="hospitalized_rb_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass=" form-group container " ID="hospitalized_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" Selected="True" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 form-group" runat="server" id="div_hospitals" visible="false">
                                                        <div class="form-control">
                                                            <div class="col-12" >
                                                                <div class="form-group">
                                                                    <label>Date of Hospitalization :</label>
                                                                    <asp:TextBox runat="server" TextMode="Date" ID="date_hospital_tx" CssClass="form-control"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator
                                                                        CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator11" ControlToValidate="date_hospital_tx" ErrorMessage="enter date of hospitalization ">
                                                                    </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>


                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>What was the primary reason for the hospitalization</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="reason_hospital_rb_SelectedIndexChanged" RepeatDirection="Vertical" CssClass=" form-group container " ID="reason_hospital_rb" runat="server" ClientIDMode="Static">


                                                                            <asp:ListItem Value="Pulmonary exacerbation" Text="Pulmonary exacerbation" runat="server" Selected="True" />
                                                                            <asp:ListItem Value="Pulmonary complication" Text="Pulmonary complication" runat="server" />
                                                                            <asp:ListItem Value="Gastrointestinal" Text="Gastrointestinal" runat="server" />
                                                                            <asp:ListItem Value="Sinus" Text="Sinus" runat="server" />
                                                                            <asp:ListItem Value="Other" Text="Other" runat="server" />

                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12" id="other_hospital_div" runat="server" visible="false">
                                                                <div class="form-group">
                                                                    <label >other:</label>
                                                                    <asp:TextBox textmode="multiline" style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" ID="other_hospital_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>

                                                            <div class="col-12 ">
                                                                <div class="form-group">
                                                                    <label>How long (in days) was the patient hospitalized?</label>
                                                                    <asp:TextBox runat="server" ID="days_hospital_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Did the patient receive home intravenous (IV) therapy in the prior three months, or since the last visit?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="iv_tx_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass=" form-group container " ID="iv_tx" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server"  />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" Selected="True"/>

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 form-group" runat="server" id="div_iv_g" visible="false">
                                                        <div class="form-control">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>What was the primary reason for administering a home IV?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="reason_iv_rb_SelectedIndexChanged" RepeatDirection="Vertical" CssClass=" form-group container " ID="reason_iv_rb" runat="server" ClientIDMode="Static">


                                                                    <asp:ListItem Value="Pulmonary exacerbation" Text="  Pulmonary exacerbation" runat="server" Selected="True" />
                                                                    <asp:ListItem Value="Pulmonary complication" Text="  Pulmonary complication" runat="server" />
                                                                    <asp:ListItem Value="Gastrointestinal" Text="  Gastrointestinal" runat="server" />
                                                                    <asp:ListItem Value="Sinus" Text="  Sinus" runat="server" />
                                                                    <asp:ListItem Value="Other" Text="Other" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="col-12" id="other_iv_div" runat="server" visible="false">
                                                        <div class="form-group">
                                                            <label>Other:</label>
                                                            <asp:TextBox  textmode="multiline" style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" ID="other_iv_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                           <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator10" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>How long (in days) did the patient receive home IV therapy?</label>
                                                            <asp:TextBox runat="server" ID="days_iv_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                           <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator12" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                            </div>
                                                        </div>
                                                    <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="save"  OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


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

            </div>
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
        <%}
                }
            }
        %>
    </div>
      <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=medication_tx.ClientID%>'));
    </script>
     <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_hospital_tx.ClientID%>'));
    </script>
     <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_iv_tx.ClientID%>'));
    </script>
</asp:Content>

