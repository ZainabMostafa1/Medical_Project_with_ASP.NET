<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="microbioligy_pg.aspx.cs" Inherits="microbioligy_pg" %>

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
                        <li class="sidebar-item  active">
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
            <div class=" alert-light-danger d-print-none ">

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
                            <h3>Microbiology</h3>
                            <p class="text-subtitle text-muted">Please enter patient infomation and proceed to next step</p>
                      <div class="float-end d-print-none">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_3.aspx?p_id=<%=p_id %>" title="Print"></a></button>
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
                                    <h4 class="card-title">Microbiology</h4>
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
</asp:Content>

