package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.dto.User;


@Mapper
@Repository
public interface UserDAO {


	int idCheck(String userid) throws Exception;

	User login(String userid) throws Exception;

	void insertuser(User user) throws Exception;

}
