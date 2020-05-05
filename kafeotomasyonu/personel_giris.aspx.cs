using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kafeotomasyonu.Models;

namespace kafeotomasyonu
{
    public partial class _Default : Page
    {

        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd_getuser = new SqlCommand();
        public DataTable dt = new DataTable();
        public user_info user = new user_info();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                cmd.Connection = connection;
                cmd.CommandText = cmd.CommandText = "SELECT * FROM personel_view WHERE kullanici_adi LIKE '" + tbUserName.Text.ToString() + "'AND sifre LIKE '" + tbUserPassword.Text.ToString() + "'";
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();
                if (read.Read())
                {
                    connection.Close();
                    connection.Open();
                    cmd_getuser.Connection = connection;
                    cmd_getuser.CommandText = "SELECT * FROM personel_view WHERE kullanici_adi LIKE '" + tbUserName.Text.ToString() + "'AND sifre LIKE '" + tbUserPassword.Text.ToString() + "'";
                    SqlDataAdapter da = new SqlDataAdapter(cmd_getuser);
                    da.Fill(dt);
                    user.personel_id = dt.Rows[0]["personel_id"].ToString();
                    user.rol = dt.Rows[0]["rol"].ToString();
                    user.personel_ad = dt.Rows[0]["personel_ad"].ToString();
                    user.personel_soyad = dt.Rows[0]["personel_soyad"].ToString();
                    user.firma_ad = dt.Rows[0]["firma_ad"].ToString();
                    user.kullanici_adi = dt.Rows[0]["kullanici_adi"].ToString();
                    user.sifre = dt.Rows[0]["sifre"].ToString();
                    connection.Close();
                    Session["personel_id"] = user.personel_id.ToString();
                    Session["rol"] = user.rol.ToString();
                    Session["personel_ad"] = user.personel_ad.ToString();
                    Session["personel_soyad"] = user.personel_soyad.ToString();
                    Session["firma_ad"] = user.firma_ad.ToString();
                    Session["kullanici_adi"] = user.kullanici_adi.ToString();
                    Session["sifre"] = user.personel_id.ToString();
                    Response.Redirect("home.aspx");


                }

                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kullanıcı Adı veya Şifre Hatalı');</script>");
                }



            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");

            }
        }


    }
}
