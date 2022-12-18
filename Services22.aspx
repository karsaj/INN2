<%@ Page Language="VB" AutoEventWireUp="false" MasterPageFile="~/MainTemplate.master" Title="Our Products" %>



<asp:Content ID="Content1" ContentPlaceHolderID="mastheadPh" runat="Server">
	<asp:ImageMap ID="masthead" runat="server" SkinID="masthead3" /></asp:Content>
	
	
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
	<h1>Our Services</h1>
	<p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec suscipit ultricies
        mauris. Mauris pellentesque.</p>
        
       


<script type="text/javascript" src="tabcontent.js">



</script>


	<link rel="stylesheet" type="text/css" href="tabcontent.css" />



<ul id="maintab" class="shadetabs">
<li class="selected"><a href="#" rel="tcontent1">Business</a></li>
<li><a href="#" rel="tcontent2">Technical</a></li>
<li><a href="#" rel="tcontent3">Strategic</a></li>

</ul>

<div class="tabcontentstyle">

<div id="tcontent1" class="tabcontent">
Tab content 1 here<br />Tab content 1 here<br />
</div>

<div id="tcontent2" class="tabcontent">
Tab content 2 here<br />Tab content 2 here<br />
</div>

<div id="tcontent3" class="tabcontent">
Tab content 3 here<br />Tab content 3 here<br />
</div>

<div id="tcontent4" class="tabcontent">
Tab content 4 here<br />Tab content 4 here<br />

</div>

</div>

<script type="text/javascript">
//Start Tab Content script for UL with id="maintab" Separate multiple ids each with a comma.
initializetabcontent("maintab")
</script>

	<p>Maecenas vitae pede. Nunc dui quam, aliquet eu, commodo et, posuere vitae, tortor. Aliquam erat volutpat.</p>
</asp:Content>
