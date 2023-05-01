using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_pt : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int num = 1;
        if (db.add_patient_tb.Count() <= 0)
        {
            num = 1;
        }
        else
        {
            int x1 = db.add_patient_tb.Max(a => a.id);
            add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == x1);
            string q = f.code.ToString();
            int qq = int.Parse(q);
            int x = qq + 1;
            num = x;
        }
        code_tx.Text = num.ToString();
        // date_tx.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
        date_tx.Text = DateTime.Now.ToShortDateString(); ;
        if (!IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
            {
                date_tx.TextMode = TextBoxMode.SingleLine;
               
                int x = int.Parse(Request.QueryString["edit"].ToString());
                add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == x);

                date_tx.Text = f.date.ToString();
                
                name.Text = f.name.ToString();
               
                code_tx.Text = f.code.ToString();
                save.Text = "edit";




            }
        }
    }
    //protected void reload_Click(object sender, EventArgs e)
    //{

    //    Response.Redirect("addPatient.aspx");

    //}
    protected void save_Click(object sender, EventArgs e)
    {
        string n = "", u = "";
        if (Session["user"] != null && Session["name"] != null)
        {
            n = Session["name"].ToString();
            u = Session["user"].ToString();

        }
        int user_id = (from s in db.user where s.user_name == u select s.id).FirstOrDefault();

        if (save.Text != "edit")
        {

            add_patient_tb ex = new add_patient_tb
            {
                date = DateTime.Parse(date_tx.Text),
                
                name = name.Text,
               
                code = code_tx.Text,
               

                user_id = user_id,

                user_name = n,

                del = false

            };
            db.add_patient_tb.Add(ex);
            db.SaveChanges();

            var a = (from aa in db.add_patient_tb select aa.id).Max();
            patient_demographics ex3 = new patient_demographics
            {
                pt_id = a,
                name = name.Text,
                pt_code=code_tx.Text,
                del = false

            };
            db.patient_demographics.Add(ex3);
            db.SaveChanges();
            visit_information_tb ex2 = new visit_information_tb
            {
                pt_id = a,
                pt_code=code_tx.Text,
                
                del = false

            };
            db.visit_information_tb.Add(ex2);
            db.SaveChanges();

            microbiology_tb ex4 = new microbiology_tb
            {
                pt_id = a,
                pt_code = code_tx.Text,

                del = false

            };
            db.microbiology_tb.Add(ex4);
            db.SaveChanges();

            medication_tb ex5 = new medication_tb
            {
                pt_id = a,
                pt_code = code_tx.Text,

                del = false

            };
            db.medication_tb.Add(ex5);
            db.SaveChanges();

            PFT_tb ex6 = new PFT_tb
            {
                pt_id = a,
                pt_code = code_tx.Text,

                del = false

            };
            db.PFT_tb.Add(ex6);
            db.SaveChanges();

            cxr_tb ex7 = new cxr_tb
            {
                pt_id = a,
                pt_code = code_tx.Text,

                del = false

            };
            db.cxr_tb.Add(ex7);
            db.SaveChanges();

            //upload_tb ex8 = new upload_tb
            //{
            //    p_id = a,
            //    p_code = code_tx.Text,

            //    del = false

            //};
            //db.upload_tb.Add(ex8);
            //db.SaveChanges();
            // close.Visible = true;
            //  formContent.Visible = false;
            //message.Visible = true;
            Response.Redirect("pt_demographic_pg.aspx?p_id=" + a);

        }
        else
        {
            int x = int.Parse(Request.QueryString["edit"].ToString());
            add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == x);
            {
                f.date = DateTime.Parse(date_tx.Text);
               
                f.name = name.Text;
               
                f.code = code_tx.Text;
              
                f.user_id = user_id;

                f.user_name = n;

                f.del = false;

            };

            db.SaveChanges();
            formContent.Visible = false;
            message.Visible = true;
        }

    }



}
