<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>3D Model Management System - Login</title>
<meta name="description" content="">
<meta name="author" content="templatemo">


<link href="static\css\font-awesome.min.css" rel="stylesheet">
<link href="static\css\bootstrap.min.css" rel="stylesheet">
<link href="static\css\templatemo-style.css" rel="stylesheet">
<script src="static\js\jQuery/jquery-2.1.4.min.js"></script>
<script src="static\js\bootstrap\js\bootstrap.min.js"></script>
<script src="static\js\bootstrap\js\bootstrap-paginator.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body class="light-gray-bg">
	<div class="templatemo-content-widget templatemo-login-widget white-bg" style="margin-top: 15%;">
		<header class="text-center">
			<h1>Management System</h1>
		</header>
		

			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<input id = "userInput" type="text" name="userName" class="form-control"
						placeholder="admin@vr-kb.cn">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-key fa-fw"></i>
					</div>
					<input id = "passwordInput" type="password" name="userPassword" class="form-control"
						placeholder="******">
				</div>
			</div>
	
			<div class="form-group">
				<div id="errorMsg"><span style="color: red;"></span></div>
			</div>
			<div class="form-group">
				<button id="btnsubmit"  class="templatemo-blue-button width-100">登录</button>
			</div>
		
	</div>
	<div
		class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
		<p>
			若是没有账号，请 <strong><a href="#"
				class="blue-text">联系管理员</a></strong>
		</p>
	</div>


<script type='text/javascript'>    
	var test1;
	 var urlRootContext = (function () {
         var strPath = window.document.location.pathname;
         var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
         return postPath;
     })();
	

	function LoginVerfied(employeeNO,password) {
	 
	var url =  urlRootContext + "/loginJSON.do";   
	var datas = {'EmployeeNO' : employeeNO,'Password':password};
	console.log("parameters:"+datas.valueOf());
	 $(function (){
		 $.ajax({
			type : 'POST',
	        //contentType : 'application/json',
	        url : url,
	        async : false,
	        dataType : 'json',
	        data : datas,
	        success : function(data) {
	        	if (data.flag == 0) {
	        		
	        		console.log("login successed");
	                $("#errorMsg").html(data.message);
	        		window.location.href="DataList.jsp";
	                }
	        	else {             	            	
	        		
	        		  $("#errorMsg").html("<span style='color: red;'>"+data.message+"</span>");
       	    }
	        	
	        },
	        error : function() {
	        	  //document.getElementById('errorMsg').innerHTML="<span style='color: red;'>login Failed</span>";	
	        	  $("#errorMsg").html("<span style='color: red;'>login Failed</span>");	
	        }
	        
		 })
	    });
	 
	}
	 
	 $("#btnsubmit").bind("click",function(){
     	var employeeNO = $("#userInput").val();	
     	var password=$("#passwordInput").val();	
     	LoginVerfied(employeeNO,password);
     });
	
</script>
	  




</body>
</html>