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
<title>数据展示软件</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/core.css">
<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">
<link rel="stylesheet" href="<%=path%>/resources/css/table_css_new.css">
<link rel="stylesheet" href="<%=path%>/resources/css/mytable.css">
<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/echartsjs/esl.js"></script>
<link href="<%=path%>/resources/loadmask/jquery.loadmask.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
<script type="text/javascript" src="<%=path%>/analyse_js/dealmissing.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/css/table.css"
	type="text/css"></link>
<link href="<%=path%>/resources/introjs/introjs.css" rel="stylesheet">
<style type="text/css">
div.tableList input{
	line-height: 30px;
	position: relative;
	top: -1px;
	font-size: 16px;
	font-family: '黑体';
	width: 250px;
}
</style>
<script type="text/javascript"
	src="<%=path%>/resources/introjs/intro.js"></script>
<%--<script type="text/javascript">
		jQuery(document).ready(function($) {
			introJs().start();
		});
	</script>
	--%>
<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script>
<script type="text/javascript" src="<%=path%>/dataSource/readFileDataset.js"></script>
</head>



<body id="all">

	<jsp:include page="../common/header.jsp" flush="true" />
	<jsp:include page="../common/leftmenu.jsp" flush="true" />
	<jsp:include page="../common/bottom.jsp" flush="true" />

	<div id="content_template" class="content">
		<div>
			<div class='opr_title_style' style="width: 160px">按范围筛选数据集</div>
			<HR SIZE=1 class='uploadhr' />
		</div>
		<div id="main">
			<div class='tableList' style="width:50%;margin-left:30%;">
				<div class='key_s'>数据集名称: </div>
				<div class="value_s" id='datasetname'><%=session.getAttribute("datasetname") %></div><br /><br />
				<div class='key_s'>数据集规模: </div>
				<div class='value_s' id='datasetrow'><%=session.getAttribute("totalrow") %>条</div><br /><br />
				<div class='key_s'>数据筛选方法</div>
				<div class='value_s'>
				
					<select name="method" id="method" data-step="5"
						data-intro="选择你需要使用的缺失值处理方法" data-position='right'>
						<option value="random">按百分比进行随机选择</option>
						<option value="index">按序号进行范围选择</option>
						<option value="per">按百分比进行范围选择</option>
					</select>&nbsp
					<div id="randomAll" style="display:inline-block">
						<input type="text" id="random" name="random" value=""
							style="width:25px;height:25px;font-size: 16px;"></input>%
					</div>
					<div id="indexAll" style="display:none">
						第<input type="text" id="indexStart" name="indexStart" value=""
							style="width:50px;height:25px;font-size: 16px;"></input>条~
						第<input type="text" id="indexEnd" name="indexEnd" value=""
							style="width:50px;height:25px;font-size: 16px;"></input>条
					</div>
					<div id="perAll" style="display:none">
						<input type="text" id="perStart" name="perStart" value=""
							style="width:25px;height:25px;font-size: 16px;"></input>%~
						<input type="text" id="perEnd" name="perEnd" value=""
							style="width:25px;height:25px;font-size: 16px;"></input>%
					</div>
				</div>
			</div>

			<div
				style='border-top:1px solid gray;
						position: relative;
						width: 40%;
						margin-left: 30%;
						padding-top:10px;
						text-align: right;
						margin-top: 15px;'>
				<button class="btn add" type="button" id="button"
					onclick="choose_range()" data-step="6"
					data-intro="参数设置完之后再确认进行缺失值处理">提交筛选</button>
			</div>
		</div>

		<div style='position: relative;'>
			<div>
				<div class='opr_title_style' style="width: 110px;top: 18px;">结果展示</div>
				<HR SIZE=1 class='uploadhr' />
			</div>
			<div>
				<div class='tableList' style='margin-left:25px;margin-right:25px'>
					<div id='result'
						style='height:500px;width:100%;display:inline-block;margin-bottom:5px;'>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var datasetName ="${sessionScope.datasetname}";
		//console.log(${sessionScope.datasetname});
		if(datasetName == "")  document.getElementById("datasetname").innerHTML="未知";
		else document.getElementById("datasetname").innerHTML = datasetName;
		console.log(document.getElementById("datasetname").innerHTML);
		var datasetRow = "${sessionScope.totalrow}";
		if(datasetRow == "") document.getElementById("datasetrow").innerHTML ="0条";
		else document.getElementById("datasetrow").innerHTML = datasetRow+"条";
		$(document).ready(function(){
		
			$("#method").change(function(){
				var method = $(this).children('option:selected').val();
				if(method=="random"){
					$("#randomAll").attr("style","display:inline-block");
					$("#perAll").attr("style","display:none");
					$("#indexAll").attr("style","display:none");
				}
				else if(method=="per"){
					$("#randomAll").attr("style","display:none");
					$("#indexAll").attr("style","display:none");
					$("#perAll").attr("style","display:inline-block");
				}else if(method=="index"){
					$("#randomAll").attr("style","display:none");
					$("#indexAll").attr("style","display:inline-block");
					$("#perAll").attr("style","display:none");
				
				
				}
			
			})
		
		
		});
	</script>

</body>
</html>