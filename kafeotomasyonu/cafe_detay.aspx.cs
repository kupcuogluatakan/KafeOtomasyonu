using kafeotomasyonu.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kafeotomasyonu
{
    public partial class cafe_detay : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd_getfirma = new SqlCommand();
        SqlCommand cmdfree = new SqlCommand();
        public DataTable dt = new DataTable();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cmd_getfirma.Connection = connection;
                cmd_getfirma.CommandText = "select firma_ad, kroki, firma_adres from firmalar where firma_id=" + int.Parse(Session["firma_id"].ToString()) + "";
                connection.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd_getfirma);
                da.Fill(dt);
                Label1.Text = dt.Rows[0]["firma_ad"].ToString();
                Image1.ImageUrl = "images/" + dt.Rows[0]["kroki"].ToString();
                Label2.Text = "Adres: " + dt.Rows[0]["firma_adres"].ToString();
                connection.Close();
                cmd.Connection = connection;
                cmd.CommandText = cmd.CommandText = "SELECT * FROM masalar,firmalar  where firmalar.firma_id=" + int.Parse(Session["firma_id"].ToString()) + " and masalar.firma_id=" + int.Parse(Session["firma_id"].ToString()) + "";
                connection.Open();

                SqlDataReader read = cmd.ExecuteReader();
                DataList1.DataSource = read;
                DataList1.DataBind();
                connection.Close();
                if (Session["personel_id"] != null)
                {
                    ImageButton1.Visible = false;
                    ImageButton2.Visible = true;
                }
                else
                {
                    ImageButton1.Visible = true;
                    ImageButton2.Visible = false;
                }
                 

            }


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("personel_giris.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "goster")
            {
                if (Session["personel_id"] != null)
                {
                    masa_info.masa_no = int.Parse(e.CommandArgument.ToString());
                    try
                    {
                        connection.Open();
                        cmdfree.Connection = connection;
                        cmdfree.CommandText = "UPDATE masalar SET masa_durum = 'red' where masa_no=" + masa_info.masa_no + " and firma_id=" + firma_info.firma_id + "";
                        cmdfree.ExecuteNonQuery();
                        connection.Close();
                    }
                    catch (Exception ex)
                    {


                    }
                    Response.Redirect("siparis.aspx");
                }
                else
                {

                }

            }
        }

        protected void geridon_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("home.aspx");
        }
    }
}