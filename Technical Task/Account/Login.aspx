<%@ Page Title="Выполнить вход" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Technical_Task.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
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
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger"
                                ControlToValidate="Number" ErrorMessage="Please enter correct number" 
                                ValidationExpression="((\+)?\b(\d{2})?(0[\d]{2}))([\d-]{5,8})([\d]{2})"></asp:RegularExpressionValidator>
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
                        <asp:Label runat="server" AssociatedControlID="City" CssClass="col-md-2 control-label">City</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="City"  CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="City" CssClass="text-danger" ErrorMessage="City   field   is   required.             " Font-Underline="False" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger"
                                ControlToValidate="City" ErrorMessage="   Please enter correct city" 
                                ValidationExpression="^[a-zA-Z а-яА-Я]*$"></asp:RegularExpressionValidator>
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
</asp:Content>
