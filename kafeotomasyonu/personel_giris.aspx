<%@ Page Title="Personel Giriş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="personel_giris.aspx.cs" Inherits="kafeotomasyonu._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div style="background-color: lightgray; margin-left: 500px; width: 100%; height: 100%;">


        <h1 style="text-align: center">Personel Giriş</h1>


        <div style="text-align: center">
            <img src="images/personel_giriss.png" />
        </div>

        <div class="form-horizontal">



            <div class="form-group" style="margin-left: 17%">

                <asp:Label runat="server" CssClass="col-md-2 control-label">Kullanıcı Adı</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="tbUserName" CssClass="form-control" required />
                </div>
            </div>

            <div class="form-group" style="margin-left: 17%">
                <asp:Label runat="server" CssClass="col-md-2 control-label">Şifre</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="tbUserPassword" CssClass="form-control" TextMode="Password" required />
                </div>
            </div>

            <div class="form-group" style="margin-left: 30%">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Oturum Aç" CssClass="btn btn-default" OnClick="Unnamed3_Click" />
                </div>
            </div>



        </div>

    </div>
</asp:Content>
