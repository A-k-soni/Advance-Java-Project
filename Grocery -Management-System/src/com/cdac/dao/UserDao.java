package com.cdac.dao;

import java.util.List;

import com.cdac.dto.User;

public interface UserDao {
	boolean insertUser(User user);
	boolean checkUser(User user);
	String forgotPassword(String email);
	List<User> selectAll();
	public User getUser(int userId);
	void uploadImage(String profilePic,int userId);
}