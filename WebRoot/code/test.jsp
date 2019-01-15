<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据可视化平台</title>

	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/core.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
	<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">

	
	<link href="<%=path%>/resources/loadmask/jquery.loadmask.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
	
	<link rel="stylesheet" href="<%=path%>/resources/js/easydialog/easydialog.css" type="text/css" />
	
	<script type="text/javascript" src="<%=path%>/resources/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
	
	
	<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script> 
	
	<script type="text/javascript" src="<%=path%>/resources/js/easydialog/easydialog.min.js"></script>
	
	<script src="<%=path%>/resources/js/jsCodeFormat/codemirror.js"></script>
    <script src="<%=path%>/resources/js/jsCodeFormat/javascript.js"></script>
    <link href="<%=path%>/resources/js/jsCodeFormat/codemirror.css" rel="stylesheet">
    <link href="<%=path%>/resources/js/jsCodeFormat/monokai.css" rel="stylesheet">


  </head>
  
  <body>
    		
  </body>
  <script src="<%=path%>/resources/echartsjs/echarts-plain.js"></script>
  <script type="text/javascript" src="<%=path%>/analyse_js/upload_network.js"></script>
  <script src="<%=path%>/resources/js/d3.v2.js"></script>
  <script src="<%=path%>/resources/js/jsCodeFormat/jsonFormat.js"></script>
  <script src="<%=path%>/resources/js/jsCodeFormat/codeLineFormat.js"></script>
  <script type="text/javascript" src="<%=path%>/analyse_js/constNetwork.js"></script>
  
</html>
