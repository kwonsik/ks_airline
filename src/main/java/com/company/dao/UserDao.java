package com.company.dao;

import com.company.dto.UserDto;

@MyDao
public interface UserDao {
	public int dupcheck(String userid);
	public int join(UserDto dto);
	public int login(UserDto dto);
	public int findUserNo(UserDto dto);
	public UserDto userDetail(int userno);
	public UserDto findUser(int userno);
	
}
