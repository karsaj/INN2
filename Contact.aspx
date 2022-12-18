<%@ Page Language="VB" MasterPageFile="~/MainTemplate.master" CodeFile="Contact.aspx.vb" Inherits="Contact"  Title="Internextera Communications Content: Toronto Techhnical Writer" %>

<asp:Content ContentPlaceHolderID="mastheadPh" runat="server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function FIELDSET1_onclick() {

}

function P1_onclick() {

}

// ]]>
</script>

	<asp:ImageMap ID="masthead" runat="server" SkinID="masthead2" /></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="Server">
	<h1>Contact Us for Help</h1>
	<p id="P1" onclick="return P1_onclick()">To review our portfolio, or discuss how Internextera can deliver superior communications content to satisfy your requirements, please contact us today.</p>
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="169px" Width="457px">
        <StepStyle VerticalAlign="Top" />
        <SideBarStyle Width="150px" ForeColor="Black" BorderColor="Silver" Font-Names="Verdana" />
        <WizardSteps>
            <asp:WizardStep runat="server">
                <table cellpadding="10">
                    <tr>
                        <td style="width: 85px">
                            Your full name is:</td>
                        <td style="width: 122px">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Please enter your name.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 85px">
                            Email address:</td>
                        <td style="width: 122px">
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please enter your email.">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 85px">
                        </td>
                        <td colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="240px" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server">
                <table>
                    <tr>
                        <td style="width: 100px; height: 86px">
                            How may we help?<br />
                            </td>
                        <td style="width: 100px; height: 86px">
                            <asp:TextBox ID="txtComments" runat="server" Height="61px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 100px; height: 86px">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidateComments"
                                ControlToValidate="txtComments" ErrorMessage="No more than 10 characters please" Enabled="False">*</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            Telephone:<br />
                            </td>
                        <td style="width: 100px">
                            <asp:TextBox ID="txtRating" runat="server" Width="170px"></asp:TextBox>
                        </td>
                        <td style="width: 100px">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtRating"
                                ErrorMessage="Use a number between 1 and 5" MaximumValue="5" MinimumValue="1" Enabled="False">*</asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish">
                Thank you; please click the <b>Finish</b> button below so that we may contact you as soon as possible.</asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete">
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    		<br /><br /><h6>Copyright © 2007 Internextera. All Rights Reserved.</h6>

</asp:Content>