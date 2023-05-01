<%@ Page Language="C#" AutoEventWireup="true" CodeFile="all_users.aspx.cs" Inherits="all_users" %>


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

    <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

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
       
            <div id="sidebar" class="active">
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
                                <a href="add_pt.aspx" class='sidebar-link '>
                                    <i class="bi bi-stack"></i>
                                    <span>Add New Patient </span>
                                </a>
                            </li>

                            <li class="sidebar-item  active">
                                <a href="allPatients.aspx" class='sidebar-link'>
                                    <i class="bi bi-pentagon-fill"></i>
                                    <span>All Patients</span>
                                </a>
                            </li>

                                       <li class="sidebar-item  has-sub">
                <a href="#" class='sidebar-link'>
                    <i class="bi bi-stack"></i>
                    <span>Users</span>
                </a>
                <ul class="submenu ">
                    <li class="submenu-item ">
                        <a href="add_user.aspx">Add User</a>
                    </li>
                   <li class="submenu-item ">
                        <a href="all_users.aspx">All Users</a>
                    </li>
                </ul>
            </li>




                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>All Users</h3>
                                <p class="text-subtitle text-muted">Here you can find and search for all saved Users </p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">All Users</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <div class="card">
                            <div class="card-header">
                                 
                            </div>
                            <div class="card-body">
                                
                                 <div class="input-group input-group-sm " style="width: 150px; ">
                    <br />
                  <input type="text" name="table_search" id="search" class="form-control  float-end"  onkeyup="myFunction1()" placeholder="search..">

                    <br />
                  
                </div>
                                <table class="table table-hover" id="table1">
                                    <thead>
                                        <tr>
                                            <th>#</th>

                                            <th>Name</th>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>Role</th>
                                            
                                            <th>edit</th>

                                            <th>delete</th>
                                        </tr>

                                    </thead>
                                     <% 
                                         drDBEntities db = new drDBEntities();
                                         //        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["imp"])))
                                         //{
                                         //    int y = int.Parse(Request.QueryString["imp"].ToString());

                                         //    form1 s = db.form1.FirstOrDefault(a => a.id == y);



                                         var x1 = (from ss in db.user where   ss.del == false select ss).OrderByDescending(a => a.id).ToList();

                %>


                <% if (x1 != null)
    {
        int i = 1;
        foreach (var item1 in x1)
        {

           // DateTime dtt = Convert.ToDateTime(item1.date);

                %>
                                    <tbody>
                                        <tr>
                                            <td><%=i %></td>
                                            <td><%=item1.name %></td>
                                            <td><%=item1.user_name %></td>
                                           
                                            <td><%=item1.pass %></td>

                                            <td>
                                                <span class="badge bg-success"><%=item1.type %></span>
                                            </td>
                                           
                                             
                                              <td><a href="add_user.aspx?edit=<%=item1.id %>">  <i class="bi bi-pencil-square"></i></a></td>

                   <td><a  href='all_users.aspx?del=<%=item1.id %>'>  <i class="bi bi-trash2-fill"></i></a></td>

                                        </tr>
                                         <%i++;

            }

        }
    
                %>
                                 
                                    </tbody>
                                     
                                </table>
                            </div>
                        </div>
                        
                    </section>
                   
                </div>
                
               
                <footer>
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
     </form>
    <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("table1");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
   <%-- <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>--%>

    <script src="assets/js/main.js"></script>
</body>
</html>
