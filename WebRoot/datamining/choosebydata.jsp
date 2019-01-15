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
<title>数据展示软件</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/resources/core.css">
<link rel="stylesheet" href="<%=path%>/resources/css/header.css">
<link rel="stylesheet" href="<%=path%>/resources/css/forms.css">
<link rel="stylesheet" href="<%=path%>/resources/css/table_css_new.css">
<link rel="stylesheet" href="<%=path%>/resources/css/mytable.css">
<script type="text/javascript" src="<%=path%>/resources/jquery-1.8.0.js"></script>
<link href="<%=path%>/resources/loadmask/jquery.loadmask.css"
	rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/resources/echartsjs/esl.js"></script>
<script type="text/javascript"
	src="<%=path%>/resources/loadmask/jquery.loadmask.min.js"></script>
<script type="text/javascript" src="<%=path%>/analyse_js/dealmissing.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/css/table.css"
	type="text/css"></link>
<link href="<%=path%>/resources/introjs/introjs.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=path%>/resources/introjs/intro.js"></script>
	<script type="text/javascript" src="<%=path%>/dataSource/readFileDataset.js"></script>	
<%--<script type="text/javascript">
		jQuery(document).ready(function($) {
			introJs().start();
		});
	</script>
	--%>
<script type="text/javascript" src="<%=path%>/resources/common/core.js"></script>

</head>

