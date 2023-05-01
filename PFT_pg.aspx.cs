using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PFT_pg : System.Web.UI.Page
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
    protected void save_Click(object sender, EventArgs e)
    {
        int p = int.Parse(Request.QueryString["p_id"].ToString());

        add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == p);
        var c = f.code.ToString();


        string n = "", u = "";
        if (Session["user"] != null && Session["name"] != null)
        {
            n = Session["name"].ToString();
            u = Session["user"].ToString();

        }
        int user_id = (from s in db.user where s.user_name == u select s.id).FirstOrDefault();


        PFT_tb f11 = db.PFT_tb.FirstOrDefault(a => a.pt_id == p);
        {

            f11.PFT = pft_rb.Text;

            f11.r_Patient_refused_ck = reason_check.Items[0].Selected;
            f11.r_Availability_ofPFT_ck = reason_check.Items[1].Selected;
            f11.r_equipment_ck = reason_check.Items[2].Selected;
            f11.r_other_ck = reason_check.Items[3].Selected;

            f11.r_other_name = other_tx.Text;

            f11.FEV1 = fev1_tx.Text;
            f11.FEV1_Predicted = fev1_p_tx.Text;
            f11.FVC = FVC_tx.Text;
            f11.FVC_Predicted = FVC_p_tx.Text;
            f11.FEF25 = FEF25_tx.Text;
            f11.FEF25_Predicted = fef25_p_tx.Text;

            f11.FEV1_FVC_Ratio = ratio_tx.Text;


            f11.user_id = user_id;

            f11.user_name = n;

            f11.del = false;
            f11.pt_code = c;
        };

        db.SaveChanges();
        //formContent.Visible = false;
        //message.Visible = true;
        // save.Text = "saved Succssesfully";
        Response.Redirect("cxr_pg.aspx?p_id=" + p);




    }
}