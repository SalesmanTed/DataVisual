<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>数据可视化平台</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/core.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">
	<link href="<%=path%>/resources/loadmask/jquery.loadmask.css" rel="stylesheet" type="text/css"/>	
	<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/d3.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/datavjs/deps/d3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/datavjs/deps/d3.csv.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/datavjs/deps/d3.layout.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/datavjs/deps/raphael.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/datavjs/deps/eventproxy.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/datavjs/deps/seajs/sea.js"></script>
	<script type="text/javascript" src="<%=path%>/user/login.js"></script>
	<link rel="stylesheet" href="<%=path%>/resources/css/table.css" type="text/css"></link>    
	<link rel="stylesheet" href="<%=path%>/resources/css/tab.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/resources/css/tic_tac_toe.css" type="text/css"></link>
	
  </head>
  
  <body>
      <jsp:include page="../common/header_Admin.jsp" flush="true"/>
	  <jsp:include page="../common/leftmenu_Admin.jsp" flush="true"/>
	  <jsp:include page="../common/bottom.jsp" flush="true"/>
	  <div id="content_template" class="content">
  		<div>
  			<div class='opr_title_style' style="width:110px">用户信息修改</div>
  			<HR SIZE=1 class='uploadhr' />
  			
  		</div>
  		<div id="main">
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">用户名称</div>
  					<div class="value_s">
  						<%=session.getAttribute("username") %>
  						<s:hidden id="username" name="username" value="" ></s:hidden>
  					</div>
  			</div>
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">账号密码</div>
  					  					
  					<div class="value_s">
  						<s:password id="password" name="password" class="password" value="" placeholder="请修改登录密码"/>
  					</div>
  					
  			</div>
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">确定密码</div>
  					<div class="value_s">
  						<s:password id="pwdconfirm" name="pwdconfirm" value="" placeholder="请再次填写密码" onkeyup="validate()"/> <span id="tishi"></span>
  					</div>
  			</div>
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">联系方式</div>
  					  					
  					<div class="value_s">
  					  					
  						<s:textfield id="userphone" name="userphone" value="" placeholder="请修改联系方式"/>

  					</div>
  					
  			</div>
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">工作单位</div>
  					<div class="value_s">
  						<s:textfield id="usercompany" name="usercompany" value="" placeholder="请修改工作单位"/>
  					</div>
  			</div>
  			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">性别</div>
  					<div class="value_s">
  						<select id="usersex" name="usersex" value=""/>
  							<option value="0">男</option>
  							<option value="1">女</option>
  						</select>
  					</div>
  			</div>		
  		</div>
  		<div style='border-top:1px solid gray;
							position: relative;
							width: 48%;
							margin-left: 25%;
							padding-top:10px;          
							text-align: right;
							margin-top: 15px;'>
			    	<button  class="btn add"  type="button" id="button" onclick="user_update()">提交</button>
			    </div>	  	
  	
	  </div>  
  </body>
  <script>
  		var name = "${sessionScope.user.username}";
  		document.getElementById("username").value = name;
  		var clas1 = document.getElementById("password").className;
  		console.log(clas1);
  		console.log(document.getElementById("username"));
  		var phone="${sessionScope.userphone}";
  		console.log(phone);
  		document.getElementById("userphone").value = phone;
  		var company="${sessionScope.usercompany}";
  		document.getElementById("usercompany").value = company;
  		var role = "${sessionScope.userrole}";
  		console.log(role);
  		if(role=="1") document.getElementById("userrole").options[1].selected = true;
  		else document.getElementById("userrole").options[0].selected = true;
  		var sex = "${sessionScope.usersex}";
  		if(sex=="0") document.getElementById("usersex").options[0].selected = true;
  		else document.getElementById("usersex").options[1].selected = true;
  		//return a;
  		function validate() {
    		var pwd1 = document.getElementById("password").value;
    		var pwd2 = document.getElementById("pwdconfirm").value;
 
<!-- 对比两次输入的密码 -->
    		if(pwd1 == pwd2)
   			{
      		  	document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
      		  	document.getElementById("button").disabled = false;
     		}
			else {
   		     	document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
    	   		document.getElementById("button").disabled = true;
    		}
		}

  </script>
</html>
