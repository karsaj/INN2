<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>

<style type="text/css">

.showstate{ /*Definition for state toggling image */
cursor:hand;
cursor:pointer;
float: right;
margin-top: 2px;
margin-right: 3px;
}

.headers{
width: 400px;
font-size: 120%;
font-weight: bold;
border: 1px solid black;
background-color: lightyellow;
}

.switchcontent{
width: 400px;
border: 1px solid black;
border-top-width: 0;
}

</style>

<script type="text/javascript">

/***********************************************
* Switch Content script II- � Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use. Last updated April 2nd, 2005.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

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

<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<!--Optional Expand/ Contact All links. Remove if desired-->
<div style="margin-bottom: 5px"><a href="javascript:sweeptoggle('contract')">Contract All</a> | <a href="javascript:sweeptoggle('expand')">Expand All</a></div>

<div class="headers"><img src="minus.gif" class="showstate" onClick="expandcontent(this, 'sc1')" />What is JavaScript?</div>
<div id="sc1" class="switchcontent">
JavaScript is a scripting language originally developed by Netscape to add interactivity and power to web documents. It is purely client side, and runs completely on the client's browser and computer.
</div>
<br />

<div class="headers"><img src="minus.gif" class="showstate" onClick="expandcontent(this, 'sc2')" />Difference betwen Java & JavaScript?</div>
<div id="sc2" class="switchcontent">
Java is completely different from JavaScript- the former is a compiled language while the later is a scripting language.
</div>
<br />

<table border="0" cellspacing="0" cellpadding="0">
  <tr><td class="headers"><img src="minus.gif" class="showstate" onClick="expandcontent(this, 'sc3')" />What is DHTML? (table example)</td></tr>
  <tr><td id="sc3" class="switchcontent">DHTML is the embodiment of a combination of technologies- JavaScript, CSS, and HTML. Through them a new level of interactivity is possible for the end user experience.</td></tr>
</table>
</BODY>
</HTML>
