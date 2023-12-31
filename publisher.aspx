﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="publisher.aspx.cs" Inherits="librarymanagementproject.publisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>

        <br />
        <asp:Label ID="lbl_publisherdata" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Font-Size="X-Large" Text="PUBLISHER DATA"></asp:Label>

        <br />
        <br />
        <asp:GridView ID="gv_publisher" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="Publ_id" OnRowCancelingEdit="gv_publisher_RowCancelingEdit" OnRowDeleting="gv_publisher_RowDeleting" OnRowEditing="gv_publisher_RowEditing" OnRowUpdating="gv_publisher_RowUpdating" >
            <Columns>
                <asp:BoundField DataField="Publ_id" HeaderText="publisher ID" SortExpression="Publ_id" />
                <asp:BoundField DataField="Publisher_name" HeaderText="Publisher Name" SortExpression="Publisher_name" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lbl_publisherdatainsert" runat="server" BorderColor="Black" BorderStyle="Groove" ForeColor="Lime" Font-Size="X-Large" Text="PUBLISHER DATA INSERT"></asp:Label>

        <br />
        <br />
       <table style="width:100%;">
           <tr>
               <td style="height: 20px">
                   <asp:Label ID="lbl_publishername" runat="server" Text="Publisher Name"></asp:Label>
               </td>
               <td style="height: 20px; width: 761px;">
                   <asp:TextBox ID="txt_publisher_name" runat="server" Width="530px"></asp:TextBox>
               </td>
               <td style="height: 20px">
                   <asp:RequiredFieldValidator ID="rfvdatainsert" runat="server" ControlToValidate="txt_publisher_name" ErrorMessage="Please enter the publisher name" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td colspan="3"><center>

                               <asp:Button ID="btn_reset" runat="server"  Text="Reset" OnClick="btn_reset_Click" />

                               &nbsp;
                               <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" ValidationGroup="a" style="height: 26px" />

                               </center>&nbsp;</td>
           </tr>
       </table>

        <br />

    </center>
</asp:Content>
