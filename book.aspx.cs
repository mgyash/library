using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace librarymanagementproject
{
    public partial class book : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\project library\librarymanagementproject\App_Data\librarymanagement.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Write("Hello, " + Session["user"]);
            }
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select * from tbl_Category", con);


                ddlcategory_id.DataSource = cmd.ExecuteReader();
                ddlcategory_id.DataTextField = "category_name";
                ddlcategory_id.DataValueField = "cat_id";
                ddlcategory_id.DataBind();
                con.Close();
                fngrid();

            }
            con.Close();

            con.Open();
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select * from tbl_author", con);


                ddlauthor_id.DataSource = cmd.ExecuteReader();
                ddlauthor_id.DataTextField = "author_name";
                ddlauthor_id.DataValueField = "author_Id";
                ddlauthor_id.DataBind();
            }
            con.Close();

        }
        protected void fngrid()
        {
            SqlCommand cmd = new SqlCommand("select * from tbl_book", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            sda.Fill(ds);

            GV_BOOKDATA.DataSource = ds;
            GV_BOOKDATA.DataBind();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            con.Open();
            String title = t_box_title.Text;
            String cat_id = ddlcategory_id.SelectedValue;
            String au_id = ddlauthor_id.SelectedValue;
            String totalbook = t_box_totalbook.Text;
            String img = "~/img/" + fubookphoto.FileName;
            SqlCommand cmd = new SqlCommand("insert into tbl_book(Title,category_id,author_id,Totalbook,book_photo) Values('" + title + "','" + cat_id + "','" + au_id + "','" + totalbook + "','" + img + "')", con);
            fubookphoto.SaveAs(Server.MapPath(img));
            int convt = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (convt == 0)
            {
                Response.Write("record not inserted");
            }
            else
            {
                Response.Redirect("book.aspx");
            }

            con.Close();

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

        }

        protected void GV_BOOKDATA_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GV_BOOKDATA.EditIndex = -1;
            fngrid();
        }

        protected void GV_BOOKDATA_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow row = GV_BOOKDATA.Rows[e.RowIndex];
            int id = Convert.ToInt32(GV_BOOKDATA.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("delete from tbl_book where Book_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('deleted...')</script>");
            }

           GV_BOOKDATA.EditIndex = -1;
            fngrid();
        }

        protected void GV_BOOKDATA_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_BOOKDATA.EditIndex = e.NewEditIndex;
            fngrid();
        }

        protected void GV_BOOKDATA_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            GridViewRow row = GV_BOOKDATA.Rows[e.RowIndex];
            int id = Convert.ToInt32(GV_BOOKDATA.DataKeys[e.RowIndex].Value);
            string title = (row.Cells[2].Controls[0] as TextBox).Text;
            string category_id = (row.Cells[3].Controls[0] as TextBox).Text;
            string author_id = (row.Cells[4].Controls[0] as TextBox).Text;
            string totalbook = (row.Cells[5].Controls[0] as TextBox).Text;
            string book_photo = (row.Cells[6].Controls[0] as TextBox).Text;

            SqlCommand cmd = new SqlCommand("update tbl_book set Title='" + title + "',category_id='" + category_id + "',author_id='" + author_id + "',Totalbook='" + totalbook + "',book_photo='" + book_photo + "' where Book_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('Updated...')</script>");
            }
            GV_BOOKDATA.EditIndex = -1;
            fngrid();
            con.Close();
        }
    }
}