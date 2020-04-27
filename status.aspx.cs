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
    public partial class status : System.Web.UI.Page
    {

        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

               
        //****************** Buton Events *******************


        // Get button event
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetMemberByID();
        }
        
        // Active button event
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(CheckMemberExists())
            {
                UpdateMemberStatusByID("Active");
                GetMemberByID();
            }
            else
            {
                Response.Write("<script>alert('Member doesn\\'t exists');</script>");
            }

        }

        // Pending button event
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                UpdateMemberStatusByID("Pending");
                GetMemberByID();
            }
            else
            {
                Response.Write("<script>alert('Member doesn\\'t exists');</script>");
            }
        }

        // Deactive button event
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                UpdateMemberStatusByID("Deactive");
                GetMemberByID();
            }
            else
            {
                Response.Write("<script>alert('Member doesn\\'t exists');</script>");
            }
        }

        // Delete button event
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                DeleteMember();

            }
            else
            {
                Response.Write("<script>alert('Member doesn\\'t Exists');</script>");
            }
        }


        //********** User Defined Functions **************

        void GetMemberByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_tbl WHERE member_id='" + TextBox12.Text.Trim() + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox13.Text = dr.GetValue(0).ToString();
                        TextBox5.Text = dr.GetValue(10).ToString();                        
                        TextBox1.Text = dr.GetValue(1).ToString();
                        TextBox2.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                        TextBox3.Text = dr.GetValue(4).ToString();
                        TextBox4.Text = dr.GetValue(5).ToString();
                        TextBox7.Text = dr.GetValue(6).ToString();
                        TextBox8.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Member doesn\\'t exists');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateMemberStatusByID(string status)
        {
            try
            {
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_tbl SET account_status='" + status + "' WHERE member_id='" + TextBox12.Text.Trim() + "'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Account status updated successfully');</script>");            
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void DeleteMember()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM member_tbl WHERE member_id='" + TextBox12.Text.Trim() + "'", conn);


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Member deleted successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        bool CheckMemberExists()
        {
            bool a;
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_tbl WHERE member_id='" + TextBox12.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    a = true;
                }
                else
                {
                    a = false;
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

                a = false;
            }

            return a;
        }

    }
}