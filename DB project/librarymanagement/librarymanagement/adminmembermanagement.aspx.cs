using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace librarymanagement
{
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Go(tick) button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        // Active button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }


        // Pending button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        // deactive button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }

        // delete button
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        // user defined function

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox3.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }

        void deleteMemberByID() 
        {
            if (checkIfMemberExists()) 
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id='" + TextBox3.Text.Trim() + "' ", con);




                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Successfully.');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else 
            {
                
                Response.Write("<script>alert('Invalid Member ID');</script>");

            }

        }

        void getMemberByID()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='" + TextBox3.Text.Trim() + "' ", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    { 
                        TextBox4.Text= dr.GetValue(0).ToString(); // full name
                        TextBox7.Text = dr.GetValue(10).ToString(); // acount status
                        TextBox11.Text = dr.GetValue(1).ToString(); // dob
                        TextBox1.Text = dr.GetValue(2).ToString(); // contact no
                        TextBox2.Text = dr.GetValue(3).ToString(); // email
                        TextBox8.Text = dr.GetValue(4).ToString(); // state
                        TextBox9.Text = dr.GetValue(5).ToString(); // city
                        TextBox10.Text = dr.GetValue(6).ToString(); // pin code
                        TextBox6.Text = dr.GetValue(7).ToString(); // address


                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }

        }

        void updateMemberStatusByID(string status) 
        {
            if (checkIfMemberExists()) 
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + TextBox3.Text.Trim() + "'  ", con);

                    cmd.ExecuteReader();
                    con.Close();

                    Response.Write("<script>alert('Member Status Updated');</script>");
                    GridView1.DataBind();




                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else 
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
            

        }

        void clearForm() 
        {

            TextBox3.Text = ""; // member id
            TextBox4.Text = ""; // full name
            TextBox7.Text = ""; // acount status
            TextBox11.Text = ""; // dob
            TextBox1.Text = ""; // contact no
            TextBox2.Text = ""; // email
            TextBox8.Text = ""; // state
            TextBox9.Text = ""; // city
            TextBox10.Text = ""; // pin code
            TextBox6.Text = ""; // address
        }
    }
}