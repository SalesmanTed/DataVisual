require.config({
    paths:{
    'echarts':'./resources/echartsjs/echarts',
    'echarts/chart/pie' : './resources/echartsjs/echarts-map'
}});
var echarts;
require(
     [
         'echarts',
         'echarts/chart/pie',
     ],
     function (ec) {echarts=ec}
);
function readFileDataset(id) {
	$("#main").mask("读取数据集，请稍后...");
	$.post("readFileDatasetJson.action",
		{
			sid : id
		},
		function(returnedData, status) {
			if ("success" == status) {
				$("#console").css("display", "block");
				$("#result").empty();
				/*$("#result").attr("data-step","3");
				$("#result").attr("data-intro","在这里查看你的数据信息，包括数据统计信息、缺失值比例、变量类型以及详细数据等等");
				$("#result").attr("data-position","top");*/
				var obj = eval(returnedData);
				var fddBeans = obj.fddBeans;
				var html = "<div class='tabletitle'>此数据集共有" + obj.totalrow + "行记录</div>" +
					"<table width='100%' class='table table-hover'><thead><tr class='theadstyle'>"
					+ "<th width='30%'>变量名</th>"
					+ "<th width='25%'>变量类型</th>"
					+ "<th width='25%'>缺失值数目</th>"
					+ "<th width='20%'>缺失值比例</th></tr></thead>";
				for (var i = 0; i < fddBeans.length; i++) {
					html = html + "<tr>"
						+ "<td>" + fddBeans[i].colname + "</td>"
						+ "<td>" + fddBeans[i].coltype + "</td>"
						+ "<td>" + fddBeans[i].missingnum + "</td>"
						+ "<td>" + fddBeans[i].missingratio + "</td></tr>";
				}
				$("#result").append(html + "</table>");


				var datatable = "";
				var datashow = obj.datashow;
				var datatable = "<div class='more'><div><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showStatic()'>统计信息展示</button><button  class=\"btn add\"  type=\"button\" id=\"button\" onclick='showData()''>详细数据展示</button><div style='display:inline-block;margin-right:15px;position: relative;top: -4px;'><label>选择格式:</label><select id='dstype'><option value='txt' selected='selected'>.txt</option><option value='xls'>.xls</option><option value='csv'>.csv</option></select><a id='xiazaidstype'>下载</a></div><img src='resources/images/more.png'/><a href=dataListShow?totalrow=" + obj.totalrow + "&pageno=1 target='_blank'>显示更多数据</a></div></div><div id='showStatic' style='display:none'></div><div id='showData' style='display:block'><table width='100%' class='table table-hover'><thead><tr>";
				var datacolnames = obj.datacolnames;
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
				//introJs().goToStep(3).start();
				//alert("数据读取完成！");

				$("#xiazaidstype").click(function() {
					var geshi = $("#dstype  option:selected").val();
					//alert(geshi);
					//alert(spath+"/convertFileType?type="+geshi);
					window.open(spath + "/convertType?type=" + geshi);
				});



			}
		}
	)
}
function point(name , value){
	var opoint = new Object;
	opoint.value = value;
	opoint.name = name;
	return opoint; 
}
function showData() {
	$("#showStatic").hide();
	$("#showData").show();
}

function showStatic() {
	$("#showStatic").show();
	$("#showData").hide();
	var id =1;
	$.post("statShowJson.action", {
		sid : id
	},
		function(returnedData, status) {
			if ("success" == status) {
				var obj = eval(returnedData);
				var statName = obj.statName;
				var data = obj.statData;
				var colnames = obj.datacolnames;
				var statData = new Array();
				var colors = obj.colors;
				var datacolnames = obj.datacolnames;
				for(var i=0;i<statName.length;i++){
					statData[i] = new Array();
					for(var j=0;j<statName[i].length;j++){
						var sPoint = point(statName[i][j],data[i][j]);
						statData[i].push(sPoint);
					}
				}
				console.log(statName);
				console.log(statData);
				console.log(colnames);
			}
			var table = "<div id></div>"
			$('#showStatic').empty();
			var colors=obj.colors;
			for (var i = 0; i < colnames.length; i++) {
				
				$('#showStatic').append("<div style='width:48%;float:left;border:1px solid #C0C0C0;margin:5px 5px;height:500px' id=pie"+(i+1)+"></div>")
				var myChart = echarts.init(document.getElementById("pie"+(i+1)));
     			option = {
     				    title : {
     				        text: '',
     				        x:'center'
     				    },
     				    tooltip : {
     				        trigger: 'item',
     				        formatter: "{a} <br/>{b} : {c} ({d}%)"
     				    },
     				   legend: {
     				        orient: 'vertical',
     				        x: 'left',
     				        data: []
     				    },
     				    series : [
     				            
     				        ],
     				       animation:false
     				};
     				myChart.setOption(option);
     				for(var j =0 ;j<statName[i].length;j++){
     					option.legend.data.push(statName[i][j]);
     				
     				}
     				option.title.text="数据统计信息（扇形图） 变量："+datacolnames[i];
	               	option.series.push({
	               	         name: 'V-V pie', // 系列名称
	               	         type: 'pie', // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	               	         radius : '55%',
	               	         center: ['50%', '60%'],
	               	         data: statData[i],
		               	     itemStyle: {
			               		normal: {
				                    color:colors
		                     	},
		                     	emphasis: {
		                            shadowBlur: 10,
		                            shadowOffsetX: 0,
		                            shadowColor: 'rgba(0, 0, 0, 0.5)'
		                        }
	               			},
	               			
	               	});
	               	myChart.setOption(option);
             }
		}

	)


}
