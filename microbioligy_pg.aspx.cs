using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class microbioligy_pg : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {

                int x = int.Parse(Request.QueryString["p_id"].ToString());
                microbiology_tb f = db.microbiology_tb.FirstOrDefault(a => a.pt_id == x);


                if (f.bacterial == null)
                {
                    bacterial_rb.Text = "";
                }
                else
                {
                    bacterial_rb.Text = f.bacterial.ToString();
                }

                if (f.source_bacterial == null)
                {
                    source_bacterial_rb.Text = "";
                }
                else
                {
                    source_bacterial_rb.Text = f.source_bacterial.ToString();
                }
                if (f.other_source == null)
                {
                    other_source_tx.Text = "";
                }
                else
                {
                    other_source_tx.Text = f.other_source.ToString();
                }


                microorganisms_check.Items[0].Selected = Convert.ToBoolean(f.Staphoylcoccus_ck);
                microorganisms_check.Items[1].Selected = Convert.ToBoolean(f.sensitive_ck);

                microorganisms_check.Items[2].Selected = Convert.ToBoolean(f.MRSA_ck);
                microorganisms_check.Items[3].Selected = Convert.ToBoolean(f.Pseudomonas_ck);
                microorganisms_check.Items[4].Selected = Convert.ToBoolean(f.Burkholderia_ck);
                microorganisms_check.Items[5].Selected = Convert.ToBoolean(f.Stenotrophomonas_ck);
                microorganisms_check.Items[6].Selected = Convert.ToBoolean(f.Alcaligenes_ck);
                microorganisms_check.Items[7].Selected = Convert.ToBoolean(f.Aspergillus_ck);
                microorganisms_check.Items[8].Selected = Convert.ToBoolean(f.Candida_ck);
                microorganisms_check.Items[9].Selected = Convert.ToBoolean(f.other_microorganisms_culture_ck);

                if (f.other_microorganisms_name == null)
                {
                    other_micro_tx.Text = "";
                }
                else
                {
                    other_micro_tx.Text = f.other_microorganisms_name.ToString();
                }
                if (f.mycobacterial == null)
                {
                    mycobacterial_rb.Text = "";
                }
                else
                {
                    mycobacterial_rb.Text = f.mycobacterial.ToString();
                }
                if (f.source_mycrobacterial == null)
                {
                    source_mycrobacterial_rb.Text = "";
                }
                else
                {
                    source_mycrobacterial_rb.Text = f.source_mycrobacterial.ToString();
                }
                if (f.other_mycobacterial == null)
                {
                    other_mycobacterial_tx.Text = "";
                }
                else
                {
                    other_mycobacterial_tx.Text = f.other_mycobacterial.ToString();
                }
                mycobacteria_check.Items[0].Selected = Convert.ToBoolean(f.tuberculosis_ck);
                mycobacteria_check.Items[1].Selected = Convert.ToBoolean(f.abscessus_ck);
                mycobacteria_check.Items[2].Selected = Convert.ToBoolean(f.avium_ck);
                mycobacteria_check.Items[3].Selected = Convert.ToBoolean(f.other_mycobacteria_culture_ck);
                mycobacteria_check.Items[4].Selected = Convert.ToBoolean(f.none_ck);


                if (f.other_myco_culture_name == null)
                {
                    other_myco_culture_tx.Text = "";
                }
                else
                {
                    other_myco_culture_tx.Text = f.other_myco_culture_name.ToString();
                }


                if (source_bacterial_rb.SelectedItem.ToString() == "Other")
                {
                    other_source_div.Visible = true;

                }
                else
                {
                    other_source_div.Visible = false;

                }

                if (source_mycrobacterial_rb.SelectedItem.ToString() == "Other")
                {
                    other_mycobacterial_div.Visible = true;

                }
                else
                {
                    other_mycobacterial_div.Visible = false;

                }

            }
        }
    }


    protected void source_bacterial_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (source_bacterial_rb.SelectedItem.ToString() == "Other")
        {
            other_source_div.Visible = true;

        }
        else
        {
            other_source_div.Visible = false;

        }
    }

    protected void source_mycrobacterial_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (source_mycrobacterial_rb.SelectedItem.ToString() == "Other")
        {
            other_mycobacterial_div.Visible = true;

        }
        else
        {
            other_mycobacterial_div.Visible = false;

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


        microbiology_tb f11 = db.microbiology_tb.FirstOrDefault(a => a.pt_id == p);
        {
           
           
            f11.bacterial = bacterial_rb.Text;
            f11.source_bacterial = source_bacterial_rb.Text;
            f11.other_source = other_source_tx.Text;
        
            f11.Staphoylcoccus_ck = microorganisms_check.Items[0].Selected;
            f11.sensitive_ck = microorganisms_check.Items[1].Selected;
            f11.MRSA_ck = microorganisms_check.Items[2].Selected;
            f11.Pseudomonas_ck = microorganisms_check.Items[3].Selected;
            f11.Burkholderia_ck = microorganisms_check.Items[4].Selected;
            f11.Stenotrophomonas_ck = microorganisms_check.Items[5].Selected;
            f11.Alcaligenes_ck = microorganisms_check.Items[6].Selected;
            f11.Aspergillus_ck = microorganisms_check.Items[7].Selected;
            f11.Candida_ck = microorganisms_check.Items[8].Selected;
            f11.other_microorganisms_culture_ck = microorganisms_check.Items[9].Selected;

            f11.other_microorganisms_name = other_micro_tx.Text;
            f11.mycobacterial = mycobacterial_rb.Text;
            f11.source_mycrobacterial = source_mycrobacterial_rb.Text;
         
            f11.other_mycobacterial = other_mycobacterial_tx.Text;

            f11.tuberculosis_ck = mycobacteria_check.Items[0].Selected;
            f11.abscessus_ck = mycobacteria_check.Items[1].Selected;
            f11.avium_ck = mycobacteria_check.Items[2].Selected;
            f11.other_mycobacteria_culture_ck = mycobacteria_check.Items[3].Selected;
            f11.none_ck = mycobacteria_check.Items[4].Selected;
          
            f11.other_myco_culture_name = other_myco_culture_tx.Text;

            f11.user_id = user_id;

            f11.user_name = n;

            f11.del = false;
            f11.pt_code = c;
        };

        db.SaveChanges();
        //formContent.Visible = false;
        //message.Visible = true;
        // save.Text = "saved Succssesfully";
        Response.Redirect("medication_pg.aspx?p_id=" + p);




    }

}
