using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pt_demographic_pg : System.Web.UI.Page
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
    protected void reload_Click(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
        {
            int p_id = int.Parse(Request.QueryString["p_id"].ToString());


            Response.Redirect("pt_demographic_pg.aspx?p_id=" + p_id);
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

        add_patient_tb f12 = db.add_patient_tb.FirstOrDefault(a => a.id == p);
        {
            f12.name = name.Text;

        };

        db.SaveChanges();
        patient_demographics f11 = db.patient_demographics.FirstOrDefault(a => a.pt_id == p);
        {


            if (p_date_of_birth.Text != "")
            {
                f11.date_of_birth = DateTime.Parse(p_date_of_birth.Text);
            }
            if (Date_of_CFTR.Text != "")
            {

                f11.date_of_cftr = DateTime.Parse(Date_of_CFTR.Text);
            }
            if (date_sweat_chloride.Text != "")
            {
                f11.date_sweat_chloride = DateTime.Parse(date_sweat_chloride.Text);
            }

            f11.name = name.Text;
            f11.gender = p_gender.Text;
            f11.sweat_chloride = sweat_chloride.Text;
            f11.cftr_genotype_1 = CFTR_1.Text;
            f11.cftr_genotype_2 = CFTR_2.Text;


            f11.user_id = user_id;

            f11.user_name = n;

            f11.del = false;
            f11.pt_code = c;
        };

        db.SaveChanges();
        //formContent.Visible = false;
       // message.Visible = true;
        save.Text = "saved Succssesfully";
        Response.Redirect("visit_information.aspx?p_id=" + p);



    }
}