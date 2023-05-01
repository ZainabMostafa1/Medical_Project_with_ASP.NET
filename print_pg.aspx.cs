using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_pg : System.Web.UI.Page
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

                visit_information_tb f1 = db.visit_information_tb.FirstOrDefault(a => a.pt_id == x);






                if (f1.date_of_visit == null)
                {
                    date_of_visit.Text = "";
                }
                else
                {

                    date_of_visit.Text = DateTime.Parse(f1.date_of_visit.ToString()).ToString("yyyy/MM/dd");
                    date_of_visit.TextMode = TextBoxMode.SingleLine;

                }





                // date_of_visit.Text = f.date_of_visit.ToString();

                // age.Text = f.age.ToString();
                if (f1.age != null)
                {
                    age.Text = f1.age.ToString();

                }

                // medication_tx.Text = f.medecation.ToString();
                if (f1.medecation == null)
                {
                    medication_tx.Text = "";
                }
                else
                {
                    medication_tx.Text = f1.medecation.ToString();
                }
                // p_height.Text = f.height.ToString();
                if (f1.height == null)
                {
                    p_height.Text = "";
                }
                else
                {
                    p_height.Text = f1.height.ToString();
                }
                // p_weight.Text = f.weight.ToString();
                if (f1.weight == null)
                {
                    p_weight.Text = "";
                }
                else
                {
                    p_weight.Text = f1.weight.ToString();
                }
                // pulmonary_rb.Text = f.pulmonary.ToString();
                if (f1.pulmonary == null)
                {
                    pulmonary_rb.Text = "";
                }
                else
                {
                    pulmonary_rb.Text = f1.pulmonary.ToString();
                }
                // airway_rb.Text = f.airway.ToString();
                if (f1.airway == null)
                {
                    airway_rb.Text = "";
                }
                else
                {
                    airway_rb.Text = f1.airway.ToString();
                }
                // oral_rb.Text = f.oral.ToString();
                if (f1.oral == null)
                {
                    oral_rb.Text = "";
                }
                else
                {
                    oral_rb.Text = f1.oral.ToString();
                }
                // days_oral.Text = f.days_treated_oral.ToString();
                if (f1.days_treated_oral == null)
                {
                    days_oral.Text = "";
                }
                else
                {
                    days_oral.Text = f1.days_treated_oral.ToString();
                }
                // date_oral.Text = f.date_treated_oral.ToString();
                if (f1.date_treated_oral == null)
                {
                    date_oral.Text = "";
                }
                else
                {
                    date_oral.Text = DateTime.Parse(f1.date_treated_oral.ToString()).ToString("yyyy/MM/dd");
                    date_oral.TextMode = TextBoxMode.SingleLine;


                }
                // inhaled_rb.Text = f.inhaled.ToString();
                if (f1.inhaled == null)
                {
                    inhaled_rb.Text = "";
                }
                else
                {
                    inhaled_rb.Text = f1.inhaled.ToString();
                }
                // days_inhaled_tx.Text = f.days_treated_inhaled.ToString();
                if (f1.days_treated_inhaled == null)
                {
                    days_inhaled_tx.Text = "";
                }
                else
                {
                    days_inhaled_tx.Text = f1.days_treated_inhaled.ToString();
                }
                // intravenous_rb.Text = f.intravenous.ToString();
                if (f1.intravenous == null)
                {
                    intravenous_rb.Text = "";
                }
                else
                {
                    intravenous_rb.Text = f1.intravenous.ToString();
                }
                // days_intravenous_tx.Text = f.days_treated_intravenou.ToString();
                if (f1.days_treated_intravenou == null)
                {
                    days_intravenous_tx.Text = "";
                }
                else
                {
                    days_intravenous_tx.Text = f1.days_treated_intravenou.ToString();
                }
                // hospitalized_rb.Text = f.hospitalized.ToString();
                if (f1.hospitalized == null)
                {
                    hospitalized_rb.Text = "";
                }
                else
                {
                    hospitalized_rb.Text = f1.hospitalized.ToString();
                }
                // date_hospital_tx.Text = f.date_hospitalized.ToString();
                if (f1.date_hospitalized == null)
                {
                    date_hospital_tx.Text = "";
                }
                else
                {
                    date_hospital_tx.Text = DateTime.Parse(f1.date_hospitalized.ToString()).ToString("yyyy/MM/dd");
                    date_hospital_tx.TextMode = TextBoxMode.SingleLine;


                }
                //  reason_hospital_rb.Text = f.reason_hospital.ToString();
                if (f1.reason_hospital == null)
                {
                    reason_hospital_rb.Text = "";
                }
                else
                {
                    reason_hospital_rb.Text = f1.reason_hospital.ToString();
                }
                // other_hospital_tx.Text = f.hospital_other_name.ToString();
                if (f1.hospital_other_name == null)
                {
                    other_hospital_tx.Text = "";
                }
                else
                {
                    other_hospital_tx.Text = f1.hospital_other_name.ToString();
                }
                //days_hospital_tx.Text = f.days_hospitalized.ToString();
                if (f1.days_hospitalized == null)
                {
                    days_hospital_tx.Text = "";
                }
                else
                {
                    days_hospital_tx.Text = f1.days_hospitalized.ToString();
                }
                // iv_tx.Text = f.iv.ToString();
                if (f1.iv == null)
                {
                    iv_tx.Text = "";
                }
                else
                {
                    iv_tx.Text = f1.iv.ToString();
                }
                //  reason_iv_rb.Text = f.reason_iv.ToString();
                if (f1.reason_iv == null)
                {
                    reason_iv_rb.Text = "";
                }
                else
                {
                    reason_iv_rb.Text = f1.reason_iv.ToString();
                }
                // other_iv_tx.Text = f.iv_other_name.ToString();
                if (f1.iv_other_name == null)
                {
                    other_iv_tx.Text = "";
                }
                else
                {
                    other_iv_tx.Text = f1.iv_other_name.ToString();
                }
                //  days_iv_tx.Text = f.days_iv.ToString();

                if (f1.days_iv == null)
                {
                    days_iv_tx.Text = "";
                }
                else
                {
                    days_iv_tx.Text = f1.days_iv.ToString();
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


                //////////////////////////

                microbiology_tb f2 = db.microbiology_tb.FirstOrDefault(a => a.pt_id == x);


                if (f2.bacterial == null)
                {
                    bacterial_rb.Text = "";
                }
                else
                {
                    bacterial_rb.Text = f2.bacterial.ToString();
                }

                if (f2.source_bacterial == null)
                {
                    source_bacterial_rb.Text = "";
                }
                else
                {
                    source_bacterial_rb.Text = f2.source_bacterial.ToString();
                }
                if (f2.other_source == null)
                {
                    other_source_tx.Text = "";
                }
                else
                {
                    other_source_tx.Text = f2.other_source.ToString();
                }


                microorganisms_check.Items[0].Selected = Convert.ToBoolean(f2.Staphoylcoccus_ck);
                microorganisms_check.Items[1].Selected = Convert.ToBoolean(f2.sensitive_ck);

                microorganisms_check.Items[2].Selected = Convert.ToBoolean(f2.MRSA_ck);
                microorganisms_check.Items[3].Selected = Convert.ToBoolean(f2.Pseudomonas_ck);
                microorganisms_check.Items[4].Selected = Convert.ToBoolean(f2.Burkholderia_ck);
                microorganisms_check.Items[5].Selected = Convert.ToBoolean(f2.Stenotrophomonas_ck);
                microorganisms_check.Items[6].Selected = Convert.ToBoolean(f2.Alcaligenes_ck);
                microorganisms_check.Items[7].Selected = Convert.ToBoolean(f2.Aspergillus_ck);
                microorganisms_check.Items[8].Selected = Convert.ToBoolean(f2.Candida_ck);
                microorganisms_check.Items[9].Selected = Convert.ToBoolean(f2.other_microorganisms_culture_ck);

                if (f2.other_microorganisms_name == null)
                {
                    other_micro_tx.Text = "";
                }
                else
                {
                    other_micro_tx.Text = f2.other_microorganisms_name.ToString();
                }
                if (f2.mycobacterial == null)
                {
                    mycobacterial_rb.Text = "";
                }
                else
                {
                    mycobacterial_rb.Text = f2.mycobacterial.ToString();
                }
                if (f2.source_mycrobacterial == null)
                {
                    source_mycrobacterial_rb.Text = "";
                }
                else
                {
                    source_mycrobacterial_rb.Text = f2.source_mycrobacterial.ToString();
                }
                if (f2.other_mycobacterial == null)
                {
                    other_mycobacterial_tx.Text = "";
                }
                else
                {
                    other_mycobacterial_tx.Text = f2.other_mycobacterial.ToString();
                }
                mycobacteria_check.Items[0].Selected = Convert.ToBoolean(f2.tuberculosis_ck);
                mycobacteria_check.Items[1].Selected = Convert.ToBoolean(f2.abscessus_ck);
                mycobacteria_check.Items[2].Selected = Convert.ToBoolean(f2.avium_ck);
                mycobacteria_check.Items[3].Selected = Convert.ToBoolean(f2.other_mycobacteria_culture_ck);
                mycobacteria_check.Items[4].Selected = Convert.ToBoolean(f2.none_ck);


                if (f2.other_myco_culture_name == null)
                {
                    other_myco_culture_tx.Text = "";
                }
                else
                {
                    other_myco_culture_tx.Text = f2.other_myco_culture_name.ToString();
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

                ////////////////////////////////////////////

                medication_tb f3 = db.medication_tb.FirstOrDefault(a => a.pt_id == x);




                pulmonry_check.Items[0].Selected = Convert.ToBoolean(f3.p_none_ck);
                pulmonry_check.Items[1].Selected = Convert.ToBoolean(f3.p_Dornasealfa_ck);
                pulmonry_check.Items[2].Selected = Convert.ToBoolean(f3.p_Acetylcystein_ck);
                pulmonry_check.Items[3].Selected = Convert.ToBoolean(f3.p_Ibuprofen_ck);
                pulmonry_check.Items[4].Selected = Convert.ToBoolean(f3.p_salineLeukotriene_ck);
                pulmonry_check.Items[5].Selected = Convert.ToBoolean(f3.p_modifier_ck);
                pulmonry_check.Items[6].Selected = Convert.ToBoolean(f3.p_Mastcell_ck);
                pulmonry_check.Items[7].Selected = Convert.ToBoolean(f3.p_stabilizer_ck);
                pulmonry_check.Items[8].Selected = Convert.ToBoolean(f3.p_Antifungal_ck);
                pulmonry_check.Items[9].Selected = Convert.ToBoolean(f3.p_Steroid_oral_ck);
                pulmonry_check.Items[10].Selected = Convert.ToBoolean(f3.p_Steroid_inhaled_ck);
                pulmonry_check.Items[11].Selected = Convert.ToBoolean(f3.p_Steroid_Bronchodilator_ck);
                pulmonry_check.Items[12].Selected = Convert.ToBoolean(f3.p_inhaled_Shortacting_ck);
                pulmonry_check.Items[13].Selected = Convert.ToBoolean(f3.p_Longacting_anticholinergic_ck);
                pulmonry_check.Items[14].Selected = Convert.ToBoolean(f3.p_Betaagonist_ck);
                pulmonry_check.Items[15].Selected = Convert.ToBoolean(f3.p_short_ck);
                pulmonry_check.Items[16].Selected = Convert.ToBoolean(f3.p_others_ck);


                if (f3.p_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f3.p_other_name.ToString();
                }
                if (f3.Saline_concentration == null)
                {
                    Saline_rb.Text = "";
                }
                else
                {
                    Saline_rb.Text = f3.Saline_concentration.ToString();
                }
                non_p_check.Items[0].Selected = Convert.ToBoolean(f3.non_p_Pancreat_ck);
                non_p_check.Items[1].Selected = Convert.ToBoolean(f3.non_p_Proton_ck);
                non_p_check.Items[2].Selected = Convert.ToBoolean(f3.non_p_CF_ck);
                non_p_check.Items[3].Selected = Convert.ToBoolean(f3.non_p_vitamin_ck);
                non_p_check.Items[4].Selected = Convert.ToBoolean(f3.non_p_Supplemental_ck);

                complications_check.Items[0].Selected = Convert.ToBoolean(f3.c_none_ck);
                complications_check.Items[1].Selected = Convert.ToBoolean(f3.c_CFRD_ck);
                complications_check.Items[2].Selected = Convert.ToBoolean(f3.c_Liver_ck);
                complications_check.Items[3].Selected = Convert.ToBoolean(f3.c_gall_ck);
                complications_check.Items[4].Selected = Convert.ToBoolean(f3.c_ABPA_ck);
                complications_check.Items[5].Selected = Convert.ToBoolean(f3.c_Asthma_ck);
                complications_check.Items[6].Selected = Convert.ToBoolean(f3.c_DIOS_ck);
                complications_check.Items[7].Selected = Convert.ToBoolean(f3.c_GERD_ck);
                complications_check.Items[8].Selected = Convert.ToBoolean(f3.c_Nasa_ck);

                /////////////////////////////////////////////////////////

                PFT_tb f4 = db.PFT_tb.FirstOrDefault(a => a.pt_id == x);





                if (f4.PFT == null)
                {
                    pft_rb.Text = "";
                }
                else
                {
                    pft_rb.Text = f4.PFT.ToString();
                }
                reason_check.Items[0].Selected = Convert.ToBoolean(f4.r_Patient_refused_ck);
                reason_check.Items[1].Selected = Convert.ToBoolean(f4.r_Availability_ofPFT_ck);
                reason_check.Items[2].Selected = Convert.ToBoolean(f4.r_equipment_ck);
                reason_check.Items[3].Selected = Convert.ToBoolean(f4.r_other_ck);


                if (f4.r_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f4.r_other_name.ToString();
                }

                if (f4.FEV1 == null)
                {
                    fev1_tx.Text = "";
                }
                else
                {
                    fev1_tx.Text = f4.FEV1.ToString();
                }

                if (f4.FEV1_Predicted == null)
                {
                    fev1_p_tx.Text = "";
                }
                else
                {
                    fev1_p_tx.Text = f4.FEV1_Predicted.ToString();
                }

                if (f4.FVC == null)
                {
                    FVC_tx.Text = "";
                }
                else
                {
                    FVC_tx.Text = f4.FVC.ToString();
                }

                if (f4.FVC_Predicted == null)
                {
                    FVC_p_tx.Text = "";
                }
                else
                {
                    FVC_p_tx.Text = f4.FVC_Predicted.ToString();
                }

                if (f4.FEF25 == null)
                {
                    FEF25_tx.Text = "";
                }
                else
                {
                    FEF25_tx.Text = f4.FEF25.ToString();
                }

                if (f4.FEF25_Predicted == null)
                {
                    fef25_p_tx.Text = "";
                }
                else
                {
                    fef25_p_tx.Text = f4.FEF25_Predicted.ToString();
                }

                if (f4.FEV1_FVC_Ratio == null)
                {
                    ratio_tx.Text = "";
                }
                else
                {
                    ratio_tx.Text = f4.FEV1_FVC_Ratio.ToString();
                }

                ///////////////////////////////////////////////////

                cxr_tb f5 = db.cxr_tb.FirstOrDefault(a => a.pt_id == x);





                if (f5.CXR == null)
                {
                    cxr_rb.Text = "";
                }
                else
                {
                    cxr_rb.Text = f5.CXR.ToString();
                }
                reason_check.Items[0].Selected = Convert.ToBoolean(f5.r_Patientsick_ck);
                reason_check.Items[1].Selected = Convert.ToBoolean(f5.r_Followup_routine_ck);
                reason_check.Items[2].Selected = Convert.ToBoolean(f5.r_Followup_after_exacerbation_ck);
                reason_check.Items[3].Selected = Convert.ToBoolean(f5.r_other_ck);


                if (f5.r_other_name == null)
                {
                    other_tx.Text = "";
                }
                else
                {
                    other_tx.Text = f5.r_other_name.ToString();
                }

                if (f5.CXR_Findings == null)
                {
                    CXR_Findings_tx.Text = "";
                }
                else
                {
                    CXR_Findings_tx.Text = f5.CXR_Findings.ToString();
                }

                if (f5.CT_Findings == null)
                {
                    CT_Findings_tx.Text = "";
                }
                else
                {
                    CT_Findings_tx.Text = f5.CT_Findings.ToString();
                }

                if (f5.Bronchiectasis == null)
                {
                    Bronchiectasis_tx.Text = "";
                }
                else
                {
                    Bronchiectasis_tx.Text = f5.Bronchiectasis.ToString();
                }

                if (f5.Bronchial_Wall_Thickening == null)
                {
                    BronchialWallThickening_tx.Text = "";
                }
                else
                {
                    BronchialWallThickening_tx.Text = f5.Bronchial_Wall_Thickening.ToString();
                }

                if (f5.Atelectasis == null)
                {
                    Atelectasis_tx.Text = "";
                }
                else
                {
                    Atelectasis_tx.Text = f5.Atelectasis.ToString();
                }

                if (f5.Mucous_Plugging == null)
                {
                    MucousPlugging_tx.Text = "";
                }
                else
                {
                    MucousPlugging_tx.Text = f5.Mucous_Plugging.ToString();
                }

                if (f5.Air_Trapping == null)
                {
                    AirTrapping_tx.Text = "";
                }
                else
                {
                    AirTrapping_tx.Text = f5.Air_Trapping.ToString();
                }

                if (f5.Opacity == null)
                {
                    Opacity_tx.Text = "";
                }
                else
                {
                    Opacity_tx.Text = f5.Opacity.ToString();
                }

                if (f5.Ground_Glass_Appearance == null)
                {
                    GroundGlassAppearance_tx.Text = "";
                }
                else
                {
                    GroundGlassAppearance_tx.Text = f5.Ground_Glass_Appearance.ToString();
                }

                if (f5.Other_Findings == null)
                {
                    OtherFindings_tx.Text = "";
                }
                else
                {
                    OtherFindings_tx.Text = f5.Other_Findings.ToString();
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