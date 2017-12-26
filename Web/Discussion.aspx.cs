using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Models;
using System.Data;

namespace Web
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDiscussion();
                BindHotDiscussion();
                BindLikeDiscussion();
                Biz.TargetPath = Request.RawUrl;
            }

        }
        public void BindDiscussion()
        {
            //int discussion = int.Parse(Request.QueryString["id"]);
            DataTable dt = DiscussionManager.SelectAll();
            if (dt != null && dt.Rows.Count > 0)
            {
                LVDiscussion.DataSource = dt;
                LVDiscussion.DataBind();
            }
        }
        public void BindHotDiscussion()
        {
            //int discussion = int.Parse(Request.QueryString["id"]);
            DataTable dt = DiscussionManager.SelectAll();
            if (dt != null && dt.Rows.Count > 0)
            {
                ReHotDiscussion.DataSource = dt;
                ReHotDiscussion.DataBind();
            }
        }

        public void BindLikeDiscussion()
        {
            //int discussion = int.Parse(Request.QueryString["id"]);
            DataTable dt = DiscussionManager.SelectAll();
            if (dt != null && dt.Rows.Count > 0)
            {
                ReLikeDiscussion.DataSource = dt;
                ReLikeDiscussion.DataBind();
            }
        }

        protected void discussion_PreRender(object sender, EventArgs e)
        {
            BindDiscussion();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("Index.aspx");//发帖页面
            }
            else
            {
                Label1.Text = "发帖请先登录！";
                Response.Redirect("Login1.aspx");
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string keys = SearchText.Text.Trim();
            DataTable dt = DiscussionManager.SelectKeys(keys);
            if (dt != null && dt.Rows.Count != 0)
            {
                LVDiscussion.DataSource =dt;
                LVDiscussion.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpDatePanel01, this.GetType(), "click", "alert('没有找到相关内容')", true);
                BindDiscussion();
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            LVDiscussion.DataBind(); //绑定ListView
        }
    }
}