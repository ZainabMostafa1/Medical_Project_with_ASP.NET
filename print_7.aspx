<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_7.aspx.cs" Inherits="print_7" %>

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
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-arrow-left' href="img.aspx?p_id=<%=p_id %>" title="Print">   Back</a></button>
                                                        
						<button class="btn btn-outline-primary me-1 mb-1"><a class= 'bi bi-printer-fill' href="javascript:window.print()" title="Print">   Print</a></button>


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

    
    
      <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
 
    <script src="assets/js/main.js"></script>
</body>
</html>
