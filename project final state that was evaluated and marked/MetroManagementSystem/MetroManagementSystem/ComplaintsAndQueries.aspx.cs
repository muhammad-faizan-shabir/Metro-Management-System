using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MetroManagementSystem
{
    public partial class ComplaintsAndQueries : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        bool checkUserExists() //checks if the user exists already
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from ComplaintsAndQueries where UserID = '" + TextBox1.Text.Trim() + "';", con);
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
        void UpdateUserFeedback()
        {
            string query = "UPDATE ComplaintsAndQueries SET queries = @Feedback WHERE UserID = @UserID";
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Feedback", TextBox2.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        void giveFeedback()
        {
            try
            {
                //string strcon = ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO ComplaintsAndQueries (UserID, queries) VALUES (@UserID, @Feedback)", con);
                cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Feedback", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Feedback Submitted');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if((TextBox1.Text.Trim()=="") || (TextBox2.Text.Trim() == "")) 
            {
                return;
            }
            if (checkUserExists())
            {
                Response.Write("<script>alert('User already exists with this User ID so Feedback Updated');</script>");
                
                UpdateUserFeedback();
            }
            else
            {
                giveFeedback();
                //Response.Write("<script>alert ('User complaint successfully inserted)");
            }
        }
    }
}