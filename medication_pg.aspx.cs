using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class medication_pg : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {

                int x = int.Parse(Request.QueryString["p_id"].ToString());
                medication_tb f = db.medication_tb.FirstOrDefault(a => a.pt_id == x);


              

                pulmonry_check.Items[0].Selected = Convert.ToBoolean(f.p_none_ck);
                pulmonry_check.Items[1].Selected = Convert.ToBoolean(f.p_Dornasealfa_ck);
                pulmonry_check.Items[2].Selected = Convert.ToBoolean(f.p_Acetylcystein_ck);
                pulmonry_check.Items[3].Selected = Convert.ToBoolean(f.p_Ibuprofen_ck);
                pulmonry_check.Items[4].Selected = Convert.ToBoolean(f.p_salineLeukotriene_ck);
                pulmonry_check.Items[5].Selected = Convert.ToBoolean(f.p_modifier_ck);
                pulmonry_check.Items[6].Selected = Convert.ToBoolean(f.p_Mastcell_ck);
                pulmonry_check.Items[7].Selected = Convert.ToBoolean(f.p_stabilizer_ck);
                pulmonry_check.Items[8].Selected = Convert.ToBoolean(f.p_Antifungal_ck);
                pulmonry_check.Items[9].Selected = Convert.ToBoolean(f.p_Steroid_oral_ck);
                pulmonry_check.Items[10].Selected = Convert.ToBoolean(f.p_Steroid_inhaled_ck);
                pulmonry_check.Items[11].Selected = Convert.ToBoolean(f.p_Steroid_Bronchodilator_ck);
                pulmonry_check.Items[12].Selected = Convert.ToBoolean(f.p_inhaled_Shortacting_ck);
                pulmonry_check.Items[13].Selected = Convert.ToBoolean(f.p_Longacting_anticholinergic_ck);
                pulmonry_check.Items[14].Selected = Convert.ToBoolean(f.p_Betaagonist_ck);
                pulmonry_check.Items[15].Selected = Convert.ToBoolean(f.p_short_ck);
                pulmonry_check.Items[16].Selected = Convert.ToBoolean(f.p_others_ck);


                if (f.p_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f.p_other_name.ToString();

                    //other_tx.TextMode = TextBoxMode.MultiLine;
                    //other_tx.Rows = 10;

                    //other_tx.Style.Height = 0;
                    //other_tx.Style.height = other_tx.scrollHeight + "px";
                }
                if (f.Saline_concentration == null)
                {
                    Saline_rb.Text = "";
                }
                else
                {
                    Saline_rb.Text = f.Saline_concentration.ToString();
                }
                non_p_check.Items[0].Selected = Convert.ToBoolean(f.non_p_Pancreat_ck);
                non_p_check.Items[1].Selected = Convert.ToBoolean(f.non_p_Proton_ck);
                non_p_check.Items[2].Selected = Convert.ToBoolean(f.non_p_CF_ck);
                non_p_check.Items[3].Selected = Convert.ToBoolean(f.non_p_vitamin_ck);
                non_p_check.Items[4].Selected = Convert.ToBoolean(f.non_p_Supplemental_ck);

                complications_check.Items[0].Selected = Convert.ToBoolean(f.c_none_ck);
                complications_check.Items[1].Selected = Convert.ToBoolean(f.c_CFRD_ck);
                complications_check.Items[2].Selected = Convert.ToBoolean(f.c_Liver_ck);
                complications_check.Items[3].Selected = Convert.ToBoolean(f.c_gall_ck);
                complications_check.Items[4].Selected = Convert.ToBoolean(f.c_ABPA_ck);
                complications_check.Items[5].Selected = Convert.ToBoolean(f.c_Asthma_ck);
                complications_check.Items[6].Selected = Convert.ToBoolean(f.c_DIOS_ck);
                complications_check.Items[7].Selected = Convert.ToBoolean(f.c_GERD_ck);
                complications_check.Items[8].Selected = Convert.ToBoolean(f.c_Nasa_ck);



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


        medication_tb f11 = db.medication_tb.FirstOrDefault(a => a.pt_id == p);
        {


             f11.p_none_ck = pulmonry_check.Items[0].Selected;
            f11.p_Dornasealfa_ck = pulmonry_check.Items[1].Selected;
            f11.p_Acetylcystein_ck = pulmonry_check.Items[2].Selected;
            f11.p_Ibuprofen_ck = pulmonry_check.Items[3].Selected;
            f11.p_salineLeukotriene_ck = pulmonry_check.Items[4].Selected;
            f11.p_modifier_ck = pulmonry_check.Items[5].Selected;
            f11.p_Mastcell_ck = pulmonry_check.Items[6].Selected;
            f11.p_stabilizer_ck = pulmonry_check.Items[7].Selected;
            f11.p_Antifungal_ck = pulmonry_check.Items[8].Selected;
            f11.p_Steroid_oral_ck = pulmonry_check.Items[9].Selected;
            f11.p_Steroid_inhaled_ck = pulmonry_check.Items[10].Selected;
            f11.p_Steroid_Bronchodilator_ck = pulmonry_check.Items[11].Selected;
            f11.p_inhaled_Shortacting_ck = pulmonry_check.Items[12].Selected;
            f11.p_Longacting_anticholinergic_ck = pulmonry_check.Items[13].Selected;
            f11.p_Betaagonist_ck = pulmonry_check.Items[14].Selected;
            f11.p_short_ck = pulmonry_check.Items[15].Selected;
            f11.p_others_ck = pulmonry_check.Items[16].Selected;
          
            f11.p_other_name = other_tx.Text;
            f11.Saline_concentration = Saline_rb.Text;
           
            f11.non_p_Pancreat_ck = non_p_check.Items[0].Selected;
            f11.non_p_Proton_ck = non_p_check.Items[1].Selected;
            f11.non_p_CF_ck = non_p_check.Items[2].Selected;
            f11.non_p_vitamin_ck = non_p_check.Items[3].Selected;
            f11.non_p_Supplemental_ck = non_p_check.Items[4].Selected;

            f11.c_none_ck = complications_check.Items[0].Selected;
            f11.c_CFRD_ck = complications_check.Items[1].Selected;
            f11.c_Liver_ck = complications_check.Items[2].Selected;
            f11.c_gall_ck = complications_check.Items[3].Selected;
            f11.c_ABPA_ck = complications_check.Items[4].Selected;
            f11.c_Asthma_ck = complications_check.Items[5].Selected;
            f11.c_DIOS_ck = complications_check.Items[6].Selected;
            f11.c_GERD_ck = complications_check.Items[7].Selected;
            f11.c_Nasa_ck = complications_check.Items[8].Selected;

            f11.user_id = user_id;

            f11.user_name = n;

            f11.del = false;
            f11.pt_code = c;
        };

        db.SaveChanges();
        //formContent.Visible = false;
        //message.Visible = true;
        // save.Text = "saved Succssesfully";
        Response.Redirect("PFT_pg.aspx?p_id=" + p);




    }
}