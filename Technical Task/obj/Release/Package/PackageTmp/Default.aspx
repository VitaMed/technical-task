<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Technical_Task._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<link href="select2.css" rel="stylesheet"><style>
table {
  border-collapse: collapse;
  border-radius: 1em;
  overflow: hidden;
}
th, td {
  padding: 1em;
  background: rgba(221, 221, 221, 0.9);
  border-bottom: 2px solid white; 
}

body{
    background-image:url('/Content/background.jpg');
}
.jumbotron{
    background-color:hsla(236, 70%, 96%, 0.7);
}
</style>
    <div class="jumbotron" >
        <div style="display:flex;">
            <div style="margin-right:8%">
                <asp:DropDownList ID ="txtCity"  style="width:150px"
                    AutoPostBack="True"
                    runat="server"/>
                <asp:Button Text="Get Weather Information" runat="server" OnClick="GetWeatherInfo" CssClass="btn btn-default" />
                <hr />
                <table id = "tblWeather" runat = "server"  visible = "false">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblCity_Country" runat="server" />
                            <asp:Image ID="imgCountryFlag" runat="server" />
                        </td>
                        <td rowspan="3">
                            <img src="/Content/weather.jpg" width="100px" height="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblDescription" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Date" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3">
                            <asp:Image ID="imgWeatherIcon" runat="server" />
                        </td>
                        <td style="padding-right:10px">
                            tmp: 
                            <asp:Label ID="lblTemperature" runat="server" />
                        </td>
                         <td>
                            Humidity:<asp:Label ID="lblHumidity" runat="server" />%
                        </td>
                     </tr>
                    <tr>
                        <td>
                            min:  
                            <asp:Label ID="lblTempMin" runat="server" />
                        </td>
                        <td>                    
                            Wind: <asp:Label ID="WindTxt" runat="server" />km/h
                        </td> 
                    </tr>
                    <tr>
                        <td>
                          max: 
                            <asp:Label ID="lblTempMax" runat="server" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div >
                <asp:Button ID="btnRate" runat="server"  Text="Show Rate" OnClick = "ShowRate" CssClass="btn btn-default" />
                <asp:Button ID="SendEmail" runat="server"  Text="Send to E-mail" OnClick = "SendtoEmail" CssClass="btn btn-default" />

                <hr />
                <table id = "tblRate" runat = "server" style="border:ridge;" cellpadding="0" cellspacing="0" visible = "false">
                    <tr>
                        <th colspan = "2" style="text-align:center; border:ridge; ">
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
        </div>
        <hr />
        
   
   
        
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="select2.js"></script>
    <script>
        $(function () {
            $("#<%=txtCity.ClientID%>").select2();
        })
    </script>
</asp:Content>
