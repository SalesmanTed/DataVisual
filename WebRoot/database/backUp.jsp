<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
	<title>数据展示软件</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="数据可视化展示">
	<meta http-equiv="description" content="数据可视化展示">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/core.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/table_css_new.css">
	<link href="<%=path%>/resources/loadmask/jquery.loadmask.css" rel="stylesheet" type="text/css" />	
	
    
	<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="<%=path%>/database/database.js"></script>
	<style type="text/css">
		*{margin:0;padding:0;}  
		a{text-decoration:none;}  
		.btn_addPic{  
			display: block;  
			position: relative;  
			width: 100px;  
			height: 25px;  
			overflow: hidden;  
			border: 1px solid #EBEBEB;  
			background: none repeat scroll 0 0 #F3F3F3;  
			color: #999999;  
			cursor: pointer;
			text-align: center;
		}  
		.btn_addPic span{display: block;line-height: 25px;}  
		.btn_addPic em {  
			background:url(http://p7.qhimg.com/t014ce592c1a0b2d489.png) 0 0;  
			display: inline-block;  
			width: 18px;  
			height: 18px;  
			overflow: hidden;  
			margin: 0px 5px 2px 0;  
			line-height: 20em;  
			vertical-align: middle;  
		}  
		.btn_addPic:hover em{background-position:-19px 0;}  
		.filePrew {  
			display: block;  
			position: absolute;  
			top: 0;  
			left: 0;  
			width: 140px;  
			height: 25px;  
			font-size: 100px; /* 增大不同浏览器的可点击区域 */  
			opacity: 0; /* 实现的关键点 */  
			filter:alpha(opacity=0);/* 兼容IE */  
		}
		
		.yastyle,.filePrew{
			border:1px solid #ABADB3;
		
		}
		
		object{
			position: relative;
			top: -12px;
		}
		
		#f div{
			width:100%;
			color: #333;
			font-size: 14px;
			font-family: '微软雅黑';
			margin-bottom:5px;
			border-bottom: 1px solid rgba(26,122,166,1);
		}
		
		#f div a{
			color: red;
			float: right;
		}
		
		#f div a:HOVER{
			color: blue;
		}
		
		.icon{
			display: inline-block;
			width: 202px;
			height: 202px;     
			margin:5px;
			border:2px solid #E3E3E3;
		}   
		.icon:hover{
			border:2px solid #006DCC;
		}           
		
	</style>
    <link href="<%=path%>/resources/introjs/introjs.css" rel="stylesheet">
	
</head>

<body>

	<jsp:include page="../common/header_Admin.jsp" flush="true"/>
	<jsp:include page="../common/leftmenu_Admin.jsp" flush="true"/>
	<jsp:include page="../common/bottom.jsp" flush="true"/>
	
	<div id="content_template" class="content">
		<div>
			<div class='opr_title_style'>数据备份</div>
			<HR SIZE=1 class='uploadhr'/>
		</div>
		<div id="main">
			<div class='tableList' style="width:50%;margin-left:30%;">
  					<div class="key_s">选择备份</div>
  					<div class="value_s">
   					    <select id="kind" name="kind" value=""/>
  							<option value="0">自动备份</option>
  							<option value="1">手动备份</option>
  						</select>
   					</div>
  			</div>
  			<div style='border-top:1px solid gray;
							position: relative;
							width: 48%;
							margin-left: 25%;
							padding-top:10px;          
							text-align: right;
							margin-top: 15px;'>
			    	<button  class="btn add"  type="button" id="button" onclick="backUp()">备份</button>
			    	<button  class="btn remove"  type="button" id="button" onclick="location.href='fileDatasetList'">退出</button>
		   </div>
		</div>
	</div>
	     
	<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
	<script type="text/javascript" src="<%=path%>/dataSource/upload.js"></script>
	<script type="text/javascript">
		 	    
	</script>
	<script type="text/javascript" src="<%=path%>/resources/introjs/intro.js"></script>	
</body>
</html>