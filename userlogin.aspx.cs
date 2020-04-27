using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class userlogin : System.Web.UI.Page
    {
        
        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            try
            {
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_tbl WHERE member_id='" + TextBox22.Text.Trim() + "' AND password='"+TextBox23.Text.Trim()+"';", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        
                        if(dr.GetValue(10).ToString()=="Active")
                        {
                            Response.Write("<script>alert('Welcome " + dr.GetValue(0).ToString() + "');</script>");
                            Session["fullname"] = dr.GetValue(0).ToString();
                            Session["username"] = dr.GetValue(8).ToString();
                            Session["role"] = "user";
                        }
                        else
                        {
                            Response.Write("<script>alert('Your account is not yet activated. Please try after some time');</script>");
                        }
                        
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Please enter valid username and password');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}