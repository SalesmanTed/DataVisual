function choose_range()
{
	var method = $('#method').val();
	var start = null;
	var end = null;
	if(method == "random"){
		start = $('#random').val();
	}else if(method == "index"){
		start = $('#indexStart').val();
		end = $('#indexEnd').val();
	}else{
		start = $('#perStart').val();
		end = $('#perEnd').val();
	}
	console.log(method);
	console.log(start);
	console.log(end);
	$("#main").mask("筛选处理中，请稍后...");
	$.post("chooseData",{
		method: method,
		dataStart: start,
		dataEnd: end
	},
	function(success,data){
		$("#result").empty();
		var obj = eval(data);
		var totalrow = obj.totalrow;
		var datashow = obj.datashow;
		console.log(totalrow);
		console.log(datashow);
		
		var datatable = "";
		var datashow = obj.datashow;
		var datatable = "<div class='more'><div><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showStatic()'>统计信息展示</button><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showData()''>详细数据展示</button><div style='display:inline-block;margin-right:15px;position: relative;top: -4px;'><label>选择格式:</label><select id='dstype'><option value='txt' selected='selected'>.txt</option><option value='xls'>.xls</option><option value='csv'>.csv</option></select><a id='xiazaidstype'>下载</a></div><img src='resources/images/more.png'/><a href=dataListShow?totalrow=" + obj.totalrow + "&pageno=1 target='_blank'>显示更多数据</a></div></div><div id='showStatic' style='display:none'></div><div id='showData' style='display:block'><table width='100%' class='table table-hover'><thead><tr>";
		var datacolnames = obj.datacolnames;
		console.log(datacolnames);
		for (var i = 0; i < datacolnames.length; i++) {
			datatable = datatable + "<th>" + datacolnames[i] + "</th>";

		}
		datatable += "</tr></thead>";
		for (var i = 0; i < datashow.length; i++) {
			//console.log(parseFloat(datashow[i][4]));
			datatable = datatable + "<tr><td>" + (i + 1) + "</td>";
			for (var j = 0; j < datashow[i].length; j++) {
				datatable = datatable + "<td>" + datashow[i][j] + "</td>";
			}
			datatable = datatable + "</tr>";
		}
		$("#result").append(datatable + "</table></div>");
		$("#main").unmask();
	});
}
function choose_data()
{
	var starts = '';
	var   ends = '';
	var indexs = '';
	var numbers = '';
	var list = document.getElementsByClassName("part");
	for(var i=0; i<list.length; i++){
		if(list[i].children[1].children[0].tagName=="SELECT"){
			alter("存在未选择的筛选变量");
			return ;
		}
		else{
			indexs+=list[i].children[1].children[0].innerHTML+",";
			var node = list[i].children[1].children[4].children;
			var num =0;
			//starts[i] = new Array();
			//ends[i] = new Array();
			for(var j=0; j<node.length; j++){
				if(node[j].tagName=="BR"){
					continue;
				}
				num++;
				console.log(node[j]);
				starts+=$("#"+node[j].children[0].id).val()+",";
				if(node[j].children.length==3){
				ends+=$("#"+node[j].children[1].id).val()+",";
				}
				
			}
			numbers+=num+",";
			
		}
	}
	starts = starts.substring(0, starts.length-1);
	ends = ends.substring(0, ends.length-1);
	indexs = indexs.substring(0, indexs.length-1);
	numbers = numbers.substring(0, numbers.length-1);
	$("#main").mask("筛选处理中，请稍后...");
	$.post("choosebydata",{
		starts: starts,
		ends: ends,
		numbers: numbers,
		indexs: indexs
	},
	function(success,data){
		$("#result").empty();
		var obj = eval(data);
		var totalrow = obj.totalrow;
		var datashow = obj.datashow;
		console.log(totalrow);
		console.log(datashow);
		
		var datatable = "";
		var datashow = obj.datashow;
		var datatable = "<div class='more'><div><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showStatic()'>统计信息展示</button><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showData()''>详细数据展示</button><div style='display:inline-block;margin-right:15px;position: relative;top: -4px;'><label>选择格式:</label><select id='dstype'><option value='txt' selected='selected'>.txt</option><option value='xls'>.xls</option><option value='csv'>.csv</option></select><a id='xiazaidstype'>下载</a></div><img src='resources/images/more.png'/><a href=dataListShow?totalrow=" + obj.totalrow + "&pageno=1 target='_blank'>显示更多数据</a></div></div><div id='showStatic' style='display:none'></div><div id='showData' style='display:block'><table width='100%' class='table table-hover'><thead><tr>";
		var datacolnames = obj.datacolnames;
		console.log(datacolnames);
		for (var i = 0; i < datacolnames.length; i++) {
			datatable = datatable + "<th>" + datacolnames[i] + "</th>";

		}
		datatable += "</tr></thead>";
		for (var i = 0; i < datashow.length; i++) {
			//console.log(parseFloat(datashow[i][4]));
			datatable = datatable + "<tr><td>" + (i + 1) + "</td>";
			for (var j = 0; j < datashow[i].length; j++) {
				datatable = datatable + "<td>" + datashow[i][j] + "</td>";
			}
			datatable = datatable + "</tr>";
		}
		$("#result").append(datatable + "</table></div>");
		$("#main").unmask();
	});
	
}
function missing_analyse()
{
	var attrselected=$("#select2 option");
	var ids="";
	for(var i=0;i<attrselected.length;i++)
	{
		ids+=attrselected.eq(i).val()+",";
	}
	ids=ids.substring(0, ids.length-1)
	var method=$("#method").val();
	console.log(method);
	if(ids=="")
	{
		alert("参数不得为空！");
		return false;
	}
	$("#main").mask("缺失值分析，请稍后...");
	$.post("missdata",
	{
		ids:ids,
		method:method
		
	},
	function(success, data) {
		
		$("#result").empty();
		var obj=eval(data);
		var fddBeans=obj.fddBeans;
		
		var html="<div class='tabletitle'>缺失值分析结果</div>"+       
			"<table width='100%' class='table table-hover'><thead><tr class='theadstyle'>"
				+"<th width='30%'>变量名</th>"
			 	+"<th width='25%'>变量类型</th>"
				+"<th width='25%'>缺失值数目</th>"
				+"<th width='20%'>缺失值比例</th></tr></thead>";
		for(var i=0;i<fddBeans.length;i++){
			var colname = fddBeans[i].colname;
			var coltype = fddBeans[i].coltype;
			html=html+"<tr>"
				+"<td>"+colname+"</td>"
				+"<td>"+coltype+"</td>"
				+"<td>"+fddBeans[i].missingnum+"</td>"
				+"<td>"+fddBeans[i].missingratio+"</td></tr>";
				console.log(fddBeans[i]);
		}
		$("#result").append(html+"</table>");
		$("#main").unmask();
		//alert("缺失值分析成功！")
	});
}


