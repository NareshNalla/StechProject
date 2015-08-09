<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0032)http://www. .com/a/group.do -->
<html lang="en" class="win chrome chrome3 webkit webkit5">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>STExams | Web-based online examination software</title>

<link href="css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css"
	media="screen">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script>

$(document).ready(function(){
$( "#hello" ).dialog({ autoOpen: false });
$( "#say_it" ).click(function() {
$( "#hello" ).dialog( "open" );
});
});



</script>

<script type="text/javascript">
function showData(value){ 

xmlHttp=GetXmlHttpObject()
var url="groupnamesearch.spring";
url=url+"?gname="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}
function stateChanged() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
    var showdata = xmlHttp.responseText; 
    document.getElementById("Tbody").innerHTML= showdata;
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try {
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
</script>
</head>
<body>

	<div id="wrapper">

		<div id="header">
			<h1>
				<a href="#"><img src=".\images\logo.png" alt="ST Exam"></a>
			</h1>

			<!-- top nav end -->
			<ul id="topnav">
				<li><a href="" id="settingsId">JAGNYA DATTA</a></li>
				<li><a href="#" id="upgradeId">Upgrade</a></li>
				<li><a href="#">Logout</a></li>
			</ul>
			<!-- topnav end -->

			<ul id="nav">
				<li class="active"><a href=".\dashboard.html" id="homeId">Dashboard</a></li>
				<li><a href="#" id="questionBankId">Questions</a></li>
				<li><a href="#" id="testId">Exams</a></li>
				<li><a href=".\users.spring?pageNo=1" id="usersId">Users</a></li>

				<li><a href="#" id="certId">Certificates</a></li>

				<li><a href="#" id="usersId">Settings </a></li>
				<li><a href="#" id="reportsId">Results</a></li>
			</ul>

		</div>
		<!-- header end -->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="./users.spring?pageNo=1" class="active">User
							Groups</a></li>
					<li><a href="./users_AddUser.spring">Add User</a></li>
					<li><a href="userlist.spring?pageNo=1">User List</a></li>
					<li><a href="importuser.spring">Import Users</a></li>
					<li><a href="importuser.spring">Messaging</a></li>
				</ul>
				<div class="sidebar_note">
					<p class="message note">You may add new Groups to manage users
						for different Technologies, Departments and Categories Etc.,.</p>
				</div>
			</div>
			<div id="main">
				<h3>User Groups</h3>
				<hr>
				<div class="table_top">
					<input id="say_it" type="button" value="Add New Group"
						class="btn_green_sml" onclick="showDialog();">
				</div>

				<div id="hello" title="Add New Group"
					style="background-color: highlight;">
					<form action="addgroupname.spring">

						Name: <input type="text" name="groupname"><br> <br>
						<input type="submit" value="SAVE" class="btn_green_sml">

					</form>
				</div>




				<div id="dialog"></div>
				<div id="example_wrapper" class="dataTables_wrapper" role="grid">
					<div id="example_length" class="dataTables_length">
						<label>Show <select size="1" name="example_length"
							aria-controls="example"><option value="10"
									selected="selected">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option></select> entries
						</label>
					</div>
					<div class="dataTables_filter" id="example_filter">
						<label>Search: <input type="text"
							onkeyup="showData(this.value);" aria-controls="example"></label>
					</div>
					<div id=Tbody>
						<table class="display dataTable" id="example"
							aria-describedby="example_info">
							<thead>
								<tr role="row">
									<th scope="col" class="sorting_asc" role="columnheader"
										tabindex="0" aria-controls="example" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Group Name: activate to sort column descending"
										style="width: 921px;">Group Name</th>
									<th scope="col" align="center" class="sorting_asc"
										role="columnheader" tabindex="0" aria-controls="example"
										rowspan="1" colspan="1"
										aria-label="Options: activate to sort column ascending"
										style="width: 97px;">Options</th>
								</tr>
							</thead>
							<c:forEach var="e" items="${grouplist}">
								<tbody role="alert" aria-live="polite" aria-relevant="all">
									<tr class="odd">

										<td width="80%" class=" sorting_1"><span
											style="float: left;"> </span> ${e.getGroupname()}</td>

										<td width="10%" align="center" class=" sorting_2"><a
											href="#" onclick="#"> <img src=" Users_files\edit.png"
												title="Edit">
										</a>&nbsp;<a
											href="groupnamedelete.spring?gname=${e.getGroupname()}"
											class="basicDelete" onclick="return doLevelDelete(1985);">
												<img src=" Users_files/delete.png" title="Delete">
										</a></td>
									</tr>
							</c:forEach>
							</tbody>
						</table>





						<div class="dataTables_info" id="example_info">
							Showing 1 to 5 of <b> ${param.pageNo} </b>entries
							<div style="position: absolute; top: left: 500px;">
								<h6>
									<a href="users.spring?operation=first">First</a> | &nbsp;
									<%--For displaying Previous link except for the 1st page --%>
									<c:if test="${param.pageNo> 1}">

										<td><a href="users.spring?pageNo=${param.pageNo-1}">Previous
												&nbsp;</a></td>
									</c:if>

									<c:forEach begin="1" end="${i}" var="j">
										<c:choose>
											<c:when test="${param.pageNo eq j}">
												<td>${j}</td>
											</c:when>
											<c:otherwise>
												<a href="users.spring?pageNo=${j}">${j} </a>&nbsp; 
									</c:otherwise>
										</c:choose>
									</c:forEach>

									<%--For displaying Next link --%>

									<c:if test="${param.pageNo lt i}">
										<td><a href="users.spring?pageNo=${param.pageNo+1}">Next
												&nbsp; </a></td>
									</c:if>

									| &nbsp;<a href="users.spring?operation=last">Last</a>
								</h6>
							</div>


						</div>
						<div class="dataTables_paginate paging_two_button"
							id="example_paginate">
							<c:if test="${param.pageNo> 1}">
								<a class="paginate_disabled_previous"
									href="users.spring?pageNo=${param.pageNo-1}" tabindex="0"
									role="button" id="example_previous" aria-controls="example"></a>
							</c:if>
							<c:if test="${param.pageNo lt i}">
								<a class="paginate_disabled_next"
									 href="users.spring?pageNo=${param.pageNo+1}" tabindex="0" role="button"
									id="example_next" aria-controls="example"></a>
							</c:if>
						</div>
					</div>
				</div>

				<div id="basic-modal-content">
					<div align="center">
						<table>

							<form name="GroupForm" method="post" action="#"></form>
							<input type="hidden" name="operation" value="">
							<tbody>
								<tr>
									<td><input type="hidden" name="groupid" value="0"></td>
								</tr>
								<tr>
									<td>Group:</td>
									<td><input type="text" name="groupname" value=""
										id="groupname"></td>
									<td><input type="hidden" name="startPage" value="1"></td>
								</tr>
								<tr>
									<td colspan="2">
										<center>
											<input type="submit" value="Ok"
												onclick="doSubmit();return false;">
										</center>
									</td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" charset="utf-8">
	
	

			/* Define two custom functions (asc and desc) for string sorting */
			jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
				return ((x < y) ? -1 : ((x > y) ?  1 : 0));
			};
			
			jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
				return ((x < y) ?  1 : ((x > y) ? -1 : 0));
			};
			
			$(document).ready(function() {
				/* Build the DataTable with third column using our custom sort functions */
				$('#example').dataTable( {
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 1 ] }
					]
				} );

				Feedback({h2cPath: '/a' +  '/js/feedback/html2canvas.js' , url:'/a' +'/feedback' });
				
			} );
		</script>
	<img height="1" width="1" src="./Users_files/hit.php">
</body>
</html>