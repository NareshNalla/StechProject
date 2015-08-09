<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0035)http://www. .com/a/ViewUser.do -->
<html lang="en" class="win chrome chrome2 webkit webkit5">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>STExams | Web-based online examination software</title>

<link href="css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css"
	media="screen">
<script type="text/javascript">
function showData(value){ 

xmlHttp=GetXmlHttpObject()
var url="usermailsearch.spring";
url=url+"?email="+value;
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
<script type="text/javascript">
	showDialog = function() {

		$("#dialog").dialog({
			autoOpen : true,
			height : 'auto',
			width : 'auto',
			modal : true,
			closeOnEscape : false
		});
		$("#dialog").dialog('option', 'title', "Candidate Profile");
		$("#dialog").dialog('option', 'show', 'drop');
		$("#dialog").dialog('option', 'resizable', true);
		$("#dialog").dialog('option', 'position', 'top');

		$("#dialog").dialog('open');
		$("#dialog").dialog('defaults','bgiframe',true);
	}

	function doUserDelete(email) {
		var frm = document.forms[0];
		frm.email.value = email;
		frm.operation.value = "delete";
		if (confirm('Do you want to delete this User?')) {
			document.forms[0].submit();
		}
	}

	
	function dispProfile(str) {
		var temp = new Array();
		temp = str.split("$");
		var res = eval(temp[0]);
		if (res != null) {
			var mystr; var pstr;
			for ( var i = 0; i < res.length; i++) {
				pstr = "<tr><td>" + res[i].firstname + "</td><td>" + res[i].lastname
						+ "</td><td>" + res[i].emailid + "</td><td>"
						+ res[i].birthdate + "</td><td>" + res[i].mobileNumber + "</td><td>" + res[i].city + "</td></tr>";
			}

			tstr ="<table id='academics'><thead><tr><th scope='col'>First Name</th><th scope='col'>Last Name</th><th scope='col'>Email-Id</th>"
				 +"<th scope='col'>Birth Date</th><th scope='col'>MobileNumber</th><th scope='col'>City</th></tr></thead>";
			document.getElementById('myptable').innerHTML = tstr + pstr + "</table>";
			
			var myres = "(" + temp[1] + ")";
			var res = eval(myres);
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					mystr = "<tr><td>" + res[i].qualification + "</td><td>" + res[i].university + "</td><td>"
							+ res[i].passingyear + "</td><td>" + res[i].percentage + "</td></tr>";
				} else {
					mystr = mystr + "<tr><td>" + res[i].qualification + "</td><td>" + res[i].university + "</td><td>"
							+ res[i].passingyear + "</td><td>" + res[i].percentage + "</td></tr>";
				}
			}
			tstr ="<table id='academics'><thead><tr><th scope='col'>Qualification</th><th scope='col'>University/Board</th>"
				 +"<th scope='col'>Yearing of Passing</th><th scope='col'>Percentage/Grade</th></tr></thead>";
		
			if (mystr == undefined)
				mystr = "<tr><td colspan=4><center>Information Is Not Available</center></td></tr>";
			document.getElementById('myatable').innerHTML = tstr + mystr + "</table>";

			var myres = "(" + temp[2] + ")";
			var res = eval(myres);
			var myestr;
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					myestr = "<tr><td>" + res[i].companyname + "</td><td>" + res[i].description + "</td><td>"
							+ res[i].fromdate + "</td><td>" + res[i].todate + "</td></tr>";
				} else {
					myestr = myestr + "<tr><td>" + res[i].companyname + "</td><td>" + res[i].description + "</td><td>"
							+ res[i].fromdate + "</td><td>" + res[i].todate + "</td></tr>";
				}
			}
			tstr ="<table id='academics'><thead><tr><th scope='col'>Company Name</th><th scope='col'>Designation</th>"
				 +"<th scope='col'>From Date</th><th scope='col'>To Date</th></tr></thead>";
		
			if (myestr == undefined)
				myestr = "<tr><td colspan=4 ><center>Information Is Not Available</center></td></tr></table>";
			document.getElementById('myetable').innerHTML = tstr + myestr + "</table>";

			var myres = "(" + temp[3] + ")";
			var res = eval(myres);
			var mytstr;
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					mytstr = "<tr><td>" + res[i].technology + "</td><td>" + res[i].skills + "</td></tr>";
				} else {
					mytstr += "<tr><td>" + res[i].technology + "</td><td>" + res[i].skills + "</td></tr>";
				}
			}

			if (mytstr == undefined)
				mytstr = "<tr><td colspan=2 ><center>Information Is Not Available</center></td></tr>";

			document.getElementById('myttable').innerHTML = mytstr;

			showDialog();
		} else {
			alert("User haven't added their details");
		}
	}
	
	getProfile = function(userid) {

		var frm = document.forms["ProfileForm"];

		$.ajax({
			url : "callProfile.do",
			data : {
				userId : userid,
				op : "getRecord"
			},
			success : function(data) {
				if (data == null) {
					message("User haven't added their details");
				} else {
					var res = eval("data");
					dispProfile(res);
				}
			}
		});
	}
	function getUsers() {
		var frm = document.forms["groups"];
		/* frm.action = "/users.spring?pageNo=1"; */
		frm.action = "userlistbygroup.spring";
		frm.submit();
	}
	
	function savePassword() {
		var data = $.trim($("#pass").val());
		var dataAgain = $.trim($("#conf").val());
		if (data == '' || dataAgain == '')
			alert("Please enter Password value");
		else if(data != dataAgain)
			alert("Please enter same Password value");
		else {
			var userId = $("#useridpass").val();
			var emailFlag = $('#emailFlag').is(':checked')?"true":"false";
			var passEmail = $('#passEmail').val();
			$.ajax({
				type: "POST",
				url : "changePassword.do",
				data : {
					userId : userId,
					data : data,
					emailFlag : emailFlag,
					passEmail : passEmail
				},
				success : function(data) {
					var res = $.trim(data);
					if(res == 'done') {
						window.location.reload(true);
					} else {
						alert('Error while sending the mail, Please try again.');
					}
				}
			});
			
		}
	}

	resetPassword = function(userid,email) {
		$("#passwordDialog").dialog({
			autoOpen : true, height : '230', width : 'auto', modal : true, closeOnEscape : false
		});
		$("#passwordDialog").dialog('option', 'title', "Change Password");
		$("#passwordDialog").dialog('option', 'show', 'drop');
		$("#passwordDialog").dialog('option', 'resizable', false);
		var strHtml = "<input type='hidden' id='useridpass' value='" + userid + "' /><input type='hidden' id='passEmail' value='" + email + "' /><table>";  
		strHtml += "<tr><td>New Password:</td><td><input type='password' size='5' id='pass'><span class='mandatory'>*</span></td></tr>";
		strHtml += "<tr><td>Confirm Password:</td><td><input type='password' size='5' id='conf'><span class='mandatory'>*</span></td></tr>";
		strHtml += "<tr><td>Send Email:</td><td><input type='checkbox' id='emailFlag'></td></tr>";
		strHtml += "<tr><td colspan='2' align='center'><button onclick='return savePassword();' class='btn_green'>Save</button></td></tr></table>";
		$("#passwordDialog").html(strHtml);
		$("#passwordDialog").dialog('open');
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
				<li><a href=".\question.html" id="questionBankId">Questions</a></li>
				<li><a href=".\exams.html" id="testId">Exams</a></li>
				<li><a href=".\users.spring?pageNo=1" id="usersId">Users</a></li>

				<li><a href=".\certificates.html" id="certId">Certificates</a></li>

				<li><a href=".\settings.html" id="usersId">Settings </a></li>
				<li><a href=".\results.html" id="reportsId">Results</a></li>
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
					<li><a href="./importuser.spring">Import Users</a></li>
				</ul>
				<div class="sidebar_note">
					<p class="message note">You can review the user profiles in
						detail</p>
				</div>
			</div>
			<div id="main">
				<h3>Group Wise User List</h3>

				<hr>
				
				<div class="table_top">
					<form action="userlist.spring" name="groups">
						<!-- <input type="hidden" name="operation" id="operation"> <input
							type="hidden" name="email" id="email"> <input
							type="hidden" name="password" id="password"> <input
							type="hidden" name="cpassword" id="cpassword"> <input
							type="hidden" name="status" id="status"> <input
							type="hidden" name="question" id="question"> <input
							type="hidden" name="answer" id="answer"> <input
							type="hidden" name="companyId" id="companyId"> -->
						 <select name="groupname" id="groupid" onchange="return getUsers();">
							<option value="0">All Groups</option>

							<c:forEach var="e" items="${l}">
								<option value="${e.getGroupname()}">${e.getGroupname()}</option>
							</c:forEach>

						</select>
					</form>
					<script type="text/javascript">
					
					var list = document.getElementById('groupid');
					for ( var intI = 0; intI < list.options.length; intI++) {
						if (list.options[intI].value == 0) {
							list.options[intI].selected = true;
						}
					}
					
				</script>
				</div>


				<div id="dialog" style="display: none;">
					<div>
						<div class="rt_tablive">
							<ul class="rt_tabnav">
								<li class="rt_tabactive"><a href="javascript:void(null);"
									title="Personal">Personal</a></li>
								<li class=""><a href="javascript:void(null);"
									title="Academics">Academics</a></li>
								<li class=""><a href="javascript:void(null);"
									title="Experience">Experience</a></li>
							</ul>
							<div class="rt_tabtab " id="#round_corner" title="">
								<h2>Personal</h2>
								<div id="myptable"></div>
							</div>
							<div class="rt_tabtab rt_tabtabhide" id="#round_corner" title="">
								<h2>Academics</h2>
								<div id="myatable"></div>
							</div>
							<div class="rt_tabtab rt_tabtabhide" title="">
								<h2>Experience</h2>
								<div id="myetable"></div>
							</div>
						</div>
					</div>
				</div>


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
						<label>Search: <input type="text" onkeyup="showData(this.value);" aria-controls="example">
						</label>
					</div>
					
						<div id=Tbody>
					<table class="display dataTable" id="example"
						aria-describedby="example_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" role="columnheader" tabindex="0"
									aria-controls="example" rowspan="1" colspan="1"
									style="width: 100px;" aria-sort="ascending"
									aria-label="User Id: activate to sort column descending">
									Email</th>

								<th class="sorting_asc" role="columnheader" tabindex="0"
									aria-controls="example" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="Email: activate to sort column ascending">
									User Group</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example" rowspan="1" colspan="1"
									style="width: 400px;"
									aria-label="View Profile: activate to sort column ascending">
									View Profile</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="Options: activate to sort column ascending">
									Options</th>
							</tr>
						</thead>

						<tfoot>
						</tfoot>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="odd">
								<c:forEach var="e" items="${userlist}">
									<tbody role="alert" aria-live="polite" aria-relevant="all">
										<tr class="odd">

											<td width="80%" class=" sorting_1"><span
												style="float: left;"> </span> ${e.getEmail()}</td>

											<td width="80%" class=" sorting_1"><span
												style="float: left;"> </span> ${e.getGroupnamef()}</td>


											<td class=" "><a href="http://www. .com/a/ViewUser.do#"
												onclick="getProfile(&#39;${e.getUser_id()}&#39;);"><img
													src="./user_List_files/user.png" alt="View Profile"
													title="View Profile"></a> &nbsp;&nbsp; <a
												href="javaScript:resetPassword('11493','jai.mail67@gmail.com')"
												title="Reset Password">Reset Password</a> <!-- <img src="< %=request.getContextPath()%>/images/edit.png" /> -->
											</td>

											<td id="delete" class="delete"><a href="userdelete.spring?uid=${e.getUser_id()}"
												onclick="return doUserDelete(&#39;${e.getEmail()}&#39;);"><img
													src="Users_files/delete.png" title="Delete"></a></td>
										</tr>
									</tbody>
								</c:forEach>
					</table>


					<div class="dataTables_info" id="example_info">
						Showing 1 to 5 of <b> ${param.pageNo} </b>entries
						<div style="position: absolute; top: left: 500px;">
							<h6>
								&nbsp;
								<%--For displaying Previous link except for the 1st page --%>
								<c:if test="${param.pageNo> 1}">

									<td><a href="userlist.spring?pageNo=${param.pageNo-1}">Previous
											&nbsp;</a></td>
								</c:if>

								<c:forEach begin="1" end="${i}" var="j">
									<c:choose>
										<c:when test="${param.pageNo eq j}">
											<td>${j}</td>
										</c:when>
										<c:otherwise>
											<a href="userlist.spring?pageNo=${j}">${j} </a>&nbsp; 
									</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--For displaying Next link --%>

								<c:if test="${param.pageNo lt i}">
									<td><a href="userlist.spring?pageNo=${param.pageNo+1}">Next
											&nbsp; </a></td>
								</c:if>


							</h6>
						</div>
					</div>


				</div>
			</div>
		</div>
		</div>
	
	</div>
	<div id="passwordDialog"></div>
	<script type="text/javascript" charset="utf-8">
			/* Define two custom functions (asc and desc) for string sorting */
			jQuery.fn.dataTableExt.oSort['string-case-asc'] = function(x, y) {
				return ((x < y) ? -1 : ((x > y) ? 1 : 0));
			};

			jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x, y) {
				return ((x < y) ? 1 : ((x > y) ? -1 : 0));
			};

			$(document).ready(function() {
				/* Build the DataTable with third column using our custom sort functions */
				$('#example').dataTable({
					"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
					"aoColumnDefs" : [ {
						"sType" : 'string-case',
						"aTargets" : [ 1 ]
					} ]
				});

				Feedback({h2cPath: '/a' +  '/js/feedback/html2canvas.js' , url:'/a' +'/feedback' });
				
			});
		</script>
	<img height="1" width="1" src="./user_List_files/hit.php"> <
</body>
</html>