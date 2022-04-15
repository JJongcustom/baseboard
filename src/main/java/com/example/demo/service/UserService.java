package com.example.demo.service;

import com.example.demo.dto.User;

public interface UserService {

	void joinservice(User user) throws Exception ;
	String idCheck(String userid) throws Exception ;
	User loginservice(String userid, String userpw) throws Exception;

}
