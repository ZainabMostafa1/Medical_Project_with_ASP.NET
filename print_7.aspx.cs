using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_7 : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                int x = int.Parse(Request.QueryString["p_id"].ToString());
                add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == x);


                name_tx.Text = f.name.ToString();
                code_tx.Text = f.code.ToString();


            }
        }
    }
}