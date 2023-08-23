<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="librarymanagementproject.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container" style="padding: 25px 25px 25px 25px">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card" style="padding: 50px 75px 50px 75px">
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
                                        <h3>User Login</h3>
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
                                    <table style="width:100%;">
                                        <tr>
                                            <td>
                                    <asp:Label ID="lbl_email" runat="server" Text="Email"></asp:Label>
                                            </td>
                                            <td>
                                    <asp:TextBox ID="txt1_emial" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                    <asp:RequiredFieldValidator ID="rfv_emial" runat="server" ControlToValidate="txt1_emial" ErrorMessage="Please enter the valid email" ForeColor="Red" ValidationGroup="b"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                    <asp:Label ID="lbl_pswd" runat="server" Text="Password"></asp:Label>
                                            </td>
                                            <td>
                                    <asp:TextBox ID="txt_pswd" runat="server" Width="530px"></asp:TextBox>
                                            </td>
                                            <td>
                                    <asp:RequiredFieldValidator ID="rfv_pswd" runat="server" ControlToValidate="txt_pswd" ErrorMessage="Please enter the password correctly" ForeColor="Red" ValidationGroup="b"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" ValidationGroup="b" />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                    <br>
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </center>
                        </div>
                    </div>
                    <a href="registaration.aspx"><< Not Registered yet? </a><br>
                    
                    <br>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
