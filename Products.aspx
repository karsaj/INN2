<%@ Page Language="VB" AutoEventWireUp="false" MasterPageFile="~/MainTemplate.master" Title="Internextera Services" %>



<asp:Content ID="Content1" ContentPlaceHolderID="mastheadPh" runat="Server">
	<asp:ImageMap ID="masthead" runat="server" SkinID="masthead3" /></asp:Content>
	
	
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">

<script type="text/javascript" src="tabcontent.js">



</script>

<script type="text/javascript">



var enablepersist="on" //Enable saving state of content structure using session cookies? (on/off)
var memoryduration="7" //persistence in # of days

var contractsymbol='minus.gif' //Path to image to represent contract state.
var expandsymbol='plus.gif' //Path to image to represent expand state.

/////No need to edit beyond here //////////////////////////

function getElementbyClass(rootobj, classname){
var temparray=new Array()
var inc=0
var rootlength=rootobj.length
for (i=0; i<rootlength; i++){
if (rootobj[i].className==classname)
temparray[inc++]=rootobj[i]
}
return temparray
}

function sweeptoggle(ec){
var inc=0
while (ccollect[inc]){
ccollect[inc].style.display=(ec=="contract")? "none" : ""
inc++
}
revivestatus()
}


function expandcontent(curobj, cid){
if (ccollect.length>0){
document.getElementById(cid).style.display=(document.getElementById(cid).style.display!="none")? "none" : ""
curobj.src=(document.getElementById(cid).style.display=="none")? expandsymbol : contractsymbol
}
}

function revivecontent(){
selectedItem=getselectedItem()
selectedComponents=selectedItem.split("|")
for (i=0; i<selectedComponents.length-1; i++)
document.getElementById(selectedComponents[i]).style.display="none"
}

function revivestatus(){
var inc=0
while (statecollect[inc]){
if (ccollect[inc].style.display=="none")
statecollect[inc].src=expandsymbol
else
statecollect[inc].src=contractsymbol
inc++
}
}

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function getselectedItem(){
if (get_cookie(window.location.pathname) != ""){
selectedItem=get_cookie(window.location.pathname)
return selectedItem
}
else
return ""
}

function saveswitchstate(){
var inc=0, selectedItem=""
while (ccollect[inc]){
if (ccollect[inc].style.display=="none")
selectedItem+=ccollect[inc].id+"|"
inc++
}
if (get_cookie(window.location.pathname)!=selectedItem){ //only update cookie if current states differ from cookie's
var expireDate = new Date()
expireDate.setDate(expireDate.getDate()+parseInt(memoryduration))
document.cookie = window.location.pathname+"="+selectedItem+";path=/;expires=" + expireDate.toGMTString()
}
}

function do_onload(){
uniqueidn=window.location.pathname+"firsttimeload"
var alltags=document.all? document.all : document.getElementsByTagName("*")
ccollect=getElementbyClass(alltags, "switchcontent")
statecollect=getElementbyClass(alltags, "showstate")
if (enablepersist=="on" && get_cookie(window.location.pathname)!="" && ccollect.length>0)
revivecontent()
if (ccollect.length>0 && statecollect.length>0)
revivestatus()
}

if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload

if (enablepersist=="on" && document.getElementById)
window.onunload=saveswitchstate

</script>

<script type="text/javascript" src="tabcontent.js">



</script>
	
	<h1>Design, Development & Delivery</h1>
	<p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec suscipit ultricies
        mauris. Mauris pellentesque.</p>
        
       


<script type="text/javascript" src="tabcontent.js">



</script>





<ul id="maintab" class="shadetabs" style="left: -25px; width: 414px; position: relative; top: 3px; height: 5%">
<li class="selected"><a href="#" rel="tcontent1">Business and Marketing</a></li><li><a href="#" rel="tcontent2">Technical</a></li><li><a href="#" rel="tcontent3">Strategic</a></li></ul>

<div class="tabcontentstyle" style="width: 384px">

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
