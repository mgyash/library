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
    public partial class BOOKCOPY : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from tbl_book", con);


                ddl_book_id.DataSource = cmd.ExecuteReader();
                ddl_book_id.DataTextField = "Title";
                ddl_book_id.DataValueField = "Book_id";
                ddl_book_id.DataBind();
                con.Close();
                fngrid();

            }
            con.Close();

            con.Open();
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select * from tbl_publisher", con);


                ddl_publisherid.DataSource = cmd.ExecuteReader();
               ddl_publisherid.DataTextField = "Publisher_name";
                ddl_publisherid.DataValueField = "Publ_id";
                ddl_publisherid.DataBind();
            }
            con.Close();

        }
        protected void fngrid()
        {
            SqlCommand cmd = new SqlCommand("select * from tbl_book_copy", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            sda.Fill(ds);

            gv_bookcopy.DataSource = ds;
           gv_bookcopy.DataBind();
        }


        protected void btn_submit_Click(object sender, EventArgs e)
        {
            con.Open();
            String title = txt_yearpublisher.Text;
            String book_id = ddl_book_id.SelectedValue;
            String publ_id = ddl_publisherid.SelectedValue;
            
            SqlCommand cmd = new SqlCommand("insert into tbl_book_copy(year_publisher,book_id,publisher_id) Values('" + title + "','" + book_id + "','" + publ_id + "')", con);
            
            int convt = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (convt == 0)
            {
                Response.Write("record not inserted");
            }
            else
            {
                Response.Redirect("BOOKCOPY.aspx");
            }

            con.Close();
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

        }

        protected void gv_bookcopy_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_bookcopy.EditIndex = -1;
            fngrid();
        }

        protected void gv_bookcopy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_bookcopy.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_bookcopy.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("delete from tbl_book_copy where bookcopy_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('deleted...')</script>");
            }

            gv_bookcopy.EditIndex = -1;
            fngrid();
        }

        protected void gv_bookcopy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_bookcopy.EditIndex = e.NewEditIndex;
            fngrid();
        }

        protected void gv_bookcopy_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_bookcopy.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_bookcopy.DataKeys[e.RowIndex].Value);
            string year= (row.Cells[2].Controls[0] as TextBox).Text;
            string book_id = (row.Cells[3].Controls[0] as TextBox).Text;
            string Publisher_id = (row.Cells[4].Controls[0] as TextBox).Text;
            

            SqlCommand cmd = new SqlCommand("update tbl_book_copy set year_publisher='" + year + "',book_id='" + book_id + "',publisher_id='" + Publisher_id + "' where bookcopy_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('Updated...')</script>");
            }
            gv_bookcopy.EditIndex = -1;
            fngrid();
            con.Close();
        }
    }
}