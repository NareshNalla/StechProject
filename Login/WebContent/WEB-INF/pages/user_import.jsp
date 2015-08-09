<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!-- saved from url=(0037)http://www. .com/a/importUser.do -->
<html lang="en" class="win chrome chrome2 webkit webkit5">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Import Users - Online Exam to Evaluate Knowledge</title>
<link href="./css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./css/feedback.css" type="text/css"
	media="screen">
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
				<li><a href=".\users.html" id="usersId">Users</a></li>

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
					<li><a href="importuser.spring">Import Users</a></li>
				</ul>
				<div class="sidebar_note message note">
					<p>Rather than add users manually one at a time, you can add
						many users in a bulk import. To do this, you have your users data
						in a .CSV (comma separated values) or.TXT file or XLS file.</p>
					<p>Step1: Prepare the Users Data feed within the specific
						format. You can download the sample data feed format from here.</p>
					<p>Step2: Browse the users Data feed file by clicking on Choose
						file button provided here</p>
					<p>Step3: Select the delimiter if you are importing .TXT file
						or .CSV file or .XLS file and Click on import button.</p>
					<p>Step4: Map the fields and Import.</p>
				</div>
			</div>
			<div id="main">
				<div style="width: 100%;">


					<h3>Import Users</h3>
					<hr>
					<p class="message info">
						Importing Users From XLS, TXT or CSV files <br> 1. Select
						.xls, .txt or .csv file <br> 2. Click Upload File <br>
						3. See the Field Mapping and click on Save to import Users <br>
						4. See the sample file for more details about the File format <br>
						5. Birth Date format: DD-MMM-YYYY<br> 6. Expected Titles: Mr.
						/ Mrs. / Miss.
					</p>
				<!-- 	download -->
				
					<div class="import_q">
						<p>Download sample file for more details about the File
							format.</p>
						<a href="downloadCVS/abc.csv"
							class="btn_green" target="_blank">download sample file</a>
					</div>
					<div id="q_bank4" class="import_q">
<form:form name="ImportQuestionDataForm" method="post" action="importuserdetails.spring"
        modelAttribute="uploadForm" enctype="multipart/form-data">
						<input type="file" name="file" value="">
							<p>
								<br> Delimiters (Valid for .txt and .csv formats) <br>
								<input type="radio" name="delimitorOther" value="TAB">TAB
								<input type="radio" name="delimitorOther" value="SEMICOLON">Semicolon
								<input type="radio" name="delimitorOther" value="COMMA">Comma
								<input type="radio" name="delimitorOther" value="SPACE">Space
								<br> <input type="radio" name="delimitorOther"
									value="OTHER">Other <input type="text" name="delimitor"
									maxlength="1" size="1" value=""> &nbsp;&nbsp;&nbsp; Eg:
								,&nbsp;&nbsp;|&nbsp;&nbsp;;&nbsp;&nbsp;\&nbsp;&nbsp;etc. <br>
								<br> <input type="submit" value="Import" class="btn_green">

							</p>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<img height="1" width="1" src="./importUser_files/hit.php">
	<link rel="stylesheet" href="./importUser_files/feedback.css"
		type="text/css" media="screen">
	<script type="text/javascript" src="./importUser_files/jquery.js"></script>
	<script type="text/javascript" src="./importUser_files/feedback.js"></script>
	<script type="text/javascript"
		src="./importUser_files/jquery.browser.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			Feedback({
				h2cPath : '/a' + '/js/feedback/html2canvas.js',
				url : '/a' + '/feedback'
			});
		});
	</script>
	<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->


</body>
</html>