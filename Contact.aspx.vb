Imports System.Net.Mail

Partial Class Contact
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            txtName.Focus()
        End If

    End Sub

	Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        If txtComments.Text.Length > 10 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
	SendMail(txtEmail.Text, txtComments.Text)
    End Sub
    Private Sub SendMail(ByVal from As String, ByVal body As String)
        Dim mailServerName As String = "grandriverhosting.com"
        Dim message As MailMessage = New MailMessage(from, "karsaj@internextera.com", "feedback", body)
        Dim mailClient As SmtpClient = New SmtpClient

        mailClient.Host = mailServerName
        mailClient.Send(message)
        message.Dispose()
    End Sub
End Class
