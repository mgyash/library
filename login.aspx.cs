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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\project library\librarymanagementproject\App_Data\librarymanagement.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            con.Open();
            if (txt1_emial.Text == "admin" && txt_pswd.Text == "admin")
            {
                Session["user"] = "admin";
                Response.Redirect("adminpage1.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Select * from  tbl_user where email = '" + txt1_emial.Text + "' and Password = '" + txt_pswd.Text + "'", con);
                int convt = Convert.ToInt16(cmd.ExecuteScalar());
               
                if (convt == 0)
                {
                    Response.Write("Login Not Valid");
                }
                else
                {
                    
                    Session["email"] = txt1_emial.Text.ToString();
                    //Session["pswd"] = txt_pswd.Text.ToString();
                    Response.Redirect("home.aspx");

                }
            }
            con.Close();
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt1_emial.Text = "";
            txt_pswd.Text = "";
        }

    }
}