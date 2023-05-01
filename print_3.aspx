<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_3.aspx.cs" Inherits="print_3" %>

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
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="microbioligy_pg.aspx?p_id=<%=p_id %>" title="Print">   Back</a></button>
                                                        
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-printer-fill' href="javascript:window.print()" title="Print">   Print</a></button>


                                                    </div>

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
                                                <%--    <div class="col-12 d-flex justify-content-end d-print-none">
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
   
     <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    
<%--<script src="assets/vendors/toastify/toastify.js"></script>
<script src="assets/js/extensions/toastify.js"></script>--%>

    <script src="assets/js/main.js"></script>

      <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    


    <script src="assets/js/main.js"></script>
</body>
</html>