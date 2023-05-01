using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class allPatients : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
        {
            int x = int.Parse(Request.QueryString["del"].ToString());
            var f = db.add_patient_tb.Where(a => a.id == x && a.del != true).ToList();

            foreach (var item in f)
            {
                add_patient_tb pro = db.add_patient_tb.FirstOrDefault(a => a.id == item.id);

                db.SaveChanges();

                item.del = true;
                db.SaveChanges();

            }

            db.SaveChanges();
            Response.Redirect("allPatients.aspx");

        }

    }
}