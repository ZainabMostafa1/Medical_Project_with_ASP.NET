using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cxr_pg : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {

                int x = int.Parse(Request.QueryString["p_id"].ToString());
                cxr_tb f = db.cxr_tb.FirstOrDefault(a => a.pt_id == x);





                if (f.CXR == null)
                {
                    cxr_rb.Text = "";
                }
                else
                {
                    cxr_rb.Text = f.CXR.ToString();
                }
                reason_check.Items[0].Selected = Convert.ToBoolean(f.r_Patientsick_ck);
                reason_check.Items[1].Selected = Convert.ToBoolean(f.r_Followup_routine_ck);
                reason_check.Items[2].Selected = Convert.ToBoolean(f.r_Followup_after_exacerbation_ck);
                reason_check.Items[3].Selected = Convert.ToBoolean(f.r_other_ck);


                if (f.r_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f.r_other_name.ToString();
                }

                if (f.CXR_Findings == null)
                {
                    CXR_Findings_tx.Text = "";
                }
                else
                {
                    CXR_Findings_tx.Text = f.CXR_Findings.ToString();
                }

                if (f.CT_Findings == null)
                {
                    CT_Findings_tx.Text = "";
                }
                else
                {
                    CT_Findings_tx.Text = f.CT_Findings.ToString();
                }

                if (f.Bronchiectasis == null)
                {
                    Bronchiectasis_tx.Text = "";
                }
                else
                {
                    Bronchiectasis_tx.Text = f.Bronchiectasis.ToString();
                }

                if (f.Bronchial_Wall_Thickening == null)
                {
                    BronchialWallThickening_tx.Text = "";
                }
                else
                {
                    BronchialWallThickening_tx.Text = f.Bronchial_Wall_Thickening.ToString();
                }

                if (f.Atelectasis == null)
                {
                    Atelectasis_tx.Text = "";
                }
                else
                {
                    Atelectasis_tx.Text = f.Atelectasis.ToString();
                }

                if (f.Mucous_Plugging == null)
                {
                    MucousPlugging_tx.Text = "";
                }
                else
                {
                    MucousPlugging_tx.Text = f.Mucous_Plugging.ToString();
                }

                if (f.Air_Trapping == null)
                {
                    AirTrapping_tx.Text = "";
                }
                else
                {
                    AirTrapping_tx.Text = f.Air_Trapping.ToString();
                }

                if (f.Opacity == null)
                {
                    Opacity_tx.Text = "";
                }
                else
                {
                    Opacity_tx.Text = f.Opacity.ToString();
                }

                if (f.Ground_Glass_Appearance == null)
                {
                    GroundGlassAppearance_tx.Text = "";
                }
                else
                {
                    GroundGlassAppearance_tx.Text = f.Ground_Glass_Appearance.ToString();
                }

                if (f.Other_Findings == null)
                {
                    OtherFindings_tx.Text = "";
                }
                else
                {
                    OtherFindings_tx.Text = f.Other_Findings.ToString();
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


        cxr_tb f11 = db.cxr_tb.FirstOrDefault(a => a.pt_id == p);
        {

            f11.CXR = cxr_rb.Text;

            f11.r_Patientsick_ck = reason_check.Items[0].Selected;
            f11.r_Followup_routine_ck = reason_check.Items[1].Selected;
            f11.r_Followup_after_exacerbation_ck = reason_check.Items[2].Selected;
            f11.r_other_ck = reason_check.Items[3].Selected;

            f11.r_other_name = other_tx.Text;

            f11.CXR_Findings = CXR_Findings_tx.Text;
            f11.CT_Findings = CT_Findings_tx.Text;
            f11.Bronchiectasis = Bronchiectasis_tx.Text;
            f11.Bronchial_Wall_Thickening = BronchialWallThickening_tx.Text;
            f11.Atelectasis = Atelectasis_tx.Text;
            f11.Mucous_Plugging = MucousPlugging_tx.Text;

            f11.Air_Trapping = AirTrapping_tx.Text;
            f11.Opacity = Opacity_tx.Text;
            f11.Ground_Glass_Appearance = GroundGlassAppearance_tx.Text;
            f11.Other_Findings = OtherFindings_tx.Text;


            f11.user_id = user_id;

            f11.user_name = n;

            f11.del = false;
            f11.pt_code = c;
        };

        db.SaveChanges();
        //formContent.Visible = false;
        //message.Visible = true;
         save.Text = "saved Succssesfully";
        Response.Redirect("img.aspx?p_id=" + p);




    }
}