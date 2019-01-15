function backUp() {
	$("#main").mask("正在处理，请稍后。。。");
	$.post("backUp.action", {

	},
	function(returnedData, status) {
			var obj = eval(returnedData);
			var result = obj.result;
			console.log(obj.result);
			alert(result);
			$("#main").unmask();
	}
	)
}
function revert() {
	
	event.returnValue = confirm("确认要恢复数据吗？");
	console.log(event.returnValue);
	if(event.returnValue){
	$("#main").mask("正在处理，请稍后。。。");
	$.post("revert.action", {

	},
	function(returnedData, status) {
			var obj = eval(returnedData);
			var result = obj.result;
			console.log(obj.result);
			alert(result);
			$("#main").unmask();
			window.location.reload()
	}
	)
	}
}
