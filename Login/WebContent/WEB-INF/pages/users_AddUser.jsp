<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en" class="win chrome chrome3 webkit webkit5">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>ST Exam</title>

<link href="css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css"
	media="screen">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script>
	$(document).ready(function() {
		$("#hello").dialog({
			autoOpen : false
		});
		$("#say_it").click(function() {
			$("#hello").dialog("open");
		});
	});
</script>
<script type="text/javascript" src="./Users_AddUser_files/createuser.js"></script>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}

	$(document).ready(function() {
		Feedback({
			h2cPath : '/a' + '/js/feedback/html2canvas.js',
			url : '/a' + '/feedback'
		});
	});
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
				<div class="sidebar_note message note">
					<p>You can add multiple users in the group which will be used
						while scheduling the exam</p>
				</div>
			</div>
			<div id="main">
				<h3>Add New Users</h3>
				<hr>
				<p class="message note">To Add multiple users please separate
					email ids by comma ( , ) OR have one email id in one line.</p>


				<form name="CandidateForm" method="post" action="addUser.spring">
					<div class="new_user">
						<p>
							<label>Groups:</label> <select name="groupnamef" id="groupid"
								style="width: 442px;">
								<option value="#">Select Group</option>
								<c:forEach var="e" items="${l}">
									<option value="${e.getGroupname()}">${e.getGroupname()}</option>


								</c:forEach>
							</select> <input id="say_it" type="button" value="Add New Group"
								class="btn_green_sml" onclick="showDialog();">
				
					</p>
					<p>
						<label style="vertical-align: top">Add emails:</label>
						<textarea name="email" cols="50" rows="10" id="email"></textarea>
					</p>
					<p>
						<label></label>
						<button class="btn_green"
							onclick="javaScript:echeck(); return false;">Add Users</button>
					</p>
			</div>
			</form>
			<div id="hello" title="Add New Group"
						style="background-color: highlight;">
						<form action="addgroupname.spring">

							Name: <input type="text" name="groupname"><br> <br>
							<input type="submit" value="SAVE" class="btn_green_sml">

						</form>
					</div>
		</div>
	</div>
	</div>
	<img height="1" width="1" src="./Users_AddUser_files/hit.php">



</body>
</html>