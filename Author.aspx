﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="librarymanagementproject.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>

        <br />
        <asp:Label ID="LBL_AUTHOR" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text=" AUTHOR DATA " Font-Size="X-Large"></asp:Label>

        <br />

        <br />
        <asp:GridView ID="gv_author" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="author_Id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="author_Id" HeaderText="Author ID" SortExpression="author_Id" />
                <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
            </Columns>
        </asp:GridView>
        <br />
       <asp:Label ID="lbl_authorinsert" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text="AUTHOR INSERT" Font-Size="X-Large"></asp:Label>

        <br />
        <br />
       <table style="width:100%;">
           <tr>
               <td style="height: 20px">
                   <asp:Label ID="lbl_authorname" runat="server" Text="Author Name"></asp:Label>
               </td>
               <td style="height: 20px">
                   <asp:TextBox ID="txt_author_name" runat="server" Width="530px"></asp:TextBox>
               </td>
               <td style="height: 20px">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_author_name" ErrorMessage="Please enter the author name" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td colspan="3"><center>

                               <asp:Button ID="btn_reset" runat="server"  Text="Reset" OnClick="btn_reset_Click" />

                               &nbsp;
                               <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" ValidationGroup="a" />

                               </center>&nbsp;</td>
           </tr>
       </table>

        <br />

    </center>
</asp:Content>
