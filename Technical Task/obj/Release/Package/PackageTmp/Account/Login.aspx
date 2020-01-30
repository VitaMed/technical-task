<%@ Page Title="Выполнить вход" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Technical_Task.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="select2.css" rel="stylesheet">

    <h2>Send Information</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">E-mail</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="Email field is required.     " />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="Email" ErrorMessage="   Please enter correct email" CssClass="text-danger"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Number" CssClass="col-md-2 control-label">Number</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Number" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Number" CssClass="text-danger" ErrorMessage="Phone field is required." />
                            
                         </div>
                    </div>
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Name"  CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="text-danger" ErrorMessage="Name field is required. " />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="text-danger"
                                ControlToValidate="Name" ErrorMessage="Please enter correct name" 
                                ValidationExpression="^[a-zA-Z а-яА-Я]*$"></asp:RegularExpressionValidator>
                        
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtCity" CssClass="col-md-2 control-label">City</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID ="txtCity"  style="width:150px"
                    AutoPostBack="True"
                    runat="server"/>
                         </div>             
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Send" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                       <asp:label id="Label1" runat="server" text="" />

                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="select2.js"></script>
    <script src="jquery.maskedinput.js"></script>


    <script>
        $(function () {
            $("#<%=txtCity.ClientID%>").select2();
        })
        $(function () {
            //2. Получить элемент, к которому необходимо добавить маску
            $("#<%=Number.ClientID%>").mask("+38 (099) 999-9999");
        });
    </script>
</asp:Content>
