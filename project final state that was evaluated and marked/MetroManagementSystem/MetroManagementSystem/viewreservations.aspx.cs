using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace MetroManagementSystem
{
    public partial class viewreservations : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //getReservations();
           // GridView1.DataBind();
        }

        /*DataTable dt = new DataTable();
        void getReservations() 
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //SqlCommand cmd = new SqlCommand("SELECT * from reservations where member_id='" + Session["username"].ToString() + "';", con);
                SqlCommand cmd = new SqlCommand("SELECT r.train_id,from_station,to_station,start_time,end_time,date,price FROM [reservations] as r inner join train_master_tbl as t on r.train_id=t.train_id and member_id='" + Session["username"].ToString() + "'; ", con);
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                
                da.Fill(dt);
                



                GridView1.DataSource = dt;
                GridView1.DataBind();
                //while (true) 
                //{
                //}


                Response.Write("<script>alert('here');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }*/
    }
}