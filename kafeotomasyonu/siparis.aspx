<%@ Page Title="Sipariş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="siparis.aspx.cs" Inherits="kafeotomasyonu.siparis" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label ID="lbl_giris" runat="server" Text="Label" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
    </div>
    <div style="text-align: center; height: 100%; width: 100%;">
        <table style="width: 100%; height: 100%; margin-left: auto; margin-right: auto; right: auto; bottom: auto; left: auto; top: auto; position: relative; color: #000000;">
            <tr>
                <td style="width: 33%; height: auto">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btn_yiyecek" runat="server" Text="YİYECEK" CssClass="btn btn-default" Width="352px" Height="146px" BackColor="#33CC33" Font-Bold="True" Font-Size="XX-Large" OnClick="btn_yiyecek_Click" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btn_icecek" runat="server" Text="İÇECEK" CssClass="btn btn-default" Width="352px" Height="146px" BackColor="Yellow" Font-Bold="True" Font-Size="XX-Large" OnClick="btn_icecek_Click" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_yiyecek" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_icecek" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>

                </td>
                <td style="width: 33%; height: auto; text-align: center;">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand">
                                <HeaderTemplate>
                                    <table class="nav-justified" style="color: snow">
                                        <tr>
                                            <td style="width: 33%; font-size: x-large; color:black;">Ürün Adı</td>
                                            <td style="width: 33%; font-size: x-large; color:black;">Ürün Fiyatı</td>
                                            <td style="width: 34%; font-size: x-large;">&nbsp</td>
                                        </tr>
                                    </table>
                                    <hr />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="nav-justified" style="color: snow">
                                        <tr>
                                            <td style="width: 33%; text-align: center; font-size: x-large; color: #000000;">
                                                <%# Eval("urun_ad") %>
                                            </td>
                                            <td style="width: 33%; text-align: center; font-size: x-large; color: #000000;">
                                                <%# Eval("urun_fiyat") %>
                                            </td>
                                            <td style="width: 34%; text-align: center;">
                                                <asp:Button ID="btn_add" runat="server" CssClass="btn btn-default" Text="Ekle" CommandName="goster" CommandArgument='<%#Eval("urun_ad")+","+ Eval("urun_fiyat")%> ' />
                                            </td>
                                        </tr>
                                    </table>
                                    <hr />
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_yiyecek" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_icecek" EventName="Click" />

                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width: 34%; height: auto">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lbl_count" CssClass="form-control" runat="server" Text="" BackColor="#CCCCCC" Font-Bold="True" Font-Size="XX-Large" Height="70px" Width="388px"></asp:Label>
                            <br />
                            &nbsp<br />
                            <asp:Button ID="btn7" runat="server" Text="7" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn7_Click" />
                            &nbsp
                                        <asp:Button ID="btn8" runat="server" Text="8" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn8_Click" />
                            &nbsp
                                        <asp:Button ID="btn9" runat="server" Text="9" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn9_Click" />
                            <br />
                            <br />
                            <asp:Button ID="btn4" runat="server" Text="4" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn4_Click" />
                            &nbsp
                                        <asp:Button ID="btn5" runat="server" Text="5" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn5_Click" />
                            &nbsp
                                        <asp:Button ID="btn6" runat="server" Text="6" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn6_Click" />
                            <br />
                            <br />
                            <asp:Button ID="btn1" runat="server" Text="1" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn1_Click" />
                            &nbsp
                                        <asp:Button ID="btn2" runat="server" Text="2" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn2_Click" />
                            &nbsp
                                        <asp:Button ID="btn3" runat="server" Text="3" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn3_Click" />
                            <br />
                            <br />
                            <asp:Button ID="btnc" runat="server" Text="C" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btnc_Click" />
                            &nbsp
                                        <asp:Button ID="btn0" runat="server" Text="0" CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btn0_Click" />
                            &nbsp
                                        <asp:Button ID="btnvirgul" runat="server" Text="," CssClass="btn btn-default" Width="120px" Height="120px" BackColor="#99ccff" Font-Bold="True" Font-Size="XX-Large" OnClick="btnvirgul_Click" />
                            <br />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn7" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn8" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn9" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn1" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn2" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn3" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn4" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn5" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn6" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnc" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn0" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnvirgul" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="width: 33%; height: auto">
                    <br />
                    <br />
                    <asp:Button ID="btn_bosalt" runat="server" Text="Masa Boşalt" CssClass="btn btn-default" Width="352px" Height="146px" BackColor="OrangeRed" Font-Bold="True" Font-Size="XX-Large" OnClick="btn_bosalt_Click" />
                </td>
                <td style="width: 33%; height: auto">
                    <br />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div id="divPrint">
                                <asp:ListBox ID="lb_adisyon" runat="server" Height="75%" Width="100%"></asp:ListBox>

                                <br />
                                <asp:Label ID="lbl_result" runat="server" Text="" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_iptal" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_gir" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width: 34%; height: auto">
                    <br />
                    <br />
                    <asp:Button ID="btn_iptal" runat="server" Text="Geri Al" CssClass="btn btn-default" Width="196px" Height="120px" BackColor="Red" Font-Bold="True" Font-Size="X-Large" OnClick="btn_iptal_Click" />
                    &nbsp
                    <asp:Button ID="btn_gir" runat="server" Text="Adisyon Al" CssClass="btn btn-default" Width="182px" Height="120px" BackColor="Green" Font-Bold="True" Font-Size="X-Large" OnClientClick="javascript:CallPrint('divPrint');" />
                </td>
        </table>
    </div>

    <script lang="javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'left=0,top=0,width=600,height=600,toolbar=0,scrollbars=0,sta¬tus=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
            prtContent.innerHTML = strOldOne;
        }
    </script>

</asp:Content>


