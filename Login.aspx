<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        
   
    <title>Login</title>

</head>
    
  
<body>
    <form id="form1" class="box" runat="server">
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <style type="text/css">
         .Logo {
             color:#51697c;
         }
        body {
            font-family: sans-serif;
            margin:0;
            padding:0;
            background:#34495e;
            color:#ffffff;
        }
        
       .RadLabel{
           color:#51697c;
       }
       .box{
           width:380px;
           padding:40px;
           position:absolute;
           top:50%;
           left:50%;
           transform: translate(-50%,-50%);
           background: white;
           text-align: center;
       }
       .box input[type="text"],.box input[type="password"]   {
           border:0;
           color:#51697c;
           border: 2px solid #3498db;
           background: none;
           padding: 14px 14px;
           display: block;
           margin: 20px auto;
           width: 200px;
           border-radius: 24px;
           outline: none;
           text-align: center;
       }
        .box .RadButton   {
           border:0;
           color:#51697c;
           border: 2px solid #2ecc71;
           background: none;
           padding: 14px 40px;
           display: block;
           margin: 20px auto;
           transition: 0.25s;
           border-radius: 24px;
           outline: none;
           text-align: center;
           cursor: pointer;
        }
        .box .LinkButton {
            color:white;
        }
       
           </style>

        <div align="center">
           <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
           <div class="Logo">
               <strong> CP | Company Printers</strong>
           </div>
          <div>
            <img src="Styles/profil-account-icon-simple-260nw-1179865564.jpg" />
          </div>
            <table>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel1" Text="Username" runat="server"></telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox1" runat="server" placeholder="Username"></telerik:RadTextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RFV1" runat="server" ErrorMessage="Please enter username"
                            ControlToValidate="RadTextBox1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel2" Text="Password" runat="server"></telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox2" TextMode="Password" runat="server" placeholder="Password"></telerik:RadTextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter password"
                            ControlToValidate="RadTextBox2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Forgot Password? 
                        </asp:LinkButton>

                    </td>
                    <td>
                        <telerik:RadButton ID="RadButton1" runat="server" type="submit" Text="Login" OnClick="RadButton1_Click"></telerik:RadButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
