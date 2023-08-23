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
    public partial class adminpage1 : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from tbl_user", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            sda.Fill(ds);

            gv_user.DataSource = ds;
            gv_user.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_user.EditIndex = -1;
            fngrid();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_user.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_user.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = con.CreateCommand();
            cmd = new SqlCommand("delete from tbl_user where user_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('deleted...')</script>");
            }

            gv_user.EditIndex = -1;
            fngrid();
           
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_user.EditIndex = e.NewEditIndex;
            fngrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            GridViewRow row = gv_user.Rows[e.RowIndex];
            int id = Convert.ToInt32(gv_user.DataKeys[e.RowIndex].Value);
            string fname = (row.Cells[2].Controls[0] as TextBox).Text;
            string lname = (row.Cells[3].Controls[0] as TextBox).Text;
            string email = (row.Cells[4].Controls[0] as TextBox).Text;
            string phoneno = (row.Cells[5].Controls[0] as TextBox).Text;
            string password = (row.Cells[6].Controls[0] as TextBox).Text;


            SqlCommand cmd = new SqlCommand("update tbl_user set f_name='" + fname + "',l_name='" + lname + "',email='" + email + "',phone_no='" + phoneno + "',password='" + password + "' where user_id=" + id, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('Updated...')</script>");
            }
            gv_user.EditIndex = -1;
            fngrid();
            con.Close();
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("login.aspx");

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            con.Open();
            String f_name = txt_fname.Text;
            String l_name = txt_lname.Text;
            String email = txt1_emial.Text;
            String phone = txt_pno.Text;
            String pswd = txt_pswd.Text;

            SqlCommand cmd = new SqlCommand("insert into tbl_user(f_name,l_name,email,phone_no,password) Values('" + f_name + "','" + l_name + "','" + email + "','" + phone + "','" + pswd + "')", con);

            int convt = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (convt == 0)
            {
                Response.Write("record not inserted");
            }
            else
            {
                Response.Redirect("adminpage1.aspx");
            }

            con.Close();
            fngrid();
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_fname.Text = "";
            txt_lname.Text = "";
            txt1_emial.Text = "";
            txt_pno.Text = "";
            txt_pswd.Text = "";
            txtc_pswd.Text = "";
        }
    }
}