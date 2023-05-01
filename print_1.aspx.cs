using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_1 : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {

                int x = int.Parse(Request.QueryString["p_id"].ToString());

                //add_patient_tb f1 = db.add_patient_tb.FirstOrDefault(a => a.id == x);



                //name.Text = f1.name.ToString();
                patient_demographics f = db.patient_demographics.FirstOrDefault(a => a.pt_id == x);
                //date_sweat_chloride.TextMode = TextBoxMode.SingleLine;
                //Date_of_CFTR.TextMode = TextBoxMode.SingleLine;
                //p_date_of_birth.TextMode = TextBoxMode.SingleLine;

                if (f.date_of_birth == null)
                {
                    p_date_of_birth.Text = "";
                }
                else
                {
                    p_date_of_birth.Text = DateTime.Parse(f.date_of_birth.ToString()).ToString("yyyy/MM/dd");
                    p_date_of_birth.TextMode = TextBoxMode.SingleLine;


                }




                // p_date_of_birth.Text = f.date_of_birth.ToString();
                if (f.date_sweat_chloride == null)
                {
                    date_sweat_chloride.Text = "";
                }
                else
                {
                    date_sweat_chloride.Text = DateTime.Parse(f.date_sweat_chloride.ToString()).ToString("yyyy/MM/dd");
                    date_sweat_chloride.TextMode = TextBoxMode.SingleLine;

                }
                //date_sweat_chloride.Text = f.date_sweat_chloride.ToString();
                if (f.date_of_cftr == null)
                {
                    Date_of_CFTR.Text = "";
                }
                else
                {
                    Date_of_CFTR.Text = DateTime.Parse(f.date_of_cftr.ToString()).ToString("yyyy/MM/dd");
                    Date_of_CFTR.TextMode = TextBoxMode.SingleLine;

                }
                // Date_of_CFTR.Text = f.date_of_cftr.ToString();

                //name.Text = f.name.ToString();
                if (f.name == null)
                {
                    name.Text = "";
                }
                else
                {
                    name.Text = f.name.ToString();
                }
                // p_gender.Text = f.gender.ToString();
                if (f.gender == null)
                {
                    p_gender.Text = "";
                }
                else
                {
                    p_gender.Text = f.gender.ToString();
                }
                // sweat_chloride.Text = f.sweat_chloride.ToString();
                if (f.sweat_chloride == null)
                {
                    sweat_chloride.Text = "";
                }
                else
                {
                    sweat_chloride.Text = f.sweat_chloride.ToString();
                }
                // CFTR_1.Text = f.cftr_genotype_1.ToString();
                if (f.cftr_genotype_1 == null)
                {
                    CFTR_1.Text = "";
                }
                else
                {
                    CFTR_1.Text = f.cftr_genotype_1.ToString();
                }
                // CFTR_2.Text = f.cftr_genotype_2.ToString();
                if (f.cftr_genotype_2 == null)
                {
                    CFTR_2.Text = "";
                }
                else
                {
                    CFTR_2.Text = f.cftr_genotype_2.ToString();
                }
                // save.Text = "edit";

            }
        }
    }
}  