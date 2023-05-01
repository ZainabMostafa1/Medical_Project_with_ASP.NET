<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_2.aspx.cs" Inherits="print_2" %>

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
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="visit_information.aspx?p_id=<%=p_id %>" title="Print">   Back</a></button>
                                                        
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-printer-fill' href="javascript:window.print()" title="Print">   Print</a></button>


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
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator4" ControlToValidate="age" ErrorMessage="enter patient age ">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Patient's current medications</label>
                                                            <asp:TextBox style="OVERFLOW:auto" onkeypress="this.style.height = 0; this.style.height = this.scrollHeight + 'px';" runat="server" ID="medication_tx" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator
                                                                CssClass=" form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="medication_tx" ErrorMessage="enter Patient's current medications ">
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
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator1" ControlToValidate="p_height" ErrorMessage="enter patient height ">
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
                                                                CssClass="form-control-color alert-danger text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator8" ControlToValidate="p_weight" ErrorMessage="enter patient weight ">
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