package com.cdac.service;

import com.cdac.dto.User;

public interface UserService {
	boolean addUser(User user);
	boolean findUser(User user);
	String forgotPassword(String email);
	public User getUser(int userId);
	void uploadImage(String profilePic,int userId);
}