<body id="all">
	<jsp:include page="../common/header.jsp" flush="true" />
	<jsp:include page="../common/leftmenu.jsp" flush="true" />
	<jsp:include page="../common/bottom.jsp" flush="true" />

	<div id="content_template" class="content">
		<div>
			<div class='opr_title_style' style="width: 180px">按数据值筛选数据集</div>
			<HR SIZE=1 class='uploadhr' />
		</div>
		<div id="main">
			<div class='tableList' style="width:20%;margin-left:20%;float:left;">
				<div class='key_s'>数据集名称:</div>
				<div class="value_s" id='datasetname'><%=session.getAttribute("datasetname")%></div>
				<br /> <br />
				<div class='key_s'>数据集规模:</div>
				<div class='value_s' id='datasetrow'><%=session.getAttribute("totalrow")%>条
				</div>
				<br />
			</div>
			<div class='tableList' style="width:40%;margin-left:40%;">
				<br />
				<div id="vari">
					<s:iterator value="#session.coltypes" id="s" status="st">
						<input id="${st.index + 1}" value="<s:property value='s'/>"
							style="display:none"></input>
					</s:iterator>
					<div id="part1" class="part">
						<div class='key_s' >筛选变量1:</div>
						<div id="value_s1"class='value_s'>
							<select name="dataName1" id="dataName1" class="dataName">
								<s:iterator value="#session.colnames" id="s" status="st">
									<option value="${st.index + 1}"><s:property value='s'/></option>
								</s:iterator>
							</select>

							<button class="btn add" type="button" id="add1"
								onclick="addinput('range1')">添加筛选范围</button>
							<button class="btn remove" type="button" id="remove1"
								onclick="removediv('part1')">删除变量</button>
							<br />
							<div id="range1" style="display:none"></div>
						</div>
					</div>
				</div>
				<div
					style='
						position: relative;
						width: 30%;
						margin-left: 25%;
						padding-top:10px;
						text-align: right;
						margin-top: 15px;'>
					<button class="btn add" type="button" id="button"
						onclick="adddiv()" data-step="6" data-intro="参数设置完之后再确认进行缺失值处理">添加筛选变量</button>
				</div>
			</div>
			<br/>	
			<div
				style='border-top:1px solid gray;
						position: relative;
						width: 50%;
						margin-left: 25%;
						padding-top:10px;
						text-align: right;
						margin-top: 15px;'>
				<button class="btn add" type="button" id="button"
					onclick="choose_data()" data-step="6"
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
		//console.log(document.getElementById("datasetname").innerHTML);
		var datasetRow = "${sessionScope.totalrow}";
		if(datasetRow == "") document.getElementById("datasetrow").innerHTML ="0条";
		else document.getElementById("datasetrow").innerHTML = datasetRow+"条";
		//console.log(datasetRow);
		var num = $('.dataName').size();
		//console.log(num);
		$('#dataName1').change(function(){
			var value = $(this).children('option:selected').text();
			//console.log(value);
		})
		function adddiv() {
			var num = $('.dataName').size();
			//console.log(num);
			var selectName ="dataName"+(num+1);
			var rangeName = "range"+(num+1);
			var divName = "part"+(num+1);
			var testName ="筛选变量"+(num+1)+":";
			var buttonName = "add"+(num+1);
			var buttonRemove = "remove"+(num+1);
			var empty = document.createElement("br");
			var valueName = "value_s"+(num+1);
			var vari = document.getElementById("vari");
			var newPart = document.createElement("div");
			vari.appendChild(empty);
			vari.appendChild(newPart);//添加div-partn
			newPart.setAttribute("id",divName);
			newPart.setAttribute("class","part");  	
			var key_s = document.createElement("div");//添加partn中的key_s
			newPart.appendChild(key_s);
			key_s.innerHTML = testName;
			key_s.className="key_s";
			var value_s = document.createElement("div");//添加partn中的value_s
			newPart.appendChild(value_s);
			value_s.className = "value_s";
			value_s.setAttribute("id",valueName);
			var newSelect = document.createElement("select");//添加value_s中的select
			value_s.innerHTML+="\n";
			value_s.appendChild(newSelect);
			
			newSelect.setAttribute("id",selectName);
			newSelect.setAttribute("name", selectName);
			newSelect.setAttribute("class", "dataName");
			
			newSelect.innerHTML+="<s:iterator value='#session.colnames' id='s' status='st'><option value='${st.index + 1}'><s:property value='s'/></option></s:iterator>";
			value_s.innerHTML+="\n<button class='btn add' type='button' id='"+buttonName+"' onclick='addinput(\""+rangeName+"\")'>添加筛选范围</button>\n<button class='btn remove' type='button' id='"+buttonRemove+"'onclick='removediv(\""+divName+"\")'>删除变量</button><br/>";
			value_s.innerHTML+="<div id='"+rangeName+"' style='display:none'></div>"
		}
		function removediv(id) {
			var list = document.getElementsByClassName("part");
			
			var idcopy = id;
			var h = idcopy.replace("part","");
			var j = parseInt(h)-1;
			if(list.length==1){
				
			
			}
			//console.log(j);
			for(var i = j+1 ; i<list.length; i++)
			{	
				//标签名定义部分
				var partName = "part"+i;
				var value_sName = "value_s"+i;
				var dataName = "dataName"+i;
				var rangeName = "range"+i;
				var addName = "add"+i;
				var removeName = "remove"+i;
				var startName = "start"+i;
				var innerName = "筛选变量"+i+":";
				//获取待修改的标签
				list[i].id = partName;
				var key_s = document.createElement("div");
				key_s.className = "key_s";
				key_s.innerHTML +=innerName;
				console.log(key_s);
				list[i].children[0].innerHTML = innerName;
				list[i].children[1].id = value_sName;
				list[i].children[1].children[0].id = dataName;
				if(list[i].children[1].children[0].tagName=="SELECT"){
					list[i].children[1].children[0].name = dataName;
				}
				list[i].children[1].children[1].id = addName;
				list[i].children[1].children[1].setAttribute("onclick","addinput('"+rangeName+"')");
				list[i].children[1].children[2].id = removeName;
				list[i].children[1].children[2].setAttribute("onclick","removediv('"+partName+"')");
				list[i].children[1].children[4].id = rangeName;
				var node = list[i].children[1].children[4].children;
				for(var k = 0 ; k<node.length;k++){
					if(node[k].tagName=="BR") continue;
					else {
						var start = "start"+k;
						var remove = "remove"+k;
						var index = "index"+k;
						node[k].className = rangeName;
						node[k].children[0].id = rangeName+start;
						node[k].children[0].name = rangeName+start;
						if(node[k].children.length == 2){
							node[k].children[1].id = rangeName+remove;
							node[k].children[1].setAttribute("onclick","removeinput('"+index+"','"+rangeName+"','S')");
						}
						else{
							node[k].children[1].id = rangeName+remove;
							node[k].children[1].name = rangeName+remove;
							node[k].children[2].id = rangeName+remove;
							node[k].children[2].setAttribute("onclick","removeinput('"+index+"','"+rangeName+"','N')");
						}
						 
						
					}
					
				}
				
				
			}
			if(j!=0){
				list[j].previousElementSibling.parentNode.removeChild(list[j].previousElementSibling);
			}
			if(j==0){
				if(list[j].previousElementSibling!=null) 
				{
					if(list[j].previousElementSibling.tagName=="BR"){
						list[j].previousElementSibling.parentNode.removeChild(list[j].previousElementSibling);
						
					}
				}
				if(list[j].nextElementSibling!=null) 
				{
					if(list[j].nextElementSibling.tagName=="BR"){
						list[j].nextElementSibling.parentNode.removeChild(list[j].nextElementSibling);
						
					}
				}
			}
			
			list[j].parentNode.removeChild(list[j]);
			
		}
		function addinput(id) {
			
			
			var range = document.getElementById(id);
			var num = document.getElementsByClassName(id).length;
			//console.log(num);
			var vari = document.getElementById("vari");
			
			//console.log(document.getElementsByClassName(id));
			var idcopy =id;
			idcopy = idcopy.replace("range","");
			var indexNum = parseInt(idcopy);
			var divName = "part"+indexNum;
			var valueName = "value_s"+indexNum;
			//console.log(indexNum);
			var dataName = "dataName"+indexNum;
			var buttonName = "add"+indexNum;
			var buttonRemove = "remove"+indexNum;
			var myselect=document.getElementById(dataName);
			if(myselect.tagName=="SELECT"){
				//console.log(myselect.tagName);
				var index=myselect.selectedIndex;
				var test =  myselect.options[index].value;
				var value = document.getElementById(test).value;
				var myText =  myselect.options[index].text;
				var myValue =  myselect.options[index].value;
				//console.log(myselect);
				myselect.parentNode.removeChild(myselect);
				//console.log(myselect);
				var newDiv = document.createElement("div");
				var value_s = document.getElementById(valueName);
				var remove = document.getElementById(buttonRemove);
				var button =   document.getElementById(buttonName);
				$("#"+valueName).empty();
				value_s.innerHTML+="\n";
				value_s.innerHTML += "&nbsp";
				value_s.append(newDiv);
				newDiv.setAttribute("id",dataName);
				newDiv.setAttribute("class","dataName");
				newDiv.setAttribute("name",value);
				newDiv.setAttribute("style","display:inline-block");
				newDiv.innerHTML += myText;
				value_s.innerHTML += "&nbsp&nbsp";
				
				value_s.append(button);
				value_s.append(remove);
				var empty = document.createElement("br");
				value_s.innerHTML+="<br\>"
				value_s.append(range);
				
						
			}
			else {
			//console.log(myselect);
			   var value = $("#"+dataName).attr("name");
			
			}
			//console.log(value);
			var testName = "筛选范围"+(num+1);
			var start = "start"+(num+1);
			var end = "end"+(num+1);
			var indexName = "index"+(num+1);
			var removeName = "remove"+(num+1);
			range.style.display="inline-block";
			if(value=="S"){
				var empty = document.createElement("br");
				range.append(empty);
				var indexDiv = document.createElement("div");
				range.append(indexDiv);
				indexDiv.setAttribute("id", indexName);
				indexDiv.setAttribute("class", id);
				indexDiv.innerHTML+= "&nbsp&nbsp&nbsp&nbsp&nbsp字符型变量"+testName+"&nbsp";
				var newSInput = document.createElement("input");
				indexDiv.append(newSInput);
				newSInput.setAttribute("style", "width:50px;display:inline;");
				newSInput.setAttribute("id",id+start);
				newSInput.setAttribute("value","");
				newSInput.setAttribute("name",id+start);
				var removeButton = document.createElement("button");
				indexDiv.innerHTML+="&nbsp";
				indexDiv.append(removeButton);
				removeButton.setAttribute("class","btn remove");
				removeButton.setAttribute("type","button");
				removeButton.setAttribute("id",id+removeName);
				removeButton.setAttribute("onclick","removeinput('"+indexName+"','"+id+"','S')");
				removeButton.innerHTML+="删除";
				
				//indexDiv.innerHTML +="<button class='btn add' type='button' id='"+removeName+"'onclick='removeinput('"+id+"','"+indexName+"')'>删除筛选范围</button>";	
				
			}
			else if(value=="N"){
				var empty = document.createElement("br");
				range.append(empty);
				var indexDiv = document.createElement("div");
				range.append(indexDiv);
				indexDiv.setAttribute("id", indexName)
				indexDiv.setAttribute("class", id);
				indexDiv.innerHTML+= "&nbsp&nbsp&nbsp&nbsp&nbsp数值型变量"+testName+"&nbsp";
				var newSInput = document.createElement("input");
				var newEInput = document.createElement("input");
				indexDiv.append(newSInput);
				newSInput.setAttribute("id",id+start);
				newSInput.setAttribute("name",id+start);
				newSInput.setAttribute("value","");
				newSInput.setAttribute("style", "width:50px;display:inline;");
				
				indexDiv.innerHTML+="—";
				indexDiv.append(newEInput);
				
				newEInput.setAttribute("id",id+end);
				
				newEInput.setAttribute("name",id+end);
				newEInput.setAttribute("value","");
				newEInput.setAttribute("style", "width:50px;display:inline;");
				var removeButton = document.createElement("button");
				indexDiv.innerHTML+="&nbsp";
				indexDiv.append(removeButton);
				removeButton.setAttribute("class","btn add");
				removeButton.setAttribute("type","button");
				removeButton.setAttribute("id",id+removeName);
				removeButton.setAttribute("onclick","removeinput('"+indexName+"','"+id+"','N')");
				removeButton.innerHTML+="删除筛选范围";
				//range.innerHTML+="<input type='text' id='"+start+"' name='"+start+"' value=''style='width:50px;display:inline;'></input>~<input type='text' id='"+end+"' name='"+end+"' value=''style='width:50px;display:inline;'></input></div>"
			}
			//console.log(document.getElementsByClassName('range2'));
		}
		function removeinput(id , index, kind){//index = 标签的class,id =标签的id 
			//console.log(id);
			var num = $("."+index).size();
			
			var idcopy = id;
			var h = idcopy.replace("index","");
			var j = parseInt(h);
			var list = document.getElementsByClassName(index);
			var empty = document.getElementsByTagName("br");
			//console.log(list.childNode);
			//console.log(j);
			//console.log(list);
			//console.log(list[j-1]);	
			var parentId = document.getElementById(index);
			//console.log(list[j-1].parentNode);
			
			//console.log(parentId);
			var cou =j-1;
			
			
			for(var i=0;i<empty.length;i++){
				if(empty[i].parentNode == parentId&&cou==0)
				{
					//console.log(empty[i].parentNode);
					empty[i].parentNode.removeChild(empty[i]);
					break;
				}else if(empty[i].parentNode == parentId&&cou>0){
					cou--;
				}
				
			}
			//console.log(j);
			for(var i = j; i < num ; i++){
				var changeId = "index"+i;
				//console.log(i);
				//console.log(list[i]);
				list[i].id = changeId;
				if(kind=="S"){
					var startId = index+"start"+(i+1);
					var removeId = index+"remove"+(i+1);
					var testname = "筛选范围"+(i);
					
					var start = document.getElementById(startId);
					var startValue = start.value;
					start.setAttribute("value",startValue);
					var button = document.getElementById(removeId);
					list[i].innerHTML ="&nbsp&nbsp&nbsp&nbsp&nbsp字符型变量"+testname+"&nbsp";
					list[i].append(start);
					list[i].innerHTML+="&nbsp";
					list[i].append(button);
					startId = index+"start"+(i);
					//endId = index+"end"+(i);
					removeId = index+"remove"+(i);
					list[i].children[0].id=startId;
					list[i].children[1].id = removeId;
					list[i].children[1].setAttribute("onclick","removeinput('"+changeId+"','"+index+"','"+kind+"')");
				}
				else{
				
				var startId = index+"start"+(i+1);
				var endId = index+"end"+(i+1);
				var removeId = index+"remove"+(i+1);
				var testname = "筛选范围"+(i);
				//list[i].firstElementChild.data="数值型变量"+testa+" — 删除筛选范围"
				
				
				//change.id = 
				//var indexRange = document.getElementById(changeId);
				//console.log(i);
				//console.log(list[i]);
				
				var start = document.getElementById(startId);
				var startValue = start.value;
				//console.log(startValue);
				start.setAttribute("value",startValue);
				//console.log(start);
				
				var end = 	document.getElementById(endId);
				var endValue = end.value;
				//console.log(endValue);
				end.setAttribute("value",endValue);
				//console.log(end);
				
				var button = document.getElementById(removeId);

				list[i].innerHTML ="&nbsp&nbsp&nbsp&nbsp&nbsp数值型变量"+testname+"&nbsp";
				
				
				list[i].append(start);
				
				list[i].innerHTML+="—";
				list[i].append(end);
				
				list[i].innerHTML+="&nbsp";
				list[i].append(button);
				startId = index+"start"+(i);
				endId = index+"end"+(i);
				removeId = index+"remove"+(i);
				list[i].children[0].id=startId;
				list[i].children[1].id =endId;
				list[i].children[2].id = removeId;
				list[i].children[2].setAttribute("onclick","removeinput('"+changeId+"','"+index+"','"+kind+"')");
				
				}
				//var changeId = "index"+(i-1);
				
			}
			//console.log(list[j-1]);
			list[j-1].parentNode.removeChild(list[j-1]);
			if(list.length==0) $("#"+index).empty();
			//console.log(list[j-1]);
			
		}
		
		
	</script>

</body>
</html>