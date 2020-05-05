<%@ Page Title="Cafe Detay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cafe_detay.aspx.cs" Inherits="kafeotomasyonu.cafe_detay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: left;">
        <asp:ImageButton ID="geridon" runat="server" ImageUrl="~/images/geridon.png" AlternateText="Cafelere Geri Dön" Width="500px" Height="200px" OnClick="geridon_Click" />
    </div>
    <div style="color: white; font-size: 50px; width: 100%">

        <table class="nav-justified" style="width: 100%; height: 700px; border: double; text-align: center;">
            <tr style="border: double;">
                <td style="height: 100px; width: 774px; border: double;">



                    <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Label" Font-Bold="True"></asp:Label>



                </td>
                <td style="height: 101px;">
                    <div style="text-align: right">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Height="179px" ImageUrl="~/images/login.png" Width="162px" />
                        <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" Height="179px" ImageUrl="~/images/logout.png" Width="162px" />

                    </div>


                </td>
            </tr>
            <tr style="border: double;">
                <td style="height: 495px; width: 774px; border: double;">
                    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" Height="30px" RepeatColumns="6" RepeatDirection="Horizontal" Width="30px" Font-Bold="True">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                        <ItemTemplate>


                            <asp:Button ID="Button1" runat="server" CommandName="goster" CommandArgument='<%#Eval("masa_no")%>' Width="150px" Height="150px" Text='<%#Eval("masa_no")%>' ImageAlign="Middle" BackColor='<%# System.Drawing.Color.FromName(Eval("masa_durum").ToString()) %>' />
                        </ItemTemplate>
                    </asp:DataList>
                </td>


                <td style="height: 495px; text-align: center;">
                    <asp:Image ID="Image1" runat="server" Height="1000px" ImageAlign="Middle" Width="700px" />
                </td>
            </tr>

            <tr style="border: double;">
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" ForeColor="Black"></asp:Label>
                </td>
            </tr>
        </table>

    </div>


</asp:Content>
