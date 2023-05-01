using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_user : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());

                user f = db.user.FirstOrDefault(a => a.id == x);
                name.Text = f.name.ToString();

                user.Text = f.user_name.ToString();
                pass.Text = f.pass.ToString();
                role.Text = f.type.ToString();

                btn.Text = "edit";


            }

            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["impid"])))
            {
                int x = int.Parse(Request.QueryString["impid"].ToString());

                var ff = db.user.Where(a => a.id == x && a.del != true).FirstOrDefault();


                ff.del = true;
                db.SaveChanges();


                Response.Redirect("add_user.aspx");
            }
        }
    }
    protected void reload_Click(object sender, EventArgs e)
    {
        Response.Redirect("adduser.aspx");


    }
    protected void btn_Click(object sender, EventArgs e)
    {



        if (btn.Text != "edit")
        {
            if (db.user.Any(a => a.user_name == user.Text))
            {
                MsgBox("This user is already created choose another user name", this.Page, this);

            }
            else
            {
                

                user u = new user
                {
                   
                    name = name.Text,
                    user_name = user.Text,
                    pass = pass.Text,
                    type = role.Text,
                    del = false
                };
                db.user.Add(u);
                db.SaveChanges();
                //formContent.Visible = false;
                // message.Visible = true;
                Response.Redirect("all_users.aspx");

            }
        }
        else
        {

            int x = int.Parse(Request.QueryString["edit"].ToString());
            user f = db.user.FirstOrDefault(a => a.id == x);




            f.name = name.Text;
            f.user_name = user.Text;
            f.pass = pass.Text;
            f.type = role.Text;


            db.SaveChanges();
            Response.Redirect("all_users.aspx");

        }


        //formContent.Visible = false;
        // message.Visible = true;

        // MsgBox("Added successfully", this.Page, this);
    }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}