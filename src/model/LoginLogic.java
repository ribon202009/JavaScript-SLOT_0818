package model;

import java.io.Serializable;

public class LoginLogic implements Serializable{


	public  LoginLogic() {}


	public boolean execute(User user) {

		if( (user.getPass().equals(user.getPass()) )  && (user.getName().equals(user.getName()) ) ){
			return true ; }
		return false;
		}



	}
