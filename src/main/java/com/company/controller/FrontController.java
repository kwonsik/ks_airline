package com.company.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.AirTicketDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;
import com.company.service.ReservationService;
import com.company.service.UserService;

@Controller("frontController")
public class FrontController {
	
	@Autowired UserService userService;
	@Autowired ReservationService reservationService;
	
	
	@GetMapping("/main.ks")
	public String main() {
		return "main";
	}
	@GetMapping("/join1.ks")
	public String join1() {
		return "join1";
	}
	@PostMapping("/join2.ks")
	public String join2() {
		return "join2";
	}
	@GetMapping("/dupcheck.ks")
	@ResponseBody
	public int dupcheck(@RequestParam String userid) {
		return userService.dupcheck(userid);
	}
	@PostMapping("/join_action.ks")
	public void join_action(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException {

		userService.join(dto,request,response);
		
	}
	@PostMapping("/login.ks")
	public void login(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		userService.login(dto,request,response);
	}
	@GetMapping("/logout.ks")
	public String logout(HttpServletRequest request) throws IOException{
		userService.logout(request);
		return "redirect:/main.ks";
	}
	
	@GetMapping("/reservation_view.ks")
	public String reservation_view(Model model) {
		reservationService.reservation_view(model);
		return "reservation_intro";
	}
	
	@PostMapping("/reservation_search.ks")
	public String reservation_search(AirTicketDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException{
		reservationService.reservation_search(dto, request, response);
		
		return "reservation_search";
	}
	@PostMapping("/reservation.ks")
	public void reservation(ReservationVO vo,HttpServletRequest request,HttpServletResponse response) throws IOException{
		reservationService.reservation(vo, request, response);		
	}
	@GetMapping("/userdetail.ks")
	public String userdetail(Model model,int userno) {
		model.addAttribute("dto",userService.userdetail(userno)); 
		return "userdetail";
	}
	@PostMapping("/changeuser_view.ks")
	public String changeuser_view(Model model,int userno) {
		model.addAttribute("dto",userService.userdetail(userno)); 
		return "changeUser";
	}
	@PostMapping("/changeuser.ks")
	public String changeuser(Model model,@RequestParam int userno) {
		model.addAttribute("dto",userService.userdetail(userno)); 
		return "changeUser";
	}

}
	



