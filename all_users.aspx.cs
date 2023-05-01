using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class all_users : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
        {
            int x = int.Parse(Request.QueryString["del"].ToString());
            var f = db.user.Where(a => a.id == x && a.del != true).ToList();

            foreach (var item in f)
            {
                user pro = db.user.FirstOrDefault(a => a.id == item.id);

                db.SaveChanges();

                item.del = true;
                db.SaveChanges();

            }

            db.SaveChanges();
            Response.Redirect("all_users.aspx");

        }
    }
}