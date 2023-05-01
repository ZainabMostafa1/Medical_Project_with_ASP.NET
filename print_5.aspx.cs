using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_5 : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {

                int x = int.Parse(Request.QueryString["p_id"].ToString());
                PFT_tb f = db.PFT_tb.FirstOrDefault(a => a.pt_id == x);





                if (f.PFT == null)
                {
                    pft_rb.Text = "";
                }
                else
                {
                    pft_rb.Text = f.PFT.ToString();
                }
                reason_check.Items[0].Selected = Convert.ToBoolean(f.r_Patient_refused_ck);
                reason_check.Items[1].Selected = Convert.ToBoolean(f.r_Availability_ofPFT_ck);
                reason_check.Items[2].Selected = Convert.ToBoolean(f.r_equipment_ck);
                reason_check.Items[3].Selected = Convert.ToBoolean(f.r_other_ck);


                if (f.r_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f.r_other_name.ToString();
                }

                if (f.FEV1 == null)
                {
                    fev1_tx.Text = "";
                }
                else
                {
                    fev1_tx.Text = f.FEV1.ToString();
                }

                if (f.FEV1_Predicted == null)
                {
                    fev1_p_tx.Text = "";
                }
                else
                {
                    fev1_p_tx.Text = f.FEV1_Predicted.ToString();
                }

                if (f.FVC == null)
                {
                    FVC_tx.Text = "";
                }
                else
                {
                    FVC_tx.Text = f.FVC.ToString();
                }

                if (f.FVC_Predicted == null)
                {
                    FVC_p_tx.Text = "";
                }
                else
                {
                    FVC_p_tx.Text = f.FVC_Predicted.ToString();
                }

                if (f.FEF25 == null)
                {
                    FEF25_tx.Text = "";
                }
                else
                {
                    FEF25_tx.Text = f.FEF25.ToString();
                }

                if (f.FEF25_Predicted == null)
                {
                    fef25_p_tx.Text = "";
                }
                else
                {
                    fef25_p_tx.Text = f.FEF25_Predicted.ToString();
                }

                if (f.FEV1_FVC_Ratio == null)
                {
                    ratio_tx.Text = "";
                }
                else
                {
                    ratio_tx.Text = f.FEV1_FVC_Ratio.ToString();
                }



            }
        }
    }
}