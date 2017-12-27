using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;


namespace Web
{
    public partial class pub_discussion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Biz.TargetPath = Request.RawUrl;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                discussion dis = new discussion();
                dis.user_id = int.Parse(Session["user_id"].ToString());
                dis.dis_cont = myEditor.InnerText;
                dis.dis_title = title.Value;
                dis.pub_time = DateTime.Now;
                int result = DiscussionManager.InsertDiscussion(dis);
                if (result >= 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('讨论贴发表成功！');</script>");
                }
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('发布失败！请仔细检查');</script>");
            }
        }
    }
}