<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registaration.aspx.cs" EnableEventValidation="false" Inherits="librarymanagementproject.registaration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="padding: 25px 25px 25px 25px">
        <div class="row">x
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="img/user12.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Regisatration</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <center>
                            <div class="row">
                                <br />
                               <form>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_fname" runat="server" Text="First Name"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txt_fname" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfv_fn" runat="server" ControlToValidate="txt_fname" ErrorMessage="Please fill the first name" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_lname" runat="server" Text="Last Name"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txt_lname" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfv_ln" runat="server" ControlToValidate="txt_lname" ErrorMessage="Please enter the last name" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_email" runat="server" Text="Email"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txt1_emial" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RegularExpressionValidator ID="rev_emial" runat="server" ControlToValidate="txt1_emial" ErrorMessage="Enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="a"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_PHno" runat="server" Text="Phone no"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txt_pno" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfv_pno" runat="server" ControlToValidate="txt_pno" ErrorMessage="Enter the Phone no" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_pswd" runat="server" Text="Password"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txt_pswd" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfv_pswd" runat="server" ControlToValidate="txt_pswd" ErrorMessage="Enter the password" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="lbl_cpswd" runat="server" Text="Confirm Password"></asp:Label>
                                            </td>
                                            <td class="auto-style2">
                                                <asp:TextBox ID="txtc_pswd" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:CompareValidator ID="cv_cpswd" runat="server" ControlToCompare="txt_pswd" ControlToValidate="txtc_pswd" ErrorMessage="password is not same" ForeColor="Red" ValidationGroup="a"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                    </table>
                                
                                <br />

                                <br>
                                <div class="form-group">
                                    <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" />
                                    &nbsp;&nbsp;
                                <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" ValidationGroup="a" />
                                </div>
                                    </form>
                            </div>
                        </center>
                    </div>
                </div>
                <a href="login.aspx"><< Already Registered </a>
                <br>
                <br>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
