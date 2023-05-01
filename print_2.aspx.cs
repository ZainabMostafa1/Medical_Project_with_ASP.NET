using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_2 : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                //date_hospital_tx.TextMode = TextBoxMode.SingleLine;
                //date_of_visit.TextMode = TextBoxMode.SingleLine;
                //date_oral.TextMode = TextBoxMode.SingleLine;

                int x = int.Parse(Request.QueryString["p_id"].ToString());
                visit_information_tb f = db.visit_information_tb.FirstOrDefault(a => a.pt_id == x);






                if (f.date_of_visit == null)
                {
                    date_of_visit.Text = "";
                }
                else
                {

                    date_of_visit.Text = DateTime.Parse(f.date_of_visit.ToString()).ToString("yyyy/MM/dd");
                    date_of_visit.TextMode = TextBoxMode.SingleLine;

                }





                // date_of_visit.Text = f.date_of_visit.ToString();

                // age.Text = f.age.ToString();
                if (f.age != null)
                {
                    age.Text = f.age.ToString();

                }

                // medication_tx.Text = f.medecation.ToString();
                if (f.medecation == null)
                {
                    medication_tx.Text = "";
                }
                else
                {
                    medication_tx.Text = f.medecation.ToString();
                }
                // p_height.Text = f.height.ToString();
                if (f.height == null)
                {
                    p_height.Text = "";
                }
                else
                {
                    p_height.Text = f.height.ToString();
                }
                // p_weight.Text = f.weight.ToString();
                if (f.weight == null)
                {
                    p_weight.Text = "";
                }
                else
                {
                    p_weight.Text = f.weight.ToString();
                }
                // pulmonary_rb.Text = f.pulmonary.ToString();
                if (f.pulmonary == null)
                {
                    pulmonary_rb.Text = "";
                }
                else
                {
                    pulmonary_rb.Text = f.pulmonary.ToString();
                }
                // airway_rb.Text = f.airway.ToString();
                if (f.airway == null)
                {
                    airway_rb.Text = "";
                }
                else
                {
                    airway_rb.Text = f.airway.ToString();
                }
                // oral_rb.Text = f.oral.ToString();
                if (f.oral == null)
                {
                    oral_rb.Text = "";
                }
                else
                {
                    oral_rb.Text = f.oral.ToString();
                }
                // days_oral.Text = f.days_treated_oral.ToString();
                if (f.days_treated_oral == null)
                {
                    days_oral.Text = "";
                }
                else
                {
                    days_oral.Text = f.days_treated_oral.ToString();
                }
                // date_oral.Text = f.date_treated_oral.ToString();
                if (f.date_treated_oral == null)
                {
                    date_oral.Text = "";
                }
                else
                {
                    date_oral.Text = DateTime.Parse(f.date_treated_oral.ToString()).ToString("yyyy/MM/dd");
                    date_oral.TextMode = TextBoxMode.SingleLine;


                }
                // inhaled_rb.Text = f.inhaled.ToString();
                if (f.inhaled == null)
                {
                    inhaled_rb.Text = "";
                }
                else
                {
                    inhaled_rb.Text = f.inhaled.ToString();
                }
                // days_inhaled_tx.Text = f.days_treated_inhaled.ToString();
                if (f.days_treated_inhaled == null)
                {
                    days_inhaled_tx.Text = "";
                }
                else
                {
                    days_inhaled_tx.Text = f.days_treated_inhaled.ToString();
                }
                // intravenous_rb.Text = f.intravenous.ToString();
                if (f.intravenous == null)
                {
                    intravenous_rb.Text = "";
                }
                else
                {
                    intravenous_rb.Text = f.intravenous.ToString();
                }
                // days_intravenous_tx.Text = f.days_treated_intravenou.ToString();
                if (f.days_treated_intravenou == null)
                {
                    days_intravenous_tx.Text = "";
                }
                else
                {
                    days_intravenous_tx.Text = f.days_treated_intravenou.ToString();
                }
                // hospitalized_rb.Text = f.hospitalized.ToString();
                if (f.hospitalized == null)
                {
                    hospitalized_rb.Text = "";
                }
                else
                {
                    hospitalized_rb.Text = f.hospitalized.ToString();
                }
                // date_hospital_tx.Text = f.date_hospitalized.ToString();
                if (f.date_hospitalized == null)
                {
                    date_hospital_tx.Text = "";
                }
                else
                {
                    date_hospital_tx.Text = DateTime.Parse(f.date_hospitalized.ToString()).ToString("yyyy/MM/dd");
                    date_hospital_tx.TextMode = TextBoxMode.SingleLine;


                }
                //  reason_hospital_rb.Text = f.reason_hospital.ToString();
                if (f.reason_hospital == null)
                {
                    reason_hospital_rb.Text = "";
                }
                else
                {
                    reason_hospital_rb.Text = f.reason_hospital.ToString();
                }
                // other_hospital_tx.Text = f.hospital_other_name.ToString();
                if (f.hospital_other_name == null)
                {
                    other_hospital_tx.Text = "";
                }
                else
                {
                    other_hospital_tx.Text = f.hospital_other_name.ToString();
                }
                //days_hospital_tx.Text = f.days_hospitalized.ToString();
                if (f.days_hospitalized == null)
                {
                    days_hospital_tx.Text = "";
                }
                else
                {
                    days_hospital_tx.Text = f.days_hospitalized.ToString();
                }
                // iv_tx.Text = f.iv.ToString();
                if (f.iv == null)
                {
                    iv_tx.Text = "";
                }
                else
                {
                    iv_tx.Text = f.iv.ToString();
                }
                //  reason_iv_rb.Text = f.reason_iv.ToString();
                if (f.reason_iv == null)
                {
                    reason_iv_rb.Text = "";
                }
                else
                {
                    reason_iv_rb.Text = f.reason_iv.ToString();
                }
                // other_iv_tx.Text = f.iv_other_name.ToString();
                if (f.iv_other_name == null)
                {
                    other_iv_tx.Text = "";
                }
                else
                {
                    other_iv_tx.Text = f.iv_other_name.ToString();
                }
                //  days_iv_tx.Text = f.days_iv.ToString();

                if (f.days_iv == null)
                {
                    days_iv_tx.Text = "";
                }
                else
                {
                    days_iv_tx.Text = f.days_iv.ToString();
                }
                // save.Text = "edit";

                if (reason_iv_rb.SelectedItem.ToString() == "Other")
                {
                    other_iv_div.Visible = true;

                }
                else
                {
                    other_iv_div.Visible = false;

                }
                if (reason_hospital_rb.SelectedItem.ToString() == "Other")
                {
                    other_hospital_div.Visible = true;

                }
                else
                {
                    other_hospital_div.Visible = false;

                }

                if (oral_rb.SelectedItem.ToString() == "Yes")
                {
                    div_oral.Visible = true;

                }
                if (oral_rb.SelectedItem.ToString() == "No")
                {
                    div_oral.Visible = false;

                }



                if (inhaled_rb.SelectedItem.ToString() == "Yes")
                {
                    div_inhaled.Visible = true;

                }
                if (inhaled_rb.SelectedItem.ToString() == "No")
                {
                    div_inhaled.Visible = false;

                }



                if (intravenous_rb.SelectedItem.ToString() == "Yes")
                {
                    div_intravenous.Visible = true;

                }
                if (intravenous_rb.SelectedItem.ToString() == "No")
                {
                    div_intravenous.Visible = false;

                }



                if (hospitalized_rb.SelectedItem.ToString() == "Yes")
                {
                    div_hospitals.Visible = true;

                }
                if (hospitalized_rb.SelectedItem.ToString() == "No")
                {
                    div_hospitals.Visible = false;

                }



                if (iv_tx.SelectedItem.ToString() == "Yes")
                {
                    div_iv_g.Visible = true;

                }
                if (iv_tx.SelectedItem.ToString() == "No")
                {
                    div_iv_g.Visible = false;

                }





            }
        }
    }
    protected void reason_iv_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (reason_iv_rb.SelectedItem.ToString() == "Other")
        {
            other_iv_div.Visible = true;

        }
        else
        {
            other_iv_div.Visible = false;

        }
    }

    protected void reason_hospital_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (reason_hospital_rb.SelectedItem.ToString() == "Other")
        {
            other_hospital_div.Visible = true;

        }
        else
        {
            other_hospital_div.Visible = false;

        }
    }



    protected void date_of_visit_TextChanged(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
        {

            int x1 = int.Parse(Request.QueryString["p_id"].ToString());
            patient_demographics f2 = db.patient_demographics.FirstOrDefault(a => a.pt_id == x1);
            string ss = f2.date_of_birth.ToString();
            if (ss != "")
            {
                DateTime dd = DateTime.Parse(f2.date_of_birth.ToString());
                string d = dd.ToString("yyyy/MM/dd");


                if (d != "")
                {
                    DateTime october = Convert.ToDateTime(date_of_visit.Text);

                    DateTime birt = Convert.ToDateTime(d);
                    // DateTime october = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

                    int months = october.Month - birt.Month;
                    int years = october.Year - birt.Year;

                    if (october.Day < birt.Day)
                    {
                        months--;
                    }

                    if (months < 0)
                    {
                        years--;
                        months += 12;
                    }

                    int days = (october - birt.AddMonths((years * 12) + months)).Days;

                    age.Text = years.ToString();
                    //  month.Text = months.ToString();
                    // year.Text = years.ToString();
                }
            }
            else
            {

            }

        }
    }

    protected void oral_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (oral_rb.SelectedItem.ToString() == "Yes")
        {
            div_oral.Visible = true;

        }
        if (oral_rb.SelectedItem.ToString() == "No")
        {
            div_oral.Visible = false;

        }
    }

    protected void inhaled_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (inhaled_rb.SelectedItem.ToString() == "Yes")
        {
            div_inhaled.Visible = true;

        }
        if (inhaled_rb.SelectedItem.ToString() == "No")
        {
            div_inhaled.Visible = false;

        }
    }

    protected void intravenous_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (intravenous_rb.SelectedItem.ToString() == "Yes")
        {
            div_intravenous.Visible = true;

        }
        if (intravenous_rb.SelectedItem.ToString() == "No")
        {
            div_intravenous.Visible = false;

        }
    }

    protected void hospitalized_rb_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (hospitalized_rb.SelectedItem.ToString() == "Yes")
        {
            div_hospitals.Visible = true;

        }
        if (hospitalized_rb.SelectedItem.ToString() == "No")
        {
            div_hospitals.Visible = false;

        }
    }

    protected void iv_tx_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (iv_tx.SelectedItem.ToString() == "Yes")
        {
            div_iv_g.Visible = true;

        }
        if (iv_tx.SelectedItem.ToString() == "No")
        {
            div_iv_g.Visible = false;

        }
    }



}