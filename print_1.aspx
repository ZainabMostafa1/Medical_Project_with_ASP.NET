<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_1.aspx.cs" Inherits="print_1" %>

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
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="pt_demographic_pg.aspx?p_id=<%=p_id %>" title="Print">   Back</a></button>
                                                        
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

              </div>
        </div>
        <%}
                
            
        %>
    </div>
    </form>

    
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
