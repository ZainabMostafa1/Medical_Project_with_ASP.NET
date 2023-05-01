using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    static drDBEntities db1 = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                TextBox1.Text = Request.Cookies["UserName"].Value;
                TextBox2.Attributes["value"] = Request.Cookies["Password"].Value;
            }

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["off"])))
            {
                Session["user"] = null;
                Session["UserName"] = null;
                Session["Password"] = null;

                Response.Redirect("login.aspx");
            }



        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //DateTime today = DateTime.Now;
        //DateTime day30 = new DateTime(30, 5, 2018);
        //if (today <= day30)
        //{
        if (TextBox1.Text == "")
        {
            MsgBox("Enter user name !", this.Page, this);
        }
        else if (TextBox2.Text == "")
        {
            MsgBox("Enter Password", this.Page, this);
        }

        else
        {
            if (db1.user.Any(a => a.user_name == TextBox1.Text)/*|| ecco.pr.Any(a => a.user_name == TextBox1.Text)*/)
            {
                var f = (from ss in db1.user where ss.user_name == TextBox1.Text select ss.pass).FirstOrDefault();
                //  var ff = (from ss in ecco.pr where ss.user_name == TextBox1.Text select ss.password).FirstOrDefault();
                string x, xx;
                if (f == null)
                {
                    x = "";
                }
                else
                {
                    x = f.ToString();
                }

                //if (ff == null)
                //{
                //    xx = "";
                //}
                //else
                //{
                //    xx = ff.ToString();
                //}
                drDBEntities db = new drDBEntities();


                if (x == TextBox2.Text/* || xx == TextBox2.Text*/)
                {
                    Session["user"] = TextBox1.Text;
                    user u = db1.user.FirstOrDefault(r => r.user_name == TextBox1.Text);
                    Session["role"] = u.type;
                    Session["user_id"] = u.id;
                    Session["name"] = u.name;

                    if (u.type == null)
                    {
                        Response.Redirect("login.aspx");


                    }
                    
                    if (u.del == false)
                    {
                        Response.Redirect("index.aspx");

                    }
                    else  if (u.del == true) { MsgBox("This user had been deleted !", this.Page, this); }
                


               
                }
                else { MsgBox("Password is not correct !", this.Page, this); }

            }
            else { MsgBox("User name is not correct !", this.Page, this); }

            //    if (CheckBox1.Checked)
            //    {
            //        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
            //        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            //    }
            //    else
            //    {
            //        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
            //        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            //    }
            //    Response.Cookies["UserName"].Value = TextBox1.Text.Trim();
            //    Response.Cookies["Password"].Value = TextBox2.Text.Trim();
            //}
            //    else
            //    {
            //    MsgBox("licence expired", this.Page, this);
            //}

        }

    }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}