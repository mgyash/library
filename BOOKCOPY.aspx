﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BOOKCOPY.aspx.cs" Inherits="librarymanagementproject.BOOKCOPY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>

        <br />
        <asp:Label ID="lbl_bookdata" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text="BOOK COPY DATA" Font-Size="XX-Large"></asp:Label>

        <br />
        <br />
        <asp:GridView ID="gv_bookcopy" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="bookcopy_id" OnRowCancelingEdit="gv_bookcopy_RowCancelingEdit" OnRowDeleting="gv_bookcopy_RowDeleting" OnRowEditing="gv_bookcopy_RowEditing" OnRowUpdating="gv_bookcopy_RowUpdating">
            <Columns>
                <asp:BoundField DataField="bookcopy_id" HeaderText="Book copy ID" SortExpression="bookcopy_id" />
                <asp:BoundField DataField="year_publisher" HeaderText="year of publishing" SortExpression="year_publisher" />
                <asp:BoundField DataField="book_id" HeaderText="book Id" />
                <asp:BoundField DataField="publisher_id" HeaderText="publisher Id" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        3<asp:Label ID="lbl_bookcopyinsert" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Text="BOOK COPY DATA INSERT" Font-Size="XX-Large"></asp:Label>

        <br />
        <br />
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lbl_yearpublisher" runat="server" Text="year of publisher"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txt_yearpublisher" runat="server" Width="530px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_fn" runat="server" ControlToValidate="txt_yearpublisher" ErrorMessage="Please fill the year of publisher" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="height: 20px">
                    <asp:Label ID="lbl_bookid" runat="server" Text="book id"></asp:Label>
                </td>
                <td class="auto-style2" style="height: 20px">
                    <asp:DropDownList ID="ddl_book_id" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="height: 22px">
                    <asp:Label ID="lbl_publisherid" runat="server" Text="publisher id"></asp:Label>
                </td>
                <td class="auto-style2" style="height: 22px">
                    <asp:DropDownList ID="ddl_publisherid" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="height: 22px">
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" Text="Reset" />
&nbsp;
                    <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" />
                </td>
            </tr>
        </table>

    </center>
    <br />
</asp:Content>
