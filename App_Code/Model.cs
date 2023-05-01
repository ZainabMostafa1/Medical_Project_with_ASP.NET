﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class add_patient_tb
{
    public int id { get; set; }
    public string name { get; set; }
    public string code { get; set; }
    public Nullable<bool> del { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
    public Nullable<System.DateTime> date { get; set; }
}

public partial class cxr_tb
{
    public int id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
    public Nullable<bool> del { get; set; }
    public string CXR { get; set; }
    public Nullable<bool> r_Patientsick_ck { get; set; }
    public Nullable<bool> r_Followup_routine_ck { get; set; }
    public Nullable<bool> r_Followup_after_exacerbation_ck { get; set; }
    public Nullable<bool> r_other_ck { get; set; }
    public string r_other_name { get; set; }
    public string CXR_Findings { get; set; }
    public string CT_Findings { get; set; }
    public string Bronchiectasis { get; set; }
    public string Bronchial_Wall_Thickening { get; set; }
    public string Atelectasis { get; set; }
    public string Mucous_Plugging { get; set; }
    public string Air_Trapping { get; set; }
    public string Opacity { get; set; }
    public string Ground_Glass_Appearance { get; set; }
    public string Other_Findings { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
}

public partial class medication_tb
{
    public int id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
    public Nullable<bool> del { get; set; }
    public Nullable<bool> p_none_ck { get; set; }
    public Nullable<bool> p_Dornasealfa_ck { get; set; }
    public Nullable<bool> p_Acetylcystein_ck { get; set; }
    public Nullable<bool> p_Ibuprofen_ck { get; set; }
    public Nullable<bool> p_salineLeukotriene_ck { get; set; }
    public Nullable<bool> p_modifier_ck { get; set; }
    public Nullable<bool> p_Mastcell_ck { get; set; }
    public Nullable<bool> p_stabilizer_ck { get; set; }
    public Nullable<bool> p_Antifungal_ck { get; set; }
    public Nullable<bool> p_Steroid_oral_ck { get; set; }
    public Nullable<bool> p_Steroid_inhaled_ck { get; set; }
    public Nullable<bool> p_Steroid_Bronchodilator_ck { get; set; }
    public Nullable<bool> p_inhaled_Shortacting_ck { get; set; }
    public Nullable<bool> p_Longacting_anticholinergic_ck { get; set; }
    public Nullable<bool> p_Betaagonist_ck { get; set; }
    public Nullable<bool> p_others_ck { get; set; }
    public string p_other_name { get; set; }
    public string Saline_concentration { get; set; }
    public Nullable<bool> non_p_Pancreat_ck { get; set; }
    public Nullable<bool> non_p_Proton_ck { get; set; }
    public Nullable<bool> non_p_CF_ck { get; set; }
    public Nullable<bool> non_p_vitamin_ck { get; set; }
    public Nullable<bool> non_p_Supplemental_ck { get; set; }
    public Nullable<bool> c_none_ck { get; set; }
    public Nullable<bool> c_CFRD_ck { get; set; }
    public Nullable<bool> c_Liver_ck { get; set; }
    public Nullable<bool> c_gall_ck { get; set; }
    public Nullable<bool> c_ABPA_ck { get; set; }
    public Nullable<bool> c_Asthma_ck { get; set; }
    public Nullable<bool> c_DIOS_ck { get; set; }
    public Nullable<bool> c_GERD_ck { get; set; }
    public Nullable<bool> c_Nasa_ck { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
    public Nullable<bool> p_short_ck { get; set; }
}

public partial class microbiology_tb
{
    public int id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
    public Nullable<bool> del { get; set; }
    public string bacterial { get; set; }
    public string source_bacterial { get; set; }
    public string other_source { get; set; }
    public string microorganisms { get; set; }
    public Nullable<bool> Staphoylcoccus_ck { get; set; }
    public Nullable<bool> sensitive_ck { get; set; }
    public Nullable<bool> MRSA_ck { get; set; }
    public Nullable<bool> Pseudomonas_ck { get; set; }
    public Nullable<bool> Burkholderia_ck { get; set; }
    public Nullable<bool> Stenotrophomonas_ck { get; set; }
    public Nullable<bool> Alcaligenes_ck { get; set; }
    public Nullable<bool> Aspergillus_ck { get; set; }
    public Nullable<bool> Candida_ck { get; set; }
    public Nullable<bool> other_microorganisms_culture_ck { get; set; }
    public string other_microorganisms_name { get; set; }
    public string mycobacterial { get; set; }
    public string source_mycrobacterial { get; set; }
    public string other_mycobacterial { get; set; }
    public Nullable<bool> tuberculosis_ck { get; set; }
    public Nullable<bool> abscessus_ck { get; set; }
    public Nullable<bool> avium_ck { get; set; }
    public Nullable<bool> other_mycobacteria_culture_ck { get; set; }
    public Nullable<bool> none_ck { get; set; }
    public string other_myco_culture_name { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
}

public partial class patient_demographics
{
    public int id { get; set; }
    public string name { get; set; }
    public Nullable<System.DateTime> date_of_birth { get; set; }
    public string gender { get; set; }
    public string sweat_chloride { get; set; }
    public Nullable<System.DateTime> date_sweat_chloride { get; set; }
    public string cftr_genotype_1 { get; set; }
    public string cftr_genotype_2 { get; set; }
    public Nullable<System.DateTime> date_of_cftr { get; set; }
    public Nullable<bool> del { get; set; }
    public string user_name { get; set; }
    public Nullable<int> user_id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
}

public partial class PFT_tb
{
    public int id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
    public Nullable<bool> del { get; set; }
    public string PFT { get; set; }
    public Nullable<bool> r_Patient_refused_ck { get; set; }
    public Nullable<bool> r_Availability_ofPFT_ck { get; set; }
    public Nullable<bool> r_equipment_ck { get; set; }
    public Nullable<bool> r_other_ck { get; set; }
    public string r_other_name { get; set; }
    public string FEV1 { get; set; }
    public string FEV1_Predicted { get; set; }
    public string FVC { get; set; }
    public string FVC_Predicted { get; set; }
    public string FEF25 { get; set; }
    public string FEF25_Predicted { get; set; }
    public string FEV1_FVC_Ratio { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
}

public partial class upload_tb
{
    public int id { get; set; }
    public Nullable<int> p_id { get; set; }
    public Nullable<bool> del { get; set; }
    public string img_tb { get; set; }
    public string file_tb { get; set; }
    public string p_name { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
    public string p_code { get; set; }
}

public partial class user
{
    public int id { get; set; }
    public string name { get; set; }
    public string user_name { get; set; }
    public string pass { get; set; }
    public Nullable<bool> del { get; set; }
    public string type { get; set; }
}

public partial class visit_information_tb
{
    public int id { get; set; }
    public Nullable<int> pt_id { get; set; }
    public string pt_code { get; set; }
    public Nullable<bool> del { get; set; }
    public Nullable<System.DateTime> date_of_visit { get; set; }
    public string age { get; set; }
    public string medecation { get; set; }
    public string height { get; set; }
    public string weight { get; set; }
    public string pulmonary { get; set; }
    public string airway { get; set; }
    public string oral { get; set; }
    public string days_treated_oral { get; set; }
    public Nullable<System.DateTime> date_treated_oral { get; set; }
    public string inhaled { get; set; }
    public string days_treated_inhaled { get; set; }
    public string intravenous { get; set; }
    public string days_treated_intravenou { get; set; }
    public string hospitalized { get; set; }
    public Nullable<System.DateTime> date_hospitalized { get; set; }
    public Nullable<bool> hospital_Pulmonary_exacerbatio { get; set; }
    public Nullable<bool> hospital_Pulmonary_complication { get; set; }
    public Nullable<bool> hospital_Gastrointestinal { get; set; }
    public Nullable<bool> hospital_Sinus { get; set; }
    public Nullable<bool> hospital_other { get; set; }
    public string hospital_other_name { get; set; }
    public string days_hospitalized { get; set; }
    public string iv { get; set; }
    public string reason_iv { get; set; }
    public Nullable<bool> iv_pulmonary { get; set; }
    public Nullable<bool> iv_pulmonary_complication { get; set; }
    public Nullable<bool> iv_Gastrointestinal { get; set; }
    public Nullable<bool> iv_sinus { get; set; }
    public Nullable<bool> iv_other { get; set; }
    public string iv_other_name { get; set; }
    public string days_iv { get; set; }
    public Nullable<int> user_id { get; set; }
    public string user_name { get; set; }
    public string reason_hospital { get; set; }
}