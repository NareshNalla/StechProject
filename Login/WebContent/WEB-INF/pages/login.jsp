
<!DOCTYPE html>
<html>

<title>STExams | Web-based online examination software</title>

<link rel="stylesheet" href="css/style_blue.css"  type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css" media="screen">
         
<script>
	function userLogin() {
		document.getElementById("candidateForm").submit();
	}
	function login() {
	alert("heloooooooooo");
		document.getElementById("adminForm").submit();
	}
</script>

<style type="text/css">
.candidateLogin {
	margin: 50px auto;
    width: 440px;
    float: right;
}

.adminLogin {
	/*float: right;
    margin: 40px auto;*/
    padding-right: 20px;
}

.admin_login_box  {
    background: none repeat scroll 0 0 #FDF5E6;
    border: 10px solid #D6C69E;
    display: inline-block;
    padding: 10px;
}

.admin_login_box h2 {
    -moz-border-radius: 5px 5px 5px 5px;
    background: none repeat scroll 0 0 #D6C69E;
    font-size: 20px;
    font-weight: bold;
    margin: 0 0 10px;
    padding: 5px 0;
    text-align: center;
    text-transform: capitalize;
}

.admin_login_box label {
    width: 30%;
    float: left;
}

.login_box .forgot_pass {
    background: #FFF no-repeat scroll left center transparent;
    display: inline;
    float: left;
    font-weight: bold;
    margin: 8px 34px 0 95px;
    text-transform: capitalize;
    width: auto;
    padding: 0 0 0 0px;
}

.headertitle  {
    -moz-border-radius: 5px 5px 0 0;
    background: none repeat scroll 0 0 #D6C69E;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0;
    text-align: center;
    text-transform: capitalize;
    width: 125px;
    float:left;
    margin-left: 5px;
}
.unselected{
    background: none repeat scroll 0 0 #FFF;
}

table {
	border: 0px none;
}

table td {
	border: 0px none;
}

.admin_login_box .forgot_pass {
  background: #fff no-repeat scroll left center transparent;
  display: inline;
  float: right;
  font-weight: bold;
  padding: 35px 30px 4px;
  text-transform: capitalize;
  width: auto;
}

.admin_login_buttons {
	padding-right: 75px;
	padding-top: 10px;
}
</style>
 
</head>
<body>



		<div id="dialog" align="center" style="display: none;">
		     <img alt="" src="images/loging.gif">
		</div>
<div id="wrapper">
  <div id="header">
    <h1><a href="#"><img src="images/logo.png" alt="stexams"></a></h1>
   </div>
  <div id="content"> 
  	<div class="container">
  	 
    <div class="adminLogin">
   
		<table style="width: 70%;">
			<tbody><tr>
				<td style="width: 30%;vertical-align: top;">
						 <div id="adminsection">
						  
						   <div id="signin_menu" style="float: left;display:block;">
						      <h4>Administrator Login</h4>
						      
						      <form name="LoginForm" id="adminForm" method="post" action="./login.spring" onsubmit="return false;">
						        <p><label>Email:</label>
						        <input type="text" name="userName" size="30" value="" id="adminUserName" placeholder="Enter Email">
						        </p>
						        <p>
						        <label>Password: </label>
						        <input type="password" name="password" size="30" value="" id="adminpassword" placeholder="Enter Password">
							    </p>
						        <p class="remember">
						        <label></label>
						        <a href="forgotform.spring">Forgot Password?</a>
						        <button class="btn_green" style="float:right" onclick="login();">Login Button</button>
						   		</p>
						   								   		
							       <a href="#" class="btn_gray gmail_login" onclick="return showDialog()"><img src="images/google.jpg" height="16px">&nbsp;Sign In with Google</a>
							    
						        <a href="#" class="btn_blue" style="float:right">Sign Up</a>
						        
						   </form>
						    </div>
					</div>
				</td>
				<td style="width: 30%;">
					<div id="candidatesection">
				    	
    <form name="LoginForm" method="post" id="candidateForm" action="./login.spring">
     <div id="signin_menu" style="float: left;">
      <h4>Candidate Login</h4>
      
     <p>  
        <label>Email:</label>
        <input type="text" name="userName" id="userUserName" placeholder="Enter Email" size="30" value="">
        </p>
		<p>
        <label>Password:</label>
        <input type="password" name="password" id="userPassword" placeholder="Enter Password" size="30" value="">
        </p> 
		<p class="remember">
		 <label></label>
		 <a href="forgotpass.jsp">Forgot Password?</a>
        <input type="hidden" name="operation" id="operationId" value="user">                    
        <button class="btn_green" style="float:right" onclick="userLogin();">Login</button>
        </p>
        
    </div>
     </form>
    </div>
				</td>
			</tr>
		</tbody></table>
   </div>
   </div>
  </div>
  
   
<div class="copy">Copyright 2014 <a href="#" target="_blank">stexams.com</a> | <a href="#">Terms &amp; Conditions</a></div>
</div>
</body></html>