function missing_view(){
	$("#main").mask("正在分析缺失值，请稍后...");
	$.post("judgemissing",
	{
		        
	},
	function(success, data) {
		$("#main").unmask();
		var obj=eval(data);
		if(obj.hasmissing=="true"){
			//var wid = parseInt($("#main").css("width").replace("px",""));
			//$("#showmissing").css("display","block");
			//window.location= spath + "/showmissing";
			$("#showmissing").animate({top: '50px'},300,"linear");
			//$("#showmissing").attr("style","display:block");
		}else{
			alert("该数据集无缺失值！");
		}
		
	});
}


function selectSub()
{
	var checksub=$("input[type='checkbox'][id='id']").length;
	var checkedsub=$("input[type='checkbox'][id='id']:checked").length;
	if(checksub==checkedsub)
		$("#allids").attr("checked",true);
	else
		$("#allids").attr("checked",false);
}

function selectAll()
{
	if($("#allids").attr("checked"))
		$(":checkbox").attr("checked",true);
	else
		$(":checkbox").attr("checked",false);
}

function delmissing()
{
	var checkedsub=$("input[type='checkbox'][id='id']:checked").length;
	if(checkedsub==0)
	{
		alert("您没有选中任何数据");
		return;
	}
	else{
		if(confirm("确认处理所选条目？")){
			var ids="";
			$("input[id='id']:checked").each(function(){
				ids+=$(this).val()+",";
			});
			$("#main").mask("正在剔除缺失值，请稍后...");
			console.log(ids);
			$.post("delmissing",
			{
				ids:ids
			},
			function(success, data) {
				
				var hei = parseInt($("#showmissing").css("height").replace("px",""));
				$("#showmissing").animate({top: (-hei-2)+'px'},300,"linear");
				$("#result").empty();
				var obj=eval(data);
				$("input[id='id']:checked").each(function(){
					$(this).parent().parent().remove();
				});
				var fddBeans=obj.fddBeans;
				var html=
					"<table width='100%' class='table table-hover'><thead><tr class='theadstyle'>"
						+"<th width='30%'>变量名</th>"
					 	+"<th width='25%'>变量类型</th>"
						+"<th width='25%'>缺失值数目</th>"
						+"<th width='20%'>缺失值比例</th></tr></thead>";
				for(var i=0;i<fddBeans.length;i++){
					html=html+"<tr>"
						+"<td>"+fddBeans[i].colname+"</td>"
						+"<td>"+fddBeans[i].coltype+"</td>"
						+"<td>"+fddBeans[i].missingnum+"</td>"
						+"<td>"+fddBeans[i].missingratio+"</td></tr>";
				}
				$("#result").append(html+"</table>");
				$("#main").unmask();
			});
		}
	}
}

function saveupdate(){
	if(confirm("确认需要修改的值？")){
		var ids="";
		$("input[id='id']").each(function(){
			ids+=$(this).val()+",";
		});
		var missinput="";
		var temp=$("input[name='missinput']");
		for ( var i = 0; i < temp.length; i++) {
			missinput+=temp.eq(i).val()+";";
		}
		missinput=missinput.substring(0, missinput.length-1)
		$("#main").mask("正在替换缺失值，请稍后...");
		$.post("updatemissing",
		{
			ids:ids,
			missinput:missinput
		},
		function(success, data) {
			
			var hei = parseInt($("#showmissing").css("height").replace("px",""));
			$("#showmissing").animate({top: (-hei-2)+'px'},300,"linear");
			$("#result").empty();
			var obj=eval(data);
			var fddBeans=obj.fddBeans;
			var html=
				"<table width='100%' class='table table-hover'><thead><tr class='theadstyle'>"
					+"<th width='30%'>变量名</th>"
				 	+"<th width='25%'>变量类型</th>"
					+"<th width='25%'>缺失值数目</th>"
					+"<th width='20%'>缺失值比例</th></tr></thead>";
			for(var i=0;i<fddBeans.length;i++){
				html=html+"<tr>"
					+"<td>"+fddBeans[i].colname+"</td>"
					+"<td>"+fddBeans[i].coltype+"</td>"
					+"<td>"+fddBeans[i].missingnum+"</td>"
					+"<td>"+fddBeans[i].missingratio+"</td></tr>";
			}
			$("#result").append(html+"</table>");
			$("#main").unmask();
		});
	}
}

function closeview(){
	//$("#showmissing").attr("style","display:none");
	var hei = parseInt($("#showmissing").css("height").replace("px",""));
	$("#showmissing").animate({top: (-hei-2)+'px'},300,"linear");
}

