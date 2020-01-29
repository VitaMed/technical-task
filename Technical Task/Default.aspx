<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Technical_Task._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" >
            <asp:TextBox ID="txtCity" runat="server" Text="Mumbai" />
            <asp:Button Text="Get Weather Information" runat="server" OnClick="GetWeatherInfo" CssClass="btn btn-default" />
        
        <hr />
        <table id = "tblWeather" runat = "server" style="border:ridge; padding:3px" cellpadding="0" cellspacing="0" visible = "false">
            <tr>
                <th colspan = "2" style="text-align:center; padding:3px; border:ridge; ">
                    Weather Information
                </th>
            </tr>
            <tr>
                <td rowspan="3" style="border:ridge;">
                    <asp:Image ID="imgWeatherIcon" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="border:ridge;padding:3px">
                    <asp:Label ID="lblCity_Country" runat="server" />
                    <asp:Image ID="imgCountryFlag" runat="server" />
                    <asp:Label ID="lblDescription" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding:3px">
                    Temperature:
                    <asp:Label ID="lblTemperature" runat="server" />
                    (Min:
                    <asp:Label ID="lblTempMin" runat="server" />
                    Max:
                    <asp:Label ID="lblTempMax" runat="server" />) Humidity:
                    <asp:Label ID="lblHumidity" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div class="jumbotron">
        <asp:Button ID="btnRate" runat="server" Text="Show Rate" OnClick = "ShowRate" CssClass="btn btn-default" />
        <hr />
        <table id = "tblRate" runat = "server" style="border:ridge; padding:3px" cellpadding="0" cellspacing="0" visible = "false">
            <tr>
                <th colspan = "2" style="text-align:center; padding:3px; border:ridge; ">
                    Currency Rate
                </th>
            </tr>
            <tr>
                <td>USD - GBP</td>
                <td><asp:Label ID ="GBP" runat = "server"/></td>
            </tr>
            <tr>
                <td>USD - CAD</td>
                <td><asp:Label ID ="CAD" runat = "server"/></td>
            </tr>
            <tr>
                <td>USD - PLN</td>
                <td><asp:Label ID ="PLN" runat = "server"/></td>
            </tr>
            <tr>
                <td>USD - EUR</td>
                <td><asp:Label ID ="EUR" runat = "server"/></td>
            </tr>
        </table>
        
    </div>

</asp:Content>
