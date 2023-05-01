using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class img : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
            {
                int x = int.Parse(Request.QueryString["p_id"].ToString());
                add_patient_tb f = db.add_patient_tb.FirstOrDefault(a => a.id == x);
              
               
                name_tx.Text = f.name.ToString();
                code_tx.Text = f.code.ToString();


                //  upload_tb f1 = db.upload_tb.FirstOrDefault(a => a.p_id == x);
                //mod.ModuleFile = new byte[FileUpload1.ContentLength];
                //FileUpload1.InputStream.Read(mod.ModuleFile, 0, FileUpload1.ContentLength);
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {
                    save.Text = "edit";

                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit2"])))
                {
                    save2.Text = "edit";

                }

            }
            //if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["view"])))
            //{
            //    int x11 = int.Parse(Request.QueryString["view"].ToString());


            //    upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x11);
            //    string b = pro.file_tb.ToString();
            //    //Response.Redirect("/assets/images/upload/" + b);
            //    Process.Start("/assets/images/upload/" + b);

            //}
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
            {
                int x2 = int.Parse(Request.QueryString["p_id"].ToString());

                int x1 = int.Parse(Request.QueryString["del"].ToString());


                upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x1);
                pro.del = true;
                db.SaveChanges();






                Response.Redirect("img.aspx?p_id=" + x2);
            }
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {
        
            string imgName = FileUpload1.FileName.ToString();
        if (imgName != "")
        {
            string imgPath = "assets/images/upload/" + imgName;
       
            FileUpload1.SaveAs(Server.MapPath(imgPath));

            //string vidioName = FileUpload2.FileName.ToString();
            //string vidioPath = "assets/images/upload/" + vidioName;
            //FileUpload2.SaveAs(Server.MapPath(vidioPath));

            string n = "", u = "";
            if (Session["user"] != null && Session["name"] != null)
            {
                n = Session["name"].ToString();
                u = Session["user"].ToString();

            }
            int user_id = (from s in db.user where s.user_name == u select s.id).FirstOrDefault();

            int p = int.Parse(Request.QueryString["p_id"].ToString());


            if (save.Text != "edit")
            {

                upload_tb ex = new upload_tb
                {
                    p_name = name_tx.Text,

                    img_tb = imgName.ToString(),
                    // file_tb = vidioName.ToString(),

                    p_code = code_tx.Text,
                    user_id = user_id,
                    user_name = n,
                    p_id = p,
                    del = false

                };
                db.upload_tb.Add(ex);
                db.SaveChanges();
                // formContent.Visible = false;
                 success.Visible = true;
               // save.Text = "saved Succssesfully";
              //  Response.Redirect("img.aspx?p_id=" + p);

            }


            else
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                // materials f = db.materials.FirstOrDefault(a => a.id == x);

                upload_tb f11 = db.upload_tb.FirstOrDefault(a => a.id == x);
                {

                    f11.p_name = name_tx.Text;

                    f11.img_tb = imgName.ToString();
                    // f11.file_tb = vidioName.ToString();

                    f11.p_code = code_tx.Text;

                    f11.user_name = n;
                    f11.user_id = user_id;
                    f11.del = false;

                };

                db.SaveChanges();
                //formContent.Visible = false;
                //message.Visible = true;
                success.Visible = true;

               // save.Text = "saved Succssesfully";
               // Response.Redirect("img.aspx?p_id=" + p);
            }
        }
        else
        {
            MsgBox("Choose image , please!", this.Page, this);
        }
        
    }
    protected void save2_Click(object sender, EventArgs e)
    {

        //string imgName = FileUpload1.FileName.ToString();
        //string imgPath = "assets/images/upload/" + imgName;
        //FileUpload1.SaveAs(Server.MapPath(imgPath));
       
            string vidioName = FileUpload2.FileName.ToString();
        if (vidioName != "")
        {
            string vidioPath = "assets/images/upload/" + vidioName;
            FileUpload2.SaveAs(Server.MapPath(vidioPath));

            string n = "", u = "";
            if (Session["user"] != null && Session["name"] != null)
            {
                n = Session["name"].ToString();
                u = Session["user"].ToString();

            }
            int user_id = (from s in db.user where s.user_name == u select s.id).FirstOrDefault();

            int p = int.Parse(Request.QueryString["p_id"].ToString());



            if (save2.Text != "edit")
            {

                upload_tb ex = new upload_tb
                {
                    p_name = name_tx.Text,

                    // img_tb = imgName.ToString(),
                    file_tb = vidioName.ToString(),

                    p_code = code_tx.Text,
                    user_id = user_id,
                    user_name = n,
                    p_id = p,
                    del = false

                };
                db.upload_tb.Add(ex);
                db.SaveChanges();
                // formContent.Visible = false;
                // message.Visible = true;
                success.Visible = true;

               // save.Text = "saved Succssesfully";
              //  Response.Redirect("img.aspx?p_id=" + p);
            }
            else
            {
                int x = int.Parse(Request.QueryString["edit2"].ToString());
                // materials f = db.materials.FirstOrDefault(a => a.id == x);

                upload_tb f11 = db.upload_tb.FirstOrDefault(a => a.id == x);
                {

                    f11.p_name = name_tx.Text;

                    // f11.img_tb = imgName.ToString();
                    f11.file_tb = vidioName.ToString();

                    f11.p_code = code_tx.Text;

                    f11.user_name = n;
                    f11.user_id = user_id;
                    f11.del = false;

                };

                db.SaveChanges();
                //formContent.Visible = false;
                //message.Visible = true;
                success.Visible = true;

               // save.Text = "saved Succssesfully";
              //  Response.Redirect("img.aspx?p_id=" + p);
            }
        }
        else
        {
            MsgBox("Choose file , please!", this.Page, this);
        }
    }

    protected void bttnpdf_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["view"])))
        {
            int x11 = int.Parse(Request.QueryString["view"].ToString());


            upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x11);
            string b = pro.file_tb.ToString();
          //  Response.Redirect("/assets/images/upload/" + b);

            string FilePath = Server.MapPath("/assets/images/upload/" + b);
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData(FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
        }
    }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
    //protected void View(object sender, EventArgs e)
    //{
    //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["view"])))
    //    {
    //        int x11 = int.Parse(Request.QueryString["view"].ToString());


    //        upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x11);
    //        string b = pro.file_tb.ToString();

    //        string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"500px\" height=\"300px\">";
    //        embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
    //        embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
    //        embed += "</object>";
    //        ltEmbed.Text = string.Format(embed, ResolveUrl("/assets/images/upload/" + b));
    //    }
    //    }

    protected void close_Click(object sender, EventArgs e)
    {
        int p = int.Parse(Request.QueryString["p_id"].ToString());

        Response.Redirect("img.aspx?p_id=" + p);
    }
}