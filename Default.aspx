<%@ Page Language="VB" MasterPageFile="~/MainTemplate.master" CodeFile="Default.aspx.vb" Inherits="DefaultPage" Title="Internextera Communications Content: Toronto Technical Writer" %>

<asp:Content runat="server" ContentPlaceHolderID="headEmbeds">
    <style type="text/css">
        @import url(<asp:Literal runat="server" Text="<%$ Themes:StylesheetTheme(~/Assets/CSS/{0}_Home.css) %>" />);       
        #header {height:<asp:Literal runat="server" id="litHeaderHeight" Text="486px" />;}        
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="mastheadPh" runat="server">
	<asp:Image ID="mastheadImg" runat="server" SkinID="mastheadHome" />
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContent" runat="Server">
	<h1>Welcome to Internextera</h1>
	
	<p class="leftColumn">If you need content-rich communications for print or electronic media, you are at  
the right place. Internextera has been delivering superior business communications 
for prestigious clients since before the World Wide Web became popular.   








</p>	
	<p class="rightColumn">From sophisticated books, manuals, brochures, and presentations, to complex white papers and proposals, Internextera has designed, developed and delivered numerous end-user, B2B, and government communications content solutions. <a href="About.aspx" title="About Us">More about us</a>.</p>	
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><h6>Copyright © 2007 Internextera. All Rights Reserved.</h6>
</asp:Content>
