function login()
{
	var username = $("#username").val();
	var password = $("#password").val();
	$.post("userlogin.action",{
		username:username,
		password:password
	},
	function(returnedData,status){
		
	}
	)



}