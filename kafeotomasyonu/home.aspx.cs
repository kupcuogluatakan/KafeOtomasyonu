using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kafeotomasyonu.Models;
using System.Data.SqlClient;
using System.Data;

namespace kafeotomasyonu
{
    public partial class home : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd_getfirma = new SqlCommand();
        public DataTable dt = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["personel_id"] !=null)
                {
                    cmd.Connection = connection;
                    cmd.CommandText = cmd.CommandText = "select * from firmalar,personel where personel.firma_id=firmalar.firma_id and personel.personel_id=" + int.Parse(Session["personel_id"].ToString()) + "";
                    connection.Open();
                    SqlDataReader read = cmd.ExecuteReader();
                    DataList1.DataSource = read;
                    DataList1.DataBind();
                    connection.Close();
                }
                else
                {
                    cmd.Connection = connection;
                    cmd.CommandText = cmd.CommandText = "SELECT * FROM firmalar";
                    connection.Open();
                    SqlDataReader read = cmd.ExecuteReader();
                    DataList1.DataSource = read;
                    DataList1.DataBind();
                    connection.Close();
                }
                
            }

        }   
	
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "goster")
            {
                Session["firma_id"] = e.CommandArgument;
                firma_info.firma_id = int.Parse(Session["firma_id"].ToString());
                Response.Redirect("cafe_detay.aspx");
            }
        }
    

}
}