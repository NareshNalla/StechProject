<!DOCTYPE html>
<html lang="en" class="win chrome chrome2 webkit webkit5">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Forgot Password -   Online Exam to Evaluate Knowledge</title>

<link href="css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css" media="screen">
</head>
<body>
<div id="dialog" align="center" style="display: none;">
		     <img alt="" src="images/loging.gif">
		</div>
<div id="wrapper">
  <div id="header">
    <h1><a href="#"><img src="images/logo.png" alt="stexams"></a></h1>
   </div>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<b>Welcome.. ${user.email}</b>
			<div id="main">
				<form name="ChangePassForm" method="post" action="changepassword.spring">
					<h3>Change Password</h3>
					<hr>
					
					<div class="change_pass">
						
						<p>
							<label>Enter OTP :</label>
							<input type="text" name="otp" size="28" value="" style="btn_corner">
						</p>
						<p>
							<label>New Password:</label>
							<input type="password" name="newPassword" size="28" value="" style="btn_corner">
						</p>
						<p>
							<label>Confirm Password:</label>
							<input type="password" name="conformPassword" size="28" value="" style="btn_corner">
						</p>
						<p>
							<label></label>
									<button class="btn_green" onclick="javaScript:submit1();">Submit</button>
						</p>
					</div>
					<input type="hidden" name="userId" value="0">
					<input type="hidden" name="userrole" value="User">
				</form>
			</div>
		</div>
	</div>



<button class="feedback-btn feedback-bottom-right" data-html2canvas-ignore="true">Send Feedback</button></body></html>