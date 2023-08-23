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
    public partial class home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\project library\librarymanagementproject\App_Data\librarymanagement.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["email"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("select * from tbl_user where email='"+ Session["email"].ToString()+ "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable ds = new DataTable();
                    sda.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
               
            }
           
        }
    }
}