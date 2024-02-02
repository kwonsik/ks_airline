package com.company.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.UserDto;


public interface UserService {
	public int dupcheck(String userid);
	public void logout(HttpServletRequest request) throws IOException;
	public void login(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void join(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void userdetail(int userno,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void changeUser(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public int check_pass_ajax(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void deleteUser(@RequestParam int userno,HttpServletRequest request, HttpServletResponse response) throws IOException;
}
