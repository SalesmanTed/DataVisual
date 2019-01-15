function user_regist()
{
	$("#main").mask("正在处理，请稍后。。。");
	var username = $("#username").val();
	var password = $("#password").val();
	var userphone = $("#userphone").val();
	console.log(userphone);
	var usercompany = $("#usercompany").val();
	var userrole = $("#userrole").val();
	console.log(userrole);
	var usersex = $("#usersex").val();
	$.post("userRegist.action",
	{
		username:username,
		password:password,
		userphone:userphone,
		usercompany:usercompany,
		userrole:userrole,
		usersex:usersex,
	},
	function(returnedData, status)
	{
		console.log(status);
		var obj = eval(returnedData);
		console.log(obj.userrole);
		if(obj.userrole=="注册成功")
		{
			
				alert("注册成功");
		
			//console.log(msg);
			$("#main").unmask();
			location.reload();
		}
		else{
			alert(obj.userrole);
			$("#main").unmask();
		}
		
	}
	)
	console.log("111");
	

}
function user_update()
{
	$("#main").mask("正在处理，请稍后。。。");
	var username = $("#username").val();
	var password = $("#password").val();
	var userphone = $("#userphone").val();
	console.log(userphone);
	var usercompany = $("#usercompany").val();
	var userrole = $("#userrole").val();
	console.log(userrole);
	var usersex = $("#usersex").val();
	$.post("userUpdate.action",
	{
		username:username,
		password:password,
		userphone:userphone,
		usercompany:usercompany,
		userrole:userrole,
		usersex:usersex,
	},
	function(returnedData, status)
	{
		console.log(status);
		var obj = eval(returnedData);
		console.log(obj.userrole);
		if(obj.userrole=="更新成功")
		{
			
				alert("更新成功");
		
			//console.log(msg);
			$("#main").unmask();
			location.reload();
		}
		else{
			alert(obj.userrole);
			$("#main").unmask();
		}
		
	}
	)
	console.log("111");
	

}
function user_login()
{
	var username = $("#username").val();
	var password = $("#password").val();
	$.post("userlogin.action",{
		username:username,
		password:password
	}
	)

}