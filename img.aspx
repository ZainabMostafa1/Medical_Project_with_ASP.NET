<%@ Page Language="C#" AutoEventWireup="true" CodeFile="img.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="img" %>
<!DOCTYPE html>
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>medical</title>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
<link rel="stylesheet" href="assets/vendors/toastify/toastify.css">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
 <%--   <link rel="stylesheet" href="assets/vendors/sweetalert2/sweetalert2.min.css">--%>
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    <%--  <script src="assets/js/extensions/sweetalert2.js"></script>
<script src="assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>--%>

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
                        <li class="sidebar-item  ">
                            <a href="cxr_pg.aspx?p_id=<%=p_id %>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Chest XR or CT</span>
                            </a>
                        </li>
                         <li class="sidebar-item active ">
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
            <header class="mb-3 d-print-none">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <!-- Success Alert -->
<div runat="server" visible="false" id="success" class="alert alert-success alert-dismissible d-flex align-items-center fade show">
    <i class="bi-check-circle-fill"></i>
    <strong class="mx-2">Success!</strong> Saved successfully.
    <asp:Button runat="server" id="close" type="button" class="btn-close" onclick="close_Click" ></asp:Button>
</div>

            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>File Uploader</h3>
                <p class="text-subtitle text-muted d-print-none">Here you can Upload patient files or images.</p>
                 <div class="float-end d-print-none">

                                <button class=" btn  btn-light-primary me-1 mb-1"><a class='bi bi-printer' href="print_7.aspx?p_id=<%=p_id %>" title="Print"></a></button>
                            </div>
                <%--<div class="col-md-4 col-12">
                                <button id="success" class="btn btn-outline-success btn-lg btn-block">Success</button>
                            </div>--%>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first d-print-none ">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">File Uploader</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
      <section id="basic-vertical-layouts">
                <div class="row match-height">
                    <div class="col-md-12 col-12">
                        <div class="card">
                           <%-- <div class="card-header">
                                <h4 class="card-title">Add New Patient </h4>
                            </div>--%>
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="form form-vertical">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label for="name">Name</label>
                                                        <asp:TextBox runat="server" ID="name_tx" ClientIDMode="Static" CssClass="form-control"
                                                           Enabled="false"></asp:TextBox>
                                                        
                                                    </div>
                                                </div>
                                              <div class="col-6">
                                                    <div class="form-group">
                                                        <label>Code</label>
                                                        <asp:TextBox runat="server"  ID="code_tx" ClientIDMode="Static" CssClass=" form-control" Enabled="false"></asp:TextBox>
                                                             
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


    <section class="section d-print-none">
        <div class="row">
            
           <%-- <div class="col-12 col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">ImgBB Uploader</h5>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <p class="card-text">Using the basic file uploader up, upload here to see how
                                <code>.imgbb-filepond</code>-based basic file uploader look. You must use
                                <code>name=image</code> or by FormData fieldName for your 
                                input <code>type=file</code> to upload in imgBB.
                            </p>
                            <!-- imgBB file uploader -->
                            <input type="file" name="image" class="imgbb-filepond">
                        </div>
                    </div>
                </div>
            </div>--%>
       
         
            <div class="col-12 col-md-6 d-print-none">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Upload Image </h5>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <p class="card-text"> Upload <code>Images</code>  of Medical tests and x-rays for this Patient 
                            </p>
                            <!-- File uploader with image preview -->
                            <%--<input type="file"  class="image-preview-filepond" multiple>--%>
                            <asp:FileUpload ID="FileUpload1" class="form-control " accept=".png,.jpg,.jpeg,.gif"  AllowMultiple="true" runat="server" onchange ="CheckExt(this)" />
                           
                            <div class="col-12 d-flex justify-content-end align-content-center align-self-center">
            <asp:Button CssClass="btn btn-primary me-1 mb-1" OnClick="save_Click" ID="save" runat="server" Text="Save" />
          </div>
                        </div>

                    </div>
                </div>
            </div>
           <div class="col-6 col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Multiple Files</h5>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <p class="card-text">Upload <code>Files</code> of Medical tests and x-rays for this Patient  </p>
                            <!-- File uploader with multiple files upload -->
                            <%--<input type="file" class="multiple-files-filepond" multiple>--%>
                            <asp:FileUpload onchange="validateSize(this)" ID="FileUpload2" AllowMultiple="true"   class="form-control"  runat="server" />
                          
                             <div class="col-12 d-flex justify-content-end align-content-center align-self-center">
            <asp:Button CssClass="btn btn-primary me-1 mb-1" OnClick="save2_Click" ID="save2" runat="server" Text="Save" />
          </div>
                        </div>
                    </div>
                </div>
            </div>
                 
          
        </div>
        
    </section>
      <section id="basic-vertical-layouts">
                <div class="row match-height">
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
                                                             
                            <img src="/assets/images/upload/<%=item.img_tb %>" alt="image" style="width:auto" class="d-print-flex img-thumbnail"/>

                            <div  class="card-footer d-print-none">
                                <a class="d-print-none" href='/view_pg.aspx?view2=<%=item.id %>&&p_id=<%=p_id %>' title="view"><i class="bi bi-book-fill"></i></a>
                              
                                <a href='/img.aspx?edit=<%=item.id %>&&p_id=<%=p_id %>' title="edit"><i class="bi bi-link d-print-none"></i></a>

                                <a href='img.aspx?del=<%=item.id %>&&p_id=<%=p_id %>' title="delete"><i class="bi bi-trash-fill d-print-none"></i></a>
                                
                            </div>
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
                           
                            <div class="card-footer">
                      <%--          <asp:LinkButton  ID="lnkView" runat="server" Text="View PDF" OnClick="View"></asp:LinkButton>
