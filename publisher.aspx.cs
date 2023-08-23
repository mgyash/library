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
    public partial class publisher : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                fngrid();
            }
            con.Close();
        }
        protected void fngrid()
        {
            SqlCommand cmd = new SqlCommand("select * from tbl_publisher", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            sda.Fill(ds);

            gv_publisher.DataSource = ds;
            gv_publisher.DataBind();
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            con.Open();
            String name = txt_publisher_name.Text;
            SqlCommand cmd = new SqlCommand("insert into tbl_publisher(Publisher_name) Values('" + name + "')", con);

            int convt = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (convt == 0)
            {
                Response.Write("record not inserted");
            }
            else
            {
                Response.Redirect("publisher.aspx");
            }
            fngrid();
            con.Close();
            
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

        }

        protected void gv_publisher_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_publisher.EditIndex = -1;
            fngrid();
        }

        protected void gv_publisher_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_publisher.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_publisher.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("delete from tbl_publisher where Publ_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('deleted...')</script>");
            }

            gv_publisher.EditIndex = -1;
            fngrid();
        }

        protected void gv_publisher_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_publisher.EditIndex = e.NewEditIndex;
            fngrid();
        }

        protected void gv_publisher_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_publisher.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_publisher.DataKeys[e.RowIndex].Value);
            string fname = (row.Cells[2].Controls[0] as TextBox).Text;



            SqlCommand cmd = new SqlCommand("update tbl_publisher set Publisher_name='" + fname + "' where Publ_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('Updated...')</script>");
            }
            gv_publisher.EditIndex = -1;
            fngrid();
            con.Close();
        }
    }
}