<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Technical_Task.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
body{
    background-image:url('/Content/background.jpg');
}
</style>
    <h2><%: Title %>.</h2>
    <h3>This is an application that show the Weather and the Currency Rate.</h3>
</asp:Content>
