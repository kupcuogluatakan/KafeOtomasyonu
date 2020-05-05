<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs"  Inherits="kafeotomasyonu.home" %>


  
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




       
        <div style="margin-left:150px">
            
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div style="text-align:center; font-size:40px; color:lightcoral" >
                    <asp:Label ID="Label1" CssClass="anasayfayazirengi" runat="server"   Text='<%# Eval("firma_ad") %>' Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Width="300px" Height="300px" CommandName="goster" CommandArgument='<%#Eval("firma_id")%>' ImageAlign="Middle" ImageUrl='<%#Eval("icon")%>' />
               
                     </div>
            </ItemTemplate>
        </asp:DataList>
</div>
        
    

    </asp:Content>
