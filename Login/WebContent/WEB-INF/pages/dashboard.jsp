<!DOCTYPE html>
<html lang="en" class="win chrome chrome2 webkit webkit5"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>ST Exam</title>


<link rel="stylesheet" href="css/style_blue.css" type="text/css" media="screen">

        
<script type="text/javascript">
function cancel(){
	$("#dialog").dialog('close');
}
function showContactusDialog(){
	$("#dialog").dialog();
}
function sendContactusMessage() {
	var message = document.getElementById("cprmsg").value;
	if(message ==""){
		alert("Please enter the message.");
	 	return;
	 }else{
		$.post("sendpcrequest.do?check", {
			msg : message,
			pid : "-1",
			opr : "req"
		}, function(data) {
			if (data == null) {
				message(container, "Error while sending request...");
			} else {			
				if(data == 'success'){
					alert("Your request has been send successfully.");
					$("#dialog").dialog('close');
				}
			}
		});
	 }
}
</script>
</head>
<body>
	
	<div id="wrapper">
		
<div id="header">
    <h1><a href="#"><img src="images/logo.png" alt="ST Exam"></a></h1>
  	    
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
      <li><a href="users.spring?pageNo=1" id="usersId">Users</a></li>
      
      <li><a href="#" id="certId">Certificates</a></li>
      
      <li><a href="#" id="usersId">Settings  </a></li>
      <li><a href="#" id="reportsId">Results</a></li>
      </ul>
  
</div>
  <!-- header end -->
		<div id="content">
			<div id="middle_section">
				<h3>My Dashboard</h3>
				<hr>
				<div class="box_outer">
					<ul class="steps">
						<li><a href=".\question.html" class="questions">
							<div class="questimg"></div></a>
							<p><a href="">Add</a>&nbsp;/&nbsp;
								<a href="">Import</a>
								Questions,
								<a href="">Categories</a>,
								<a href="">Subcategories</a>,
								<a href="">Complexity</a>
							</p></li>
						<li><a href=".\exams.html" class="exams">
							<div class="examsimg"></div></a>
							<p> <a href="">Add</a>&nbsp;/&nbsp;
								<a href="">Question papers</a> and 
								<a href="">schedule exam</a>
							</p></li>
						<li><a href="users.spring?pageNo=1" class="users">
							<div class="usersimg"></div></a>
							<p>
								<a href="">Add</a>&nbsp;/&nbsp;
								<a href="">Import</a>&nbsp;users&nbsp;by
								<a href="">group</a>
							</p></li>
						<li><a href=".\certificates.html" class="certificates">
							<div class="certiimg"></div></a>
							<p><a href="">Add / Manage your certificates</a></p>
							</li>
						<li><a href="" class="upgrade">
							<div class="upgradeimg"></div><div class="fcredit">
							Available Free Credits: 100
							
							</div></a>
							<p><a href="">Upgrade and remove your limits</a></p>
						</li>
					</ul>
				</div>
			</div>
			<div class="clr"></div>
			
				
				
			 <br>
			 <div id="dialog" title="Customize Plan Request" style="display: none;">
					<p><label>Customize Plan Message:</label><textarea rows="5" cols="60" name="message" id="cprmsg"></textarea></p>
					<p style="text-align: right;">
							<input type="button" onclick="cancel();" value="Cancel" class="btn_green">&nbsp;
							<input type="button" onclick="sendContactusMessage();" value="Change Plan" class="btn_green">
					</p>
			</div>	
				
			
			
			<table>
				<tbody><tr>
					<td width="20%" style="border:0px;height:300px;">
							</td>
					<td width="*%" style="border:0px;padding: 5px;text-align: left;!important;">
						<table class="dash_half" style="width:100%;!important;">
							<thead>
								<tr>
									<th></th>
									<th>Today</th>
									<th>This Week</th>
									<th>This Month</th>
									<th>Till Date</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd">
									<td>Total Exams Created</td>
									<td>0</td>
									<td>1</td>
									<td>1</td>
									<td>2</td>
								</tr>
								<tr class="even">
									<td>Total Candidates Scheduled for Exam</td>
									<td>0</td>
									<td>1</td>
									<td>1</td>
									<td>2</td>
								</tr>
								<tr class="odd">
									<td>Total Candidates Given the Exam</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr class="even">
									<td>Total Candidates Passed the Exam</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="20%" style="border:0px;">&nbsp;</td>
				</tr>
			</tbody></table>
		</div>
	</div>
	
	

</body></html>