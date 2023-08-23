<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="librarymanagementproject.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server"> <center>  Welcome
            <asp:Label ID="lblname" runat="server" ForeColor="Black"></asp:Label>
     &nbsp;!<br />
            <br />
            Here is your data<br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
                <Columns>
                    <asp:BoundField DataField="f_name" HeaderText="First Name" />
                    <asp:BoundField DataField="l_name" HeaderText="Last name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone_no" HeaderText="Contact no" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                </Columns>
            </asp:GridView>
        </center></form>
</asp:Content>
