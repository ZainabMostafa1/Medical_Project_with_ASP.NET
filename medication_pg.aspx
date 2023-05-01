<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="medication_pg.aspx.cs" Inherits="medication_pg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <li class="sidebar-item active ">
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
                            <h3>Medications &amp; Complications</h3>
                            <p class="text-subtitle text-muted">Please enter patient infomation and proceed to next step</p>
                                    <div class="float-end d-print-none">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_4.aspx?p_id=<%=p_id %>" title="Print"></a></button>
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
                                    <h4 class="card-title">Medications &amp; Complications</h4>
                              
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
                                                           
                                                    
                                                    <div class="col-12 d-flex justify-content-end d-print-none">
                                                        <asp:Button ID="save" ValidationGroup="b" OnClick="save_Click" CssClass="btn btn-primary me-1 mb-1" runat="server" Text="Save"></asp:Button>


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
    </div>
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
  
</asp:Content>

