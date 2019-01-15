package com.dv.action;

import com.dv.action.base.LoginBaseAction;
import com.dv.entity.User;
import com.dv.util.StaticData;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;

@SuppressWarnings("serial")
public class LoginAction extends LoginBaseAction {
	private String username; // 接受用户编号
	private String password; // 接受用户密码
	private String userphone;
	private String usercompany;
	private String userrole;
	private String usersex;

	public String userLogin() {
		List<User> user = userservice.allowLogin(username, password);
		if (user.size() >= 1) {
			
			ActionContext.getContext().getSession().put("username", user.get(0).getUsername());
			ActionContext.getContext().getSession().put("userphone", user.get(0).getUserphone());
			ActionContext.getContext().getSession().put("usercompany", user.get(0).getUsercompany());
			ActionContext.getContext().getSession().put("userrole", user.get(0).getUserrole());
			ActionContext.getContext().getSession().put("usersex", user.get(0).getUsersex());
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().put("user", user.get(0));
			System.out.println(username);
			if(user.get(0).getUserrole().equals("0")){
				return "successCommon";
			}
			else if(user.get(0).getUserrole().equals("1")){
				return "successAdmin";
			}
			
		} else {
			return "error";
		}
		return "error";

	}

	public String userRegist() {
		if (username.equals(""))
			username = null;
		System.out.println(usercompany);
		if (password.equals(""))
			password = null;
		if (userphone.equals(""))
			userphone = null;
		if (usercompany.equals(""))
			usercompany = null;
		if (userrole.equals(""))
			userrole = null;
		if (usersex.equals(""))
			usersex = null;
		System.out.println("action" + userphone);
		String result = userservice.addUser(username, password, userphone, usercompany, userrole, usersex);
		System.out.println(result);

		
			userrole = result;

		
		return SUCCESS;

	}

	public String userUpdate() {
		if (username.equals("")) username = null;
		System.out.println(username);
		if (password.equals("")) password = null;
		System.out.println(password);
		if (userphone.equals("")) userphone = null;
		System.out.println(userphone);
		if (usercompany.equals("")) usercompany = null;
		System.out.println(usercompany);
		if (userrole.equals("")) userrole = null;
		System.out.println(userrole);
		if (usersex.equals("")) usersex = null;
		System.out.println(usersex);
		String result = userservice.updateUser(username, password, userphone, usercompany, userrole, usersex);
		if(usercompany != null) {
			ActionContext.getContext().getSession().remove("usercompany");
			ActionContext.getContext().getSession().put("usercompany",usercompany);
		}
		if(userphone !=null) {
			ActionContext.getContext().getSession().remove("userphone");
			ActionContext.getContext().getSession().put("userphone",userphone);
		}
		if(userrole != null) {
			ActionContext.getContext().getSession().remove("userrole");
			ActionContext.getContext().getSession().put("userrole",userrole);
		}
		if(usersex != null) {
			ActionContext.getContext().getSession().remove("usersex");
			ActionContext.getContext().getSession().put("usersex",usersex);
		}
		userrole = result;
		return SUCCESS;
	}

	public String loadLibs() {
		StaticData sd = StaticData.getInstance();
		sd.setAr();
		return SUCCESS;
	}

	public String regist() {
		return SUCCESS;
	}

	public String update() {
		return SUCCESS;
	}

	public String logout() {
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUsercompany() {
		return usercompany;
	}

	public void setUsercompany(String usercompany) {
		this.usercompany = usercompany;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public String getUsersex() {
		return usersex;
	}

	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}

}
