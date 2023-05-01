using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_pg : System.Web.UI.Page
{
    drDBEntities db = new drDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["view"])))
            {
                int x11 = int.Parse(Request.QueryString["view"].ToString());


                upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x11);
                string b = pro.file_tb.ToString();
               
                string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"1300px\" height=\"1300px\">";
                embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                embed += "</object>";
                ltEmbed.Text = string.Format(embed, ResolveUrl("/assets/images/upload/" + b));
            }
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["view2"])))
            {
                int x11 = int.Parse(Request.QueryString["view2"].ToString());


                upload_tb pro = db.upload_tb.FirstOrDefault(a => a.id == x11);
               
                string b2 = pro.img_tb.ToString();

                string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"1300px\" height=\"1300px\">";
                embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                embed += "</object>";
                ltEmbed.Text = string.Format(embed, ResolveUrl("/assets/images/upload/" + b2));
            }
        }
    }
}