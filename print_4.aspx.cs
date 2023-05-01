using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_4 : System.Web.UI.Page
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
}