<hr />
<asp:Literal ID="ltEmbed" runat="server" />--%>
       <%--                         <iframe style="border-style: none;"
 src="http://docs.google.com/viewer?url=/assets/images/upload/<%=item.file_tb %> &embedded=true" height="390" 
 width="400">
</iframe>--%>
                                <%--<a href="http://docs.google.com/viewer?url=/assets/images/upload/<%=item.file_tb %>"  ><i class="bi bi-book-fill"></i></a>--%>
                              <%--<asp:Button ID="bttnpdf" runat="server" Text="Click for open PDF" Font-Bold="True" OnClick="bttnpdf_Click" />--%>
                               
                                <a class="d-print-none" href='/view_pg.aspx?view=<%=item.id %>&&p_id=<%=p_id %>' title="view"><i class="bi bi-book-fill"></i></a>
                                
                                 <a class="d-print-none" href='/img.aspx?edit2=<%=item.id %>&&p_id=<%=p_id %>' title="edit"><i class="bi bi-link"></i></a>

                                <a class="d-print-none" href='img.aspx?del=<%=item.id %>&&p_id=<%=p_id %>' title="delete"><i class="bi bi-trash-fill"></i></a>
                                
                            </div>
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

              <footer class="d-print-none">
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved</p>
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
                
            
        %>
</form>

        <script type="text/javascript">
            function validateSize(input) {
                const fileSize = input.files[0].size / 1024 / 1024; // in MiB
                if (fileSize > 1024) {
                    alert('File size exceeds 1 Giga Byte , this is not allowed');
                    // $(file).val(''); //for clearing with Jquery
                    document.getElementById("save2").disabled = true; // disable the button
                       
                    
                } else {
                    // Proceed further
                    document.getElementById("save2").disabled = false; // enable the button

                }
            }
    </script>
  
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>

<!-- image editor -->
<script src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-filter/dist/filepond-plugin-image-filter.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>

<!-- toastify -->
<script src="assets/vendors/toastify/toastify.js"></script>
     <script type ="text/javascript">
    var validFiles=["bmp","gif","png","jpg","jpeg"];
        function CheckExt(obj)
        {
          var source=obj.value;
          var ext=source.substring(source.lastIndexOf(".")+1,source.length).toLowerCase();
          for (var i=0; i<validFiles.length; i++)
          {
            if (validFiles[i]==ext)
                break;
          }
          if (i>=validFiles.length)
          {
            alert("THAT IS NOT A VALID IMAGE\nPlease load an image with an extention of one of the following:\n\n"+validFiles.join(", "));
          }
         }
    </script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>

    <script src="assets/js/main.js"></script>
 <%--   <script>
         p = int.Parse(Request.QueryString["p_id"].ToString());

        $('#success').on('closed.bs.alert', function () {
            window.location.href("img.aspx?p_id=" + p);
        })
    </script>--%>
<%--    <script>
        document.getElementById('success').addEventListener('click', (e) => {
            Swal.fire({
                icon: "success",
                title: "Success"
            })
    </script>--%>
</body>

</html>


