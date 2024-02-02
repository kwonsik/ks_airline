package com.company.dao;

import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.UserDto;

@MyDao
public interface UserDao {
	public int dupcheck(String userid);
	public int join(UserDto dto);
	public int login(UserDto dto);
	public int findUserNo(UserDto dto);
	public UserDto userDetail(int userno);
	public UserDto findUser(int userno);
	public int changeUser(UserDto dto);
	public int check_pass_ajax(UserDto dto);
	public int deleteUser(int userno);
}
