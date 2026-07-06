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
    public partial class reservations : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // go button click event
        

        //issue book click event
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfTrainExist())
            {
                if (checkCardBalance())
                {
                    
                    reserveTrain();
                    
                }
                else
                {
                    Response.Write("<script>alert('Low card balance, cannot reserve train');</script>");
                    
                }

            }
            else
            {
                Response.Write("<script>alert('Error! Invalid Train ID');</script>");
            }
        }

        // return book click event
        

        // user defined functions

       



        void reserveTrain()
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("reserve", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@member_id", SqlDbType.NVarChar).Value = Session["username"].ToString();
                cmd.Parameters.Add("@train_id", SqlDbType.NVarChar).Value = TextBox4.Text.Trim();
                


                int result = cmd.ExecuteNonQuery();
                
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Train reserved successfully');</script>");
                    

                }
                else
                {
                    Response.Write("<script>alert('Some error occured while reservation');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfTrainExist()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from train_master_tbl where train_id='" + TextBox4.Text.Trim() + "';", con);
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

        bool checkCardBalance()
        {
            try
            {
                int balance = 0;
                int trainPrice = 0;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select  * from member_master_tbl where member_id='" + Session["username"].ToString() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                balance = Convert.ToInt32(dt.Rows[0]["card_balance"].ToString());

                cmd = new SqlCommand("select  * from train_master_tbl where train_id='" + TextBox4.Text.Trim() + "'; ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                trainPrice = Convert.ToInt32(dt.Rows[0]["price"].ToString());

                if (balance >= trainPrice)
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

        

        

        
    }
}