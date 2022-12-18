Partial Class DefaultPage
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete

        If Not IsCallback Then

            ' IE 5.5 isn't able to render the dynamic menu items correctly if
            ' the size of the header image is too large. To work around this problem, 
            ' IE 5.5 gets a different header image than the other browsers. 
            If Request.Browser.Id.Equals("ie55") Then
                mastheadImg.ImageUrl = String.Format("~/App_Themes/{0}/Images/Homepage/masthead_ie55.jpg", IIf(Not Page.Theme Is Nothing, Page.Theme, Page.StyleSheetTheme))
                mastheadImg.Height = 206
                litHeaderHeight.Text = "206px"
            End If

        End If

    End Sub
End Class
