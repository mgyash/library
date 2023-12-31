﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="librarymanagementproject.book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>

        <br />
        <asp:Label ID="lbl_bookinsert0" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text="BOOK DATA" Font-Size="XX-Large"></asp:Label>

        <br />

        <br />
        <asp:GridView ID="GV_BOOKDATA" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_id" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowCancelingEdit="GV_BOOKDATA_RowCancelingEdit" OnRowDeleting="GV_BOOKDATA_RowDeleting" OnRowEditing="GV_BOOKDATA_RowEditing" OnRowUpdating="GV_BOOKDATA_RowUpdating">
            <Columns>
                <asp:BoundField DataField="Book_id" HeaderText="Book Id" SortExpression="Book_id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="category_id" HeaderText="category id" SortExpression="category_id" />
                <asp:BoundField DataField="author_id" HeaderText="author id" SortExpression="author_id" />
                <asp:BoundField DataField="totalbook" HeaderText="Total book" SortExpression="totalbook" />
                <asp:ImageField DataImageUrlField="book_photo" ControlStyle-Height="100px" ControlStyle-Width="70px" HeaderText="book photo">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="lbl_bookinsert" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text="BOOK INSERT" Font-Size="XX-Large"></asp:Label>

        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="lbl_tile" runat="server" Text="Title"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="t_box_title" runat="server" Width="530px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_title" runat="server" ControlToValidate="t_box_title" ErrorMessage="Please Enter the title" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <asp:Label ID="lbl_category_id" runat="server" Text="Category Id"></asp:Label>
                </td>
                <td style="height: 22px">
                    <asp:DropDownList ID="ddlcategory_id" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td style="height: 22px"></td>
            </tr>
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="lbl_author_id" runat="server" Text="author id"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:DropDownList ID="ddlauthor_id" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="lbl_total_book" runat="server" Text="total_book"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:TextBox ID="t_box_totalbook" runat="server" Width="530px"></asp:TextBox>
                </td>
                <td style="height: 20px">
                    <asp:RequiredFieldValidator ID="rfv_total_book" runat="server" ControlToValidate="t_box_totalbook" ErrorMessage="Please Enter the total no of book" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="lbl_bookphoto" runat="server" Text="Book Photo"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:FileUpload ID="fubookphoto" runat="server" />
                </td>
                <td style="height: 20px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 20px; margin-left: 40px">
                    <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" Text="Reset" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" />
                </td>
            </tr>
        </table>

    </center>
</asp:Content>
