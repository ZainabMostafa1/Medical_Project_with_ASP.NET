<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_all.aspx.cs" Inherits="print_all" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>medical</title>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
       

     <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
<link rel="stylesheet" href="assets/vendors/sweetalert2/sweetalert2.min.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
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
    <form id="form1" runat="server">
    <div id="app">
        <% 
            drDBEntities db = new drDBEntities();
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                int p_id = int.Parse(Request.QueryString["p_id"].ToString());

        %>
      

        <div  class="row col-12 ">
         
            <%--<div class="page-heading">--%>
                
                                                        <div class="col-12 d-flex justify-content-center d-print-none">
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="allPatients.aspx" title="Print">   Back</a></button>
                                                        
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-printer-fill' href="javascript:window.print()" title="Print">   Print</a></button>


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

                                                 
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="name">Name</label>
                                                            <asp:textbox runat="server" id="name" clientidmode="Static" cssclass="form-control"
                                                                placeholder="Patient name"></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator4" controltovalidate="name" errormessage="enter patient name ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Birth Date</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="p_date_of_birth" cssclass="form-control"
                                                                placeholder="Patient date of birth"></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator3" controltovalidate="p_date_of_birth" errormessage="enter date of birth ">
                                                            </asp:requiredfieldvalidator>
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
                                                            <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator5" controltovalidate="sweat_chloride" errormessage="enter sweat chloride value ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Date Sweat Chloride test was performed</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="date_sweat_chloride" cssclass="form-control "></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass="form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator1" controltovalidate="date_sweat_chloride" errormessage="enter date of sweat chloride ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>CFTR Genotype (1 st mutation)</label>
                                                            <asp:textbox runat="server" id="CFTR_1" clientidmode="Static" cssclass="form-control"></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator6" controltovalidate="CFTR_1" errormessage="enter CFTR Genotype (1 st mutation) ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>CFTR Genotype (2 nd mutation)</label>
                                                            <asp:textbox runat="server" id="CFTR_2" clientidmode="Static" cssclass="form-control"></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator7" controltovalidate="CFTR_2" errormessage="enter CFTR Genotype (2 nd mutation) ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Date of CFTR Genotyping</label>
                                                            <asp:textbox validationgroup="b" runat="server" textmode="Date" id="Date_of_CFTR" cssclass="form-control"></asp:textbox>
                                                            <asp:requiredfieldvalidator
                                                                cssclass="form-control-color alert-danger text-bold list-group-item-text" runat="server" validationgroup='b' id="RequiredFieldValidator2" controltovalidate="Date_of_CFTR" errormessage="enter date of CFTR ">
                                                            </asp:requiredfieldvalidator>
                                                        </div>
                                                    </div>
                                                   <%-- <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:button id="save" validationgroup="b" cssclass="btn btn-primary me-1 mb-1" onclick="save_Click" runat="server" text="Save"></asp:button>


                                                    </div>--%>
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


                            <!-- Basic Vertical form layout section start -->
                <section id="basic-vertical-layouts">
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <br /><br /><br />
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Visit Information</h4>

                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">
                                              
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Date of Visit</label>
                                                            <asp:TextBox ValidationGroup="b" OnTextChanged="date_of_visit_TextChanged" AutoPostBack="true" runat="server" TextMode="Date" ID="date_of_visit" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator8" ControlToValidate="date_of_visit" ErrorMessage="enter date of visit ">
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
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator9" ControlToValidate="age" ErrorMessage="enter patient age ">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Patient's current medications</label>
                                                            <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" runat="server" ID="medication_tx" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator10" ControlToValidate="medication_tx" ErrorMessage="enter Patient's current medications ">
                                                            </asp:RequiredFieldValidator>
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
                                                            <asp:RequiredFieldValidator
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator11" ControlToValidate="p_height" ErrorMessage="enter patient height ">
                                                            </asp:RequiredFieldValidator>
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
                                                            <asp:RequiredFieldValidator
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator12" ControlToValidate="p_weight" ErrorMessage="enter patient weight ">
                                                            </asp:RequiredFieldValidator>
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
                                                 <%--   <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="Button1" ValidationGroup="b" OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


                                                    </div>--%>
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

              <!-- Basic Vertical form layout section start -->
                <section id="basic-vertical-layouts">
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Microbiology</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">
                                                 

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Was a bacterial culture performed in the six months prior to study enrollment (visit 1)?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="bacterial_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>What was the source of the culture material?</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="source_bacterial_rb_SelectedIndexChanged" RepeatDirection="Vertical" CssClass=" form-group container " ID="source_bacterial_rb" runat="server" ClientIDMode="Static">

                                                                            <asp:ListItem Value="Throut" Text="Throut" runat="server" Selected="True"/>
                                                                            <asp:ListItem Value="Swab" Text="Swab" runat="server" />
                                                                            <asp:ListItem Value="Sputum" Text="Sputum" runat="server" />
                                                                            <asp:ListItem Value="Other" Text="Other" runat="server" />

                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-12" id="other_source_div" runat="server" visible="false">
                                                                <div class="form-group">
                                                                    <label>other:</label>
                                                                    <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" textmode="multiline" runat="server" ID="other_source_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Which of the following microorganisms grew in the culture? (check all that apply)</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="aa" ID="microorganisms_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                            <asp:ListItem>Staphoylcoccus aureus - MSSA </asp:ListItem>
                                                                            <asp:ListItem>(sensitive) Staphylooccus aureus</asp:ListItem>
                                                                            <asp:ListItem>MRSA (resistant) Haemophilus sp.</asp:ListItem>
                                                                            <asp:ListItem>Pseudomonas aeruginosa (any type)</asp:ListItem>
                                                                            <asp:ListItem>Burkholderia sp.</asp:ListItem>
                                                                            <asp:ListItem>Stenotrophomonas (Xanthomonas) sp</asp:ListItem>
                                                                            <asp:ListItem>Alcaligenes (Achromobacter) xylosoxidans</asp:ListItem>
                                                                            <asp:ListItem>Aspergillus sp.</asp:ListItem>
                                                                            <asp:ListItem>Candida sp.</asp:ListItem>
                                                                            <asp:ListItem>Other</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12" id="other_micro_div" runat="server">
                                                                <div class="form-group">
                                                                    <label>other:</label>
                                                                    <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" textmode="multiline" runat="server" ID="other_micro_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Was a mycobacterial culture performed in the six months prior to study enrollment (visit 1 )?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="mycobacterial_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="yes" Text="Yes" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="no" Text="No" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>What was the source of the culture material?</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="source_mycrobacterial_rb_SelectedIndexChanged" RepeatDirection="Vertical" CssClass=" form-group container " ID="source_mycrobacterial_rb" runat="server" ClientIDMode="Static">

                                                                            <asp:ListItem Value="Sputum" Text="Sputum" runat="server" Selected="True"/>
                                                                            <asp:ListItem Value="Bronchia" Text="Bronchia" runat="server" />
                                                                            <asp:ListItem Value="lavage/aspirate/biopsy" Text="lavage/aspirate/biopsy" runat="server" />
                                                                            <asp:ListItem Value="Other" Text="Other" runat="server" />

                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-12" id="other_mycobacterial_div" runat="server" visible="false">
                                                                <div class="form-group">
                                                                    <label>other:</label>
                                                                    <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" textmode="multiline" runat="server" ID="other_mycobacterial_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Which of the following mycobacteria species grew in the culture? (check all that apply)</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="mycobacteria_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                            <asp:ListItem>tuberculosis</asp:ListItem>
                                                                            <asp:ListItem>abscessus/chelonae</asp:ListItem>
                                                                            <asp:ListItem>avium complex</asp:ListItem>
                                                                            <asp:ListItem>Other</asp:ListItem>
                                                                            <asp:ListItem>None</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12" id="other_myco_culture_div" runat="server">
                                                                <div class="form-group">
                                                                    <label>other:</label>
                                                                    <asp:TextBox  style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" textmode="multiline" runat="server" ID="other_myco_culture_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<div class="col-12 d-flex justify-content-end">
                                                        <asp:Button ID="save"  OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


                                                    </div>--%>
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


              <!-- Basic Vertical form layout section start -->
                <section id="basic-vertical-layouts">
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Medications &amp; Complications</h4>
                              
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">
                                                 
                                                 

                                                   
                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Please select all of the pulmonary medications that the patient is taking</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="pulmonry_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                            <asp:ListItem>None</asp:ListItem>
                                                                            <asp:ListItem>Dornase alfa (Pulmozyme)</asp:ListItem>
                                                                            <asp:ListItem>Acetylcysteine or Mucomyst High-dose</asp:ListItem>
                                                                            <asp:ListItem>Ibuprofen Hypertonic</asp:ListItem>
                                                                            <asp:ListItem>saline Leukotriene</asp:ListItem>
                                                                            <asp:ListItem>modifier</asp:ListItem>
                                                                            <asp:ListItem>Mast cell</asp:ListItem>
                                                                            <asp:ListItem>stabilizer</asp:ListItem>
                                                                            <asp:ListItem>Antifungal</asp:ListItem>
                                                                            <asp:ListItem>Steroid (oral)</asp:ListItem>
                                                                            <asp:ListItem>Steroid (inhaled)</asp:ListItem>
                                                                            <asp:ListItem>Steroid /Bronchodilator combination</asp:ListItem>
                                                                            <asp:ListItem>(inhaled) Short acting anticholinergic</asp:ListItem>
                                                                            <asp:ListItem>Long acting anticholinergic</asp:ListItem>
                                                                            <asp:ListItem>Beta agonist/anticholinergic combinatio</asp:ListItem>
                                                                            <asp:ListItem>Short acting Betaagonist</asp:ListItem>
                                                                            <asp:ListItem>Others (please List)</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            
                                                            </div>
                                                           <div class="col-12">
                                                               
                                                                <div class="form-group" contenteditable="true">
                                                                   
                                                                    <label>Others:</label>
                                                                    <asp:textbox style="OVERFLOW:auto"   onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" runat="server" textmode="MultiLine" id="other_tx" clientidmode="Static" cssclass=" form-control d-print-block"></asp:textbox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Saline concentration (%)</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Vertical" CssClass=" form-group container " ID="Saline_rb" runat="server" ClientIDMode="Static">

                                                                    <asp:ListItem Value="3" Text="3" runat="server" Selected="True" />

                                                                    <asp:ListItem Value="4" Text="4" runat="server" />
                                                                    <asp:ListItem Value="5" Text="5" runat="server" />
                                                                    <asp:ListItem Value="6" Text="6" runat="server" />
                                                                    <asp:ListItem Value="7" Text="7" runat="server" />
                                                                    <asp:ListItem Value="8" Text="8" runat="server" />
                                                                    <asp:ListItem Value="9" Text="9" runat="server" />
                                                                    <asp:ListItem Value="10" Text="10" runat="server" />

                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                    </div>

                                                  
                                                   
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Please select all of the non-pulmonary medications that the subject is taking</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="non_p_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                                                            <asp:ListItem>Pancreatic enzyme supplementation H2 blocker</asp:ListItem>
                                                                            <asp:ListItem>Proton pump inhibitor</asp:ListItem>
                                                                            <asp:ListItem>CF-specific multi-</asp:ListItem>
                                                                            <asp:ListItem>vitamin URSO</asp:ListItem>
                                                                            <asp:ListItem>Supplemental feedings</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                      <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Please select all complications present since last visit or ever</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="complications_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                                                            <asp:ListItem>None</asp:ListItem>
                                                                            <asp:ListItem>CFRD</asp:ListItem>
                                                                            <asp:ListItem>Liver disease</asp:ListItem>
                                                                            <asp:ListItem>Gall bladder disease</asp:ListItem>
                                                                            <asp:ListItem>ABPA</asp:ListItem>
                                                                            <asp:ListItem>Asthma</asp:ListItem>
                                                                            <asp:ListItem>DIOS</asp:ListItem>
                                                                            <asp:ListItem>GERD</asp:ListItem>
                                                                            <asp:ListItem>Nasal polyps requiring surgery</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                           
                                                    
                                                  <%--  <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="save" ValidationGroup="b" OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


                                                    </div>--%>
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
             <!-- Basic Vertical form layout section start -->
                <section id="basic-vertical-layouts">
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">PFT</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="form form-vertical">
                                            <div class="form-body">
                                                <div class="row">
                                               
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Was a PFT performed at this visit?</label>
                                                            <div class="form-check form-control">

                                                                <asp:RadioButtonList RepeatDirection="Horizontal" CssClass=" form-group container " ID="pft_rb" runat="server" ClientIDMode="Static">

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
                                                                    <label>Reason(s) a PFT was not performed at this visit</label>
                                                                    <div class="form-check form-control">

                                                                        <asp:CheckBoxList CssClass="form-check" ID="reason_check" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                                                            <asp:ListItem>Patient refused</asp:ListItem>
                                                                            <asp:ListItem>Availability of PFT</asp:ListItem>
                                                                            <asp:ListItem>equipment/personnel Patient health</asp:ListItem>
                                                                            <asp:ListItem>Other</asp:ListItem>

                                                                        </asp:CheckBoxList>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Other:</label>
                                                                    <asp:TextBox  style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" TextMode="MultiLine" ID="TextBox1" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>Pulmonary Function Data FEV1 (L/s)</label>
                                                                    <asp:TextBox runat="server"  ID="fev1_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                             <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FEV1 % Predicted (%)</label>
                                                                    <asp:TextBox runat="server" ID="fev1_p_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FVC (L)</label>
                                                                    <asp:TextBox runat="server"  ID="FVC_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                             <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FVC % Predicted (%)</label>
                                                                    <asp:TextBox runat="server"  ID="FVC_p_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 form-group">
                                                        <div class="form-control">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FEF 25-75 (L/s)</label>
                                                                    <asp:TextBox runat="server"  ID="FEF25_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                             <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FEF 25-75 % Predicted (%)</label>
                                                                    <asp:TextBox runat="server"  ID="fef25_p_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                     <div class="col-12">
                                                                <div class="form-group">
                                                                    <label>FEV1/FVC Ratio</label>
                                                                    <asp:TextBox runat="server" ID="ratio_tx" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator13" ControlToValidate="days_hospital_tx" ErrorMessage="enter days of hospitalization ">
                                                            </asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                  <%--  <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="save" ValidationGroup="b" OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


                                                    </div>--%>
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

                                                                        <asp:CheckBoxList CssClass="form-check" ID="CheckBoxList1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
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
                                                                    <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';"  runat="server" TextMode="MultiLine" ID="TextBox2" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
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
                            <!-- // Basic Vertical form layout section end -->

              <section id="basic-vertical-layouts">
                <div class="row match-height">
                       <br />
                            <br />
                            <br />
                            <br />
                            <br />
                    <div class="col-md-6 col-6">
                        <div class="card">
                         
                            <div class="card-header">
                                <h4 class="card-title">Images & Files</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form form-vertical">
                                        <div class="form-body">
                                            <div class="row">
                                                 <% drDBEntities db1 = new drDBEntities();



                    var x = (from a in db.upload_tb where a.del==false && a.p_id == p_id && a.img_tb != null
                             select a).OrderByDescending(a => a.id).ToList();


                    if (x != null)
                    {
                        int i1 = 1;
                        foreach (var item in x)
                        {




                %>
                                                <div class="col-12">
                                                    <div class="card">
                                                         <div class="card-body">
                                                             
                            <img src="/assets/images/upload/<%=item.img_tb %>" alt="image" style="width:auto" class="img-thumbnail"/>

                           
                        </div>
                                                    </div>
                                                </div>
                                                 <%
                            i1++;
                        }
                    }
                %>
                                              
                                                </div>
                                                
                                          
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="col-md-6 col-6">
                        <div class="card">
                           <%-- <div class="card-header">
                                <h4 class="card-title">Add New Patient </h4>
                            </div>--%>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form form-vertical">
                                        <div class="form-body">
                                            <div class="row">
                                                 <% 



                    var x3 = (from a in db.upload_tb where a.del==false && a.p_id == p_id && a.file_tb != null
                             select a).OrderByDescending(a => a.id).ToList();


                    if (x3 != null)
                    {
                        int i3 = 1;
                        foreach (var item in x3)
                        {




                %>
                                                <div class="col-12">
                                                    <div class="card">
                                                         <div class="card-body">
 
                                                           
                                                            <%--<a href="/assets/images/upload/<%=item.file_tb %>"><%  Response.Redirect("/assets/images/upload/item.file_tb");%></a>--%>
                                                             <a href="/assets/images/upload/<%=item.file_tb %>"><% Response.Write(item.file_tb); %></a>
                           
                           <%-- <div class="card-footer n">
                                <a href='/img.aspx?view=<%=item.id %>&&p_id=<%=p_id %>'><i class="bi bi-book-fill"></i></a>
                              
                                <a href='/img.aspx?edit2=<%=item.id %>&&p_id=<%=p_id %>'><i class="bi bi-link"></i></a>

                                <a href='img.aspx?del=<%=item.id %>&&p_id=<%=p_id %>'><i class="bi bi-trash-fill"></i></a>
                                
                            </div>--%>
                        </div>
                                                    </div>
                                                </div>
                                                 <%
                            i3++;
                        }
                    }
                %>
                                              
                                                </div>
                                                
                                          
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
             
               
        </section> 

                        </div>
        </div>
        <%}
                
            
        %>
    </div>
    </form>

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
     <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_source_tx.ClientID%>'));
    </script>
    <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_micro_tx.ClientID%>'));
    </script>
    <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_mycobacterial_tx.ClientID%>'));
    </script>
    <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=other_myco_culture_tx.ClientID%>'));
    </script>
     <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 120) {
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
        window.onload = resizeTextbox(document.getElementById('<%=TextBox1.ClientID%>'));
    </script>
     <script type="text/javascript" language="javascript">
        function resizeTextbox(tb) {
            if (tb == null)
                return;

            if (tb.scrollHeight > 60) {
                tb.style.height = tb.scrollHeight + "px";
            }
        };
        window.onload = resizeTextbox(document.getElementById('<%=TextBox2.ClientID%>'));
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
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    
<%--<script src="assets/vendors/toastify/toastify.js"></script>
<script src="assets/js/extensions/toastify.js"></script>--%>

    <script src="assets/js/main.js"></script>

      <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    
<script src="assets/js/extensions/sweetalert2.js"></script>
<script src="assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>

    <script src="assets/js/main.js"></script>
</body>
</html>