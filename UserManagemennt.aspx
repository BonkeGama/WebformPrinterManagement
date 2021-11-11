<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserManagemennt.aspx.cs" Inherits="UserManagemennt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" class="box" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
        <script>
            function validacija() {

                let user = document.getElementById('UserID');
                let listOptions = document.querySelectorAll("#list option");


                if (user.value.length <= 20 && user.value.length >= 3) { } else {
                    alert("Username has to be between 6-15 characters.")
                }


                for (let i = 0; i < listOptions.length; i++) {
                    if (listOptions[i].value === user.value) {
                        alert('The name already exist')
                    }
                }
                return false;
            }
        </script>

        <script>
            var myInput = document.getElementById("RadTextBox6");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

            // When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

            // When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }
        </script>

       <script type="text/javascript">

           function validationCheck() {
               var summary = "";
               summary += isvalidFirstname();
               summary += isvalidLastname();
               summary += isvalidEmail();
               if (summary != "") {
                   alert(summary);
                   return false;
               }
               else {
                   return true;
               }
           }

           function isvalidFirstname() {
               var id;
               var temp = document.getElementById("<%=RadTextBox2.ClientID %>");
               id = temp.value;
               if (id == "") {
                   return ("Please enter First Name" + "\n");
               }
               else {
                   return "";
               }
           }
           function isvalidLastname() {
               var id;
               var temp = document.getElementById("<%=RadTextBox3.ClientID %>");  
            id = temp.value;  
            if (id == "") {  
                return ("Please enter Last Name" + "\n");  
            }  
            else {  
                return "";  
            }  
        }  
        function isvalidEmail() {  
            var id;  
            var temp = document.getElementById("<%=RadTextBox4.ClientID %>");
               id = temp.value;
               var re = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
               if (id == "") {
                   return ("Please Enter Email" + "\n");
               }
               else if (re.test(id)) {
                   return "";
               }

               else {
                   return ("Email should be in the form abc@xyz.com" + "\n");
               }
           }
       </script>


        <script src="https://maps.googleapis.com/maps/api/js?key=******&callback=initMap&libraries=places&v=weekly"
            async></script>
        <script src="Scripts/AutoComplete.js"></script>

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>

        <br />
        <br />
        <div align="center">
            ADD USER<br />
            <br />
            <table>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel1" runat="server">
                            First Name
                        </telerik:RadLabel>

                        <td>
                            <telerik:RadTextBox ID="RadTextBox2" runat="server"></telerik:RadTextBox>

                        </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel2" runat="server">
                            Last Name
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox3" runat="server"></telerik:RadTextBox>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel3" runat="server">
                            Email Address
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox4" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel4" runat="server">
                            Username
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox5" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel5" runat="server">
                            Password
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox6" runat="server" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"></telerik:RadTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel6" runat="server">
                            Address
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="pacinput" runat="server" Width="287px" ClientIDMode="Static"></telerik:RadTextBox>
                        <telerik:RadMap ID="map" Height="240px" Width="570px" runat="server" ClientIDMode="Static"></telerik:RadMap>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel7" runat="server">
                            Date Of Birth
                        </telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US" MaxDate="2021-01-01" MinDate="1950-01-01">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" EnableKeyboardNavigation="True"></Calendar>

<DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                        </telerik:RadDatePicker>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabel8" runat="server">
                            Designation
                        </telerik:RadLabel>
                    </td>

                    <td>
                        <telerik:RadComboBox ID="RadComboBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DesignationName" DataValueField="DesignationID"></telerik:RadComboBox>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>
            <br />
            <br />
            <telerik:RadButton ID="RadButton1" runat="server" OnClick="RadButton1_Click" Text="Add User">
            </telerik:RadButton>

            <br />
        </div>
    </form>
</body>
</html>
  


