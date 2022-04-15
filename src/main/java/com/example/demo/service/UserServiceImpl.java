package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDAO;
import com.example.demo.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userdao;
	
	@Override
	public void joinservice(User user) throws Exception {
		userdao.insertuser(user);
	}



	@Override
	public String idCheck(String userid) throws Exception {
		String msg = "사용가능한 아이디입니다.";
		if(userid.length()>=4 && userid.length()<=20) {
			if(userdao.idCheck(userid) == 1) {
				msg = "이미 사용중인 아이디입니다.";
			}
		} else {
			msg = "아이디는 4글자 이상 20글자 이하만 가능합니다.";
		}
		return msg;
	}



	@Override
	public User loginservice(String userid, String userpw) throws Exception {
		User user = userdao.login(userid);
		if (user != null) {
			if (user.getUserpw().equals(userpw)) {
				user.setUserpw("");
				return user; 
			}
		}
		return null;
	}



}
