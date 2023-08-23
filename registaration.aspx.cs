using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace librarymanagementproject
{
    public partial class registaration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\project library\librarymanagementproject\App_Data\librarymanagement.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                
            }
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

            int convt = Convert.ToInt16(cmd.ExecuteNonQuery() );
            if (convt == 0)
            {
                Response.Write("record not inserted");
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            con.Close();

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