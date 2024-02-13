package com.company.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.ReservationDto;
import com.company.dto.UserDto;
import com.company.util.PagingDto;


public interface UserService {
	public int dupcheck(String userid);
	public void logout(HttpServletRequest request) throws IOException;
	public void findId(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void findPass(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void changePass(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void login(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void join(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void userdetail(int userno,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void changeUser(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public int check_pass_ajax(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void deleteUser(@RequestParam int userno,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public List<UserDto> listCnt(Map<String,Object> para);
	public PagingDto paging(Map<String,Object> para);
	public void admin_user_delete(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
