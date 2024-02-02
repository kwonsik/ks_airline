package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.company.dao.UserDao;
import com.company.dto.UserDto;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired UserDao dao;

	@Override
	public int dupcheck(String userid) {
		return dao.dupcheck(userid);
	}

	@Override
	public void join(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		try {
			dto.setUserip(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int result=dao.join(dto);
		if(result>0) {out.print("<script>alert('회원가입을 환영합니다');location.href='main.ks';</script>");}
		else {out.print("<script>alert('관리자에게 문의주세요');location.href='main.ks';</script>");}
		
	}

	@Override
	public void login(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		int result=dao.login(dto);
		System.out.println("userDto : "+dto);
		
		if(result>0) {
			dto.setUserno(dao.findUserNo(dto));
			session.setAttribute("userno", dto.getUserno());
			System.out.println(dto.getUserno());
			out.print("<script>alert('환영합니다');location.href='main.ks';</script>");}
		else {out.print("<script>alert('아이디와 비밀번호를 확인해주세요');location.href='main.ks';</script>");}
	}
	@Override
	public void logout(HttpServletRequest request) throws IOException {
		HttpSession session=request.getSession();
		session.removeAttribute("userno");
		
	}

	@Override
	public void userdetail(int userno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setAttribute("dto", dao.findUser(userno));
		
	}

	@Override
	public void changeUser(UserDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		int result=dao.changeUser(dto);
		
		if(result>0) {	
			out.print("<script>alert('회원정보를 수정했습니다.');location.href='main.ks';</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요.');location.href='main.ks';</script>");
		}
		
	}

	@Override
	public int check_pass_ajax(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		dto.setUserno((int)session.getAttribute("userno"));
		
		return dao.check_pass_ajax(dto);
	}

	@Override
	public void deleteUser(int userno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		int result=dao.deleteUser(userno);
		
		if(result>0) {	
			session.removeAttribute("userno");
			out.print("<script>alert('회원탈퇴를 완료했습니다.');location.href='main.ks';</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요.');location.href='main.ks';</script>");
		}
		
	}



	


}
