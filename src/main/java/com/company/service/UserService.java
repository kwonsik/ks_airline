package com.company.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.company.dto.UserDto;


public interface UserService {
	public int dupcheck(String userid);
	public void logout(HttpServletRequest request) throws IOException;
	public UserDto userdetail(int userno);
	public void login(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void join(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
}
