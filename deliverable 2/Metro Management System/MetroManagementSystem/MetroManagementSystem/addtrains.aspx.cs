using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MetroManagementSystem
{
    public partial class addtrains : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            

            GridView1.DataBind();
        }

       


       

        

       

        //user defined functions

       


        

       

        

        bool checkIfTrainExists()
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from train_master_tbl where train_id='" + TextBox3.Text.Trim() + "'", con);

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

        void addNewTrain()
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO train_master_tbl(train_id,from_station,to_station,start_time,end_time,date) values(@train_id,@from_station,@to_station,@start_time,@end_time,@date)", con);

                cmd.Parameters.AddWithValue("@train_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@from_station", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@to_station", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@start_time", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@end_time", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@date", TextBox6.Text.Trim());
                

                cmd.ExecuteNonQuery();
                
                con.Close();
                Response.Write("<script>alert('Train Added Successfully.');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (checkIfTrainExists()) 
            {
                Response.Write("<script>alert('Train Already Exists');</script>");
            }
            else 
            {
                
                addNewTrain();
            }
        }
    }
}