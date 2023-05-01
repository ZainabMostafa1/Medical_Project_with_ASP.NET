<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_4.aspx.cs" Inherits="print_4" %>

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
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="medication_pg.aspx?p_id=<%=p_id %>" title="Print">   Back</a></button>
                                                        
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-printer-fill' href="javascript:window.print()" title="Print">   Print</a></button>


                                                    </div>

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
        window.onload = resizeTextbox(document.getElementById('<%=other_tx.ClientID%>'));
    </script>
  
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    


    <script src="assets/js/main.js"></script>

     

    <script src="assets/js/main.js"></script>
</body>
</html>
