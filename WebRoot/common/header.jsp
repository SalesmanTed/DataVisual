<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" href="<%=path%>/resources/js/Jcrop/css/jquery.Jcrop.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/resources/js/easydialog/easydialog.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/resources/css/cutAndCrop.css" type="text/css" />

<style>
	li{  
        list-style-type: none;/* 去掉li前的点 */  
        float: left;/*将li设置成做浮动，变为联动*/  
    }
    #ulid{/*设置导航栏的框框*/  
            /*margin: 30px auto;/*框框整体的位置，30px是指离网页的顶部和下部的距离，auto控制的是左右距离为自动调节*/  
            width: 700px;/*框框的宽度*/  
            height: 50px;/*框框的长度*/  
            padding: 0px;/*将框框的padding设置为零，不然会导致框框里的内容与框边缘有间隔*/  
            left:300px;
            top:20px:
        }  
	.logoIcon{
		position: absolute;
		left: 17px;
		top: 10px;
		width:80px;
		height:53px;
		/*background:url(<%=path%>/resources/images/logo1.png);*/
		background-repeat:no-repeat;
	}            
	#logo{
		width: 300px;
		height: 80px;
		background: url(<%=path%>/resources/images/title_02.png);
		-moz-background-size:300px 80px; /* 老版本的 Firefox */
		background-size:300px 80px;
		background-repeat:no-repeat;     
		background-origin:content-box;
		background-position:0px -8px;
		position: absolute;     
		left: 85px;     
	}
	.tool{  
        display: block;/*将a变成块状*/  
        width: 100px;/*设置块的宽度*/  
        height: 40px;/*设置块的长度*/ 
        font-family: Microsoft Yahei;  
        line-height: 50px;/*设置字体在块中的高度*/  
          
        margin: 15px 0px;/*块里的高宽通过margin设置*/  
           
        text-align: center;/*字体居中*/  
        text-decoration: none;/*去掉下划线*/  
        font-size: 15px; 
        top:10px; 
    }   
	.toolLogo{
		width: 500px;       
		height: 70px;     
		position: absolute;
		top: 0px;
		left: 300px;     
	}	    
	.toolBar{
		width: 500px;       
		height: 70px;     
		position: absolute;
		top: 0px;
		right: 40px;     
	}	
	.userGuide{
		width: 90px;    
		height: 70px;     
		position: absolute;
		right: 100px;
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.2), 0px 0 0px rgba(255, 255, 255, 0.2);
	}
	.userGuide:hover{
		width: 90px;    
		height: 70px;     
		position: absolute;
		right: 100px;
		cursor:pointer;
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.2), 0px 0 0px rgba(255, 255, 255, 0.2);
		background:#3A99D3;
		background: -webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0)), to(rgba(255, 255, 255, 0.5)));
		background: -moz-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));
		background: -o-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));  
	}
	.screenShot{
		width: 100px;
		height: 70px;
		position: absolute;
		top: 0px;
		right: 190px;      
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.2), 0px 0 0px rgba(255, 255, 255, 0.2);
	}
	.screenShot:hover{
		width: 100px;
		height: 70px;
		position: absolute;
		top: 0px;
		right: 190px;      
		cursor:pointer;
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.2), 0px 0 0px rgba(255, 255, 255, 0.2);
		background:#3A99D3;
		background: -webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0)), to(rgba(255, 255, 255, 0.5)));
		background: -moz-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));
		background: -o-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));        
	}
	.exit{
		width: 90px;
		height: 70px;         
		position: absolute;    
		right: 10px;
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.6), 1px 0 1px rgba(255, 255, 255, 0.2);
	}  
	.exit:hover{
		width: 90px;
		height: 70px;         
		position: absolute;    
		right: 10px;
		cursor:pointer;
		box-shadow: -1px 0 1px rgba(255, 255, 255, 0.2), 0 0px 0px rgba(255, 255, 255, 0), 0 0px 0px rgba(255, 255, 255, 0.6), 1px 0 1px rgba(255, 255, 255, 0.2);
		background:#3A99D3;
		background: -webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0)), to(rgba(255, 255, 255, 0.5)));
		background: -moz-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));
		background: -o-linear-gradient(top, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5));  
	}
	   
</style>
	
<div id="commonheader" class="content">
	<div class="logoIcon"></div>
	<div id='logo'>
	</div>
	<div id='toolLogo'style="width:700px;       
		height:70px;     
		position: absolute;
		left: 500px;">
		<ul id="ulid">
		<li><a class="tool" href="dataSource/datasetUpload.jsp"><img src="<%=path%>/resources/images/toolIcon/upload.png"/></a></li>
		<li><a class="tool" href="datamining/choosebyrange.jsp"><img src="<%=path%>/resources/images/toolIcon/search.png"/></a></li>
		<li><a class="tool" href="datamining/statInfo.jsp" ><img src="<%=path%>/resources/images/toolIcon/statistic.png"/></a></li>
		<li><a class="tool" href="datamining/apriori.jsp" ><img src="<%=path%>/resources/images/toolIcon/association.png"/></a></li>
		<li><a class="tool" href="datamining/kmeans.jsp" ><img src="<%=path%>/resources/images/toolIcon/cluster.png"/></a></li>
		<li><a class="tool" href="datamining/mynetwork.jsp"><img src="<%=path%>/resources/images/toolIcon/network.png"/></a></li>
		<li><a class="tool" href="example/index.jsp"><img src="<%=path%>/resources/images/toolIcon/toolbox.png"/></a></li>
		
		
		</ul>
	</div>
	<div class="toolBar">
		<div class="userGuide"><a href="javascript:userguide();"><img src="<%=path%>/resources/images/toolBar/userGuide.png"/></a></div>
		<div class="screenShot"><img src="<%=path%>/resources/images/toolBar/screenShot.png"/></div>
		<div class="exit"><a href="javascript:void(0)" onclick="logout()"><img src="<%=path%>/resources/images/toolBar/exit.png"/></a></div>
	</div>
</div>

<script type="text/javascript" src="<%=path%>/resources/js/canvg/rgbcolor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/canvg/StackBlur.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/canvg/canvg.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/canvg/StackBlur.js"></script>

<%--    <script type="text/javascript" src="<%=path%>/resources/js/imgSave/jquery-1.7.2.min.js"></script>--%>
	<script type="text/javascript" src="<%=path%>/resources/js/imgSave/html2canvas.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/imgSave/jquery.plugin.html2canvas.fix.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/Jcrop/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/easydialog/easydialog.min.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/cutAndCrop.plugin.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/cutAndCrop.js"></script>
	<script type="text/javascript">
		function userguide(){
			introJs().start();
		}
		function logout(){
			event.returnValue = confirm("你确认要退出吗？");
    		console.log(event.returnValue);
    		if(event.returnValue){
    			window.location.href="logout";
    		}
			
		}
	</script>
