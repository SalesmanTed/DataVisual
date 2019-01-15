<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<title>数据可视化平台</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/core.css">
<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">
<link href="<%=path%>/resources/loadmask/jquery.loadmask.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script>
<script type="text/javascript" src="<%=path%>/resources/d3.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/d3.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/d3.csv.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/d3.layout.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/raphael.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/eventproxy.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/datavjs/deps/seajs/sea.js"></script>
<script type="text/javascript" src="<%=path%>/user/login.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/css/table.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=path%>/resources/css/tab.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=path%>/resources/css/tic_tac_toe.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=path%>/example/css/main.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=path%>/example/css/bootstrap.css"
	type="text/css"></link>
</head>

<body>
	<jsp:include page="../common/header.jsp" flush="true" />
	<jsp:include page="../common/leftmenu.jsp" flush="true" />
	<jsp:include page="../common/bottom.jsp" flush="true" />
	<div id="content_template" class="content">
		<div class="chart-list-panel">
			<div>
				<div class='opr_title_style' style="width:100px">折线图</div>
				<HR SIZE=1 class='uploadhr' />

			</div>
			<br />
			<div class="row" id="chart-row-line">
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Basic_Line_Chart/Base_Line_Chart.jsp">
							<h4 class="chart-title">基础折线图</h4> <img
							class="chart-area"
							src="<%=path%>/resources/images/example/line-simple.png">
						</a>
					</div>
				</div>

				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Basic_Area_Chart/Basic_Area_Chart.jsp">
							<h4 class="chart-title">基础波形图</h4> <img
							class="chart-area"
							src="<%=path%>/resources/images/example/area-basic.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Smoothed_Line_Chart/Smoothed_Line_Chart.jsp">
							<h4 class="chart-title">平滑折线图</h4> <img
							class="chart-area"
							src="<%=path%>/resources/images/example/line-smooth.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Stacked_Area_Chart/Stacked_Area_Chart.jsp">
							<h4 class="chart-title">堆叠波形图</h4> <img
							class="chart-area"
							src="<%=path%>/resources/images/example/area-stack.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Stacked_Line_Chart/Stacked_Line_Chart.jsp">
							<h4 class="chart-title">堆叠折线图</h4> <img
							class="chart-area"
							src="<%=path%>/resources/images/example/line-stack.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Rainfall/Rainfall.jsp">
							<h4 class="chart-title">雨量流量关系面积图</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/area-rainfall.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Rainfall_and_Water_Flow/Rainfall_and_Water_Flow.jsp">
							<h4 class="chart-title">雨量流量关系折线图</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/grid-multiple.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Large_Scale_Area_Chart/Large_Scale_Area_Chart.jsp">
							<h4 class="chart-title">大数据量面积图</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/area-simple.png">
						</a>
					</div>
				</div>
				
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Dynamic_Data+Time_Axis/Dynamic_Data+Time_Axis.jsp">
							<h4 class="chart-title">动态数据+时间坐标轴</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/dynamic-data2.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Temperature_Change_in_the_Coming_Week/Temperature_Change_in_the_Coming_Week.jsp">
							<h4 class="chart-title">气温变化图</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/line-marker.png">
						</a>
					</div>
				</div>
				
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Two_Value-Axes_in_Polar_1/Two_Value-Axes_in_Polar_1.jsp">
							<h4 class="chart-title">极坐标双数值轴演示图1</h4>
							<img class="chart-area" 
							src="<%=path%>/resources/images/example/line-polar.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Two_Value-Axes_in_Polar_2/Two_Value-Axes_in_Polar_2.jsp">
							<h4 class="chart-title">极坐标双数值轴演示图2</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/line-polar2.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Distribution_of_Electricity/Distribution_of_Electricity.jsp">
							<h4 class="chart-title">用电量分布图</h4>
							<img class="chart-area"
							src="<%=path%>/resources/images/example/line-sections.png">
						</a>
					</div>
				</div>
				<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
					<div class="chart">
						<a target="_blank" class="chart-link"
							href="/DataVisual/example/Step_Line/Step_Line.jsp">
							<h4 class="chart-title">等线图</h4>
							<img class="chart-area" 
							src="<%=path%>/resources/images/example/line-step.png">
						</a>
					</div>
				</div>
		</div>
	</div>
</body>
<script>

  </script>
</html>
