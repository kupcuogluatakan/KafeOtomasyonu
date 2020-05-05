using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kafeotomasyonu.Models;
using System.Drawing;
using System.IO;
using System.Drawing.Printing;

namespace kafeotomasyonu
{
    public partial class siparis : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmdfree = new SqlCommand();
        DataTable dt = new DataTable();
        private StringReader myReader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                masa_info.masa_toplam = 0;
            }
            lbl_giris.Text = masa_info.masa_no.ToString() + " numaralı masa için sipariş giriliyor.";
        }

        protected void btn7_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "7";
        }

        protected void btn8_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "8";
        }

        protected void btn9_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "9";
        }

        protected void btn4_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "4";
        }

        protected void btn5_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "5";
        }

        protected void btn6_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "6";
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "1";
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "2";
        }

        protected void btn3_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "3";
        }

        protected void btnc_Click(object sender, EventArgs e)
        {
            lbl_count.Text = "";
        }

        protected void btn0_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + "0";
        }

        protected void btnvirgul_Click(object sender, EventArgs e)
        {
            lbl_count.Text = lbl_count.Text + ",";
        }

        protected void btn_yiyecek_Click(object sender, EventArgs e)
        {
            cmd.Connection = connection;
            cmd.CommandText = "select urun_ad, urun_fiyat from urunler where kategori_id= 1";
            connection.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            SqlDataReader read = cmd.ExecuteReader();
            DataList1.DataSource = read;
            DataList1.DataBind();
            connection.Close();
        }

        protected void btn_icecek_Click(object sender, EventArgs e)
        {
            cmd.Connection = connection;
            cmd.CommandText = "select urun_ad, urun_fiyat from urunler where kategori_id= 2";
            connection.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            SqlDataReader read = cmd.ExecuteReader();
            DataList1.DataSource = read;
            DataList1.DataBind();
            connection.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "goster")
            {
                int miktar = 1;
                if (lbl_count.Text == "")
                {

                }
                else
                {
                    miktar = int.Parse(lbl_count.Text);
                }
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string urun_ad = commandArgs[0];
                int urun_fiyat = int.Parse(commandArgs[1]);
                int toplam_fiyat = miktar * urun_fiyat;
                masa_info.masa_toplam = masa_info.masa_toplam + toplam_fiyat;
                lb_adisyon.Items.Add(urun_ad + " " + urun_fiyat.ToString() + " TL X " + miktar.ToString() + " =" + toplam_fiyat.ToString() + " TL");
                lbl_result.Text = "Toplam: " + masa_info.masa_toplam.ToString() + " TL";
                lbl_count.Text = "";
            }
        }

        protected void btn_iptal_Click(object sender, EventArgs e)
        {
            try
            {
                string str = "";
                string[] commandArgs = lb_adisyon.SelectedItem.Text.ToString().Split(new char[] { '=' });
                string spel = commandArgs[1].Substring(0, 3);
                System.Text.RegularExpressions.MatchCollection mtchs = System.Text.RegularExpressions.Regex.Matches(spel, @"\d+");
                foreach (System.Text.RegularExpressions.Match x in mtchs)
                {
                    str = str + x.Value;
                }
                int deger = int.Parse(str);
                masa_info.masa_toplam = masa_info.masa_toplam - deger;
                lb_adisyon.Items.Remove(lb_adisyon.SelectedItem);
                lbl_result.Text = "Toplam: " + masa_info.masa_toplam.ToString() + " TL";
            }
            catch (Exception ex)
            {


            }

        }

        protected void btn_gir_Click(object sender, EventArgs e)
        {
           
        }


        protected void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs ev)
        {
            Response.Redirect("cafe_detay.aspx");

            float linesPerPage = 0;
            float yPosition = 0;
            int count = 0;
            
            float leftMargin = ev.MarginBounds.Left;
            float topMargin = ev.MarginBounds.Top;
            string line = null;
            Font printFont = new Font("Arial", 12, FontStyle.Bold);
            SolidBrush myBrush = new SolidBrush(Color.Black);
            linesPerPage = ev.MarginBounds.Height / printFont.GetHeight(ev.Graphics);
            while (count < linesPerPage && ((line = myReader.ReadLine()) != null))
            {
                yPosition = topMargin + (count * printFont.GetHeight(ev.Graphics));
                ev.Graphics.DrawString(line, printFont, myBrush, leftMargin, yPosition, new StringFormat());
                count++;
            }
            if (line != null)
                ev.HasMorePages = true;
            else
                ev.HasMorePages = false;

            myBrush.Dispose();
        }

        protected void btn_bosalt_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                cmdfree.Connection = connection;
                cmdfree.CommandText = "UPDATE masalar SET masa_durum = 'green' where masa_no=" + masa_info.masa_no + " and firma_id=" + firma_info.firma_id + "";
                cmdfree.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {

                
            }
            Response.Redirect("cafe_detay.aspx");

        }
    }
    

}