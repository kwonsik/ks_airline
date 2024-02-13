package com.company.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.AirTicketDto;
import com.company.dto.BoardDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;
import com.company.service.AirticketService;
import com.company.service.BoardService;
import com.company.service.ReservationService;
import com.company.service.UserService;

@Controller("frontController")
public class FrontController {
	
	@Autowired UserService userService;
	@Autowired ReservationService reservationService;
	@Autowired BoardService boardService;
	@Autowired AirticketService airticketService;
	
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
	@GetMapping("/findId_view.ks")
	public String findId_view(){
		return "findId";
	}
	@PostMapping("/findId.ks")
	public void findId(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException {
		userService.findId(dto, request, response);
	}
	@GetMapping("/findPass_view.ks")
	public String findPass_view(){
		return "findPass";
	}
	@PostMapping("/findPass.ks")
	public void findPass(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException {
		userService.findPass(dto, request, response);
	}
	@GetMapping("/changePass_view.ks")
	public String changePass_view(){
		return "changePass";
	}
	@PostMapping("/changePass.ks")
	public void changePass(UserDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException {
		userService.changePass(dto, request, response);
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
	@RequestMapping("/userdetail.ks")
	public String userdetail(int userno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		userService.userdetail(userno,request,response); 
		return "userdetail";
	}
	@PostMapping("/changeuser_view.ks")
	public String changeuser_view(int userno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		userService.userdetail(userno,request,response); 
		return "changeUser";
	}
	
	@PostMapping("/changeuser.ks")
	public void changeuser(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException {
		userService.changeUser(dto, request, response);	
	}
	
	@PostMapping("/check_pass_ajax.ks")
	@ResponseBody
	public int check_pass_ajax(UserDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException{
		return userService.check_pass_ajax(dto, request, response);
		
	}
	@GetMapping("/deleteUser.ks")
	public void deleteUser(@RequestParam int userno,HttpServletRequest request, HttpServletResponse response) throws IOException {
		userService.deleteUser(userno, request, response);
		
	}
	@GetMapping("/myreservation.ks")
	public String myreservation(@RequestParam int userno,Model model) throws IOException {
		reservationService.myreservation(userno, model);
		return "myreservation";
	}
	@GetMapping("/reservation_detail.ks")
	public String myreservation_detail(@RequestParam int rpno,Model model) throws IOException {
		reservationService.myreservation_detail(rpno, model);
		return "myreservation_detail";
	}
	@PostMapping("/pay.ks")
	public void pay(HttpServletRequest request, HttpServletResponse response) throws IOException{
		reservationService.pay(request, response);		
	}
	@PostMapping("/reservationCancle.ks")
	public void reservationCancle(HttpServletRequest request, HttpServletResponse response) throws IOException{
		reservationService.reservationCancle(request, response);		
	}
	@RequestMapping(value = "/board_list.ks", method = RequestMethod.GET)
	public String board_list(@RequestParam(value="pstartno", defaultValue = "0")int pstartno ,Model model) {
		Map<String, Integer> para=new HashMap<String, Integer>();
		para.put("pstartno", pstartno);
		para.put("onepagelimit", 10);
		model.addAttribute("list",boardService.listCnt(para));
		model.addAttribute("paging",boardService.paging(pstartno));
		return "board"; 
	}
	@GetMapping("/board_detail.ks")
	public String board_detail(@RequestParam int bno,Model model) throws IOException {
		boardService.board_detail(bno, model);
		return "boardDetail";
	}
	@PostMapping("/board_edit_view.ks")
	public String board_edit_view(@RequestParam int bno,Model model) throws IOException {
		boardService.board_detail(bno, model);
		return "boardEdit";
	}
	@PostMapping("/board_edit.ks")
	public void board_edit(BoardDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException {
		boardService.board_edit(dto, request, response);
	}
	@PostMapping("/board_delete.ks")
	public void board_delete(@RequestParam int bno,HttpServletRequest request, HttpServletResponse response) throws IOException {
		boardService.board_delete(bno, request, response);
	}
	@GetMapping("/board_write_view.ks")
	public String board_write_view(){
		
		return "boardwrite";
	}
	@PostMapping("/board_write.ks")
	public void board_write(BoardDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException {
		boardService.board_write(dto, request, response);
	}
	@PostMapping("/admin_board_delete.ks")
	public void admin_board_delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boardService.admin_board_delete(request, response);
	}
	@GetMapping("/admin_airticket_list.ks")
	public String admin_airticket_list(@RequestParam(value="pstartno", defaultValue = "0")int pstartno ,Model model){
		Map<String, Integer> para=new HashMap<String, Integer>();
		para.put("pstartno", pstartno);
		para.put("onepagelimit", 10);
		model.addAttribute("list",airticketService.listCnt(para));
		model.addAttribute("paging",airticketService.paging(pstartno));
		return "admin_airticket_list";
	}
	@GetMapping("/admin_airticket_add_view.ks")
	public String admin_airticket_add_view(){		
		return "admin_airticket_add";
	}
	@PostMapping("/admin_airticket_add.ks")
	public void admin_airticket_add(AirTicketDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException {
		airticketService.admin_airticket_add(dto, request, response);
	}
	@GetMapping("/admin_airticket_detail.ks")
	public String admin_airticket_detail(@RequestParam int no,Model model){
		airticketService.admin_airticket_detail(no, model);
		return "admin_airticket_detail";
	}
	@PostMapping("/admin_airticket_edit_view.ks")
	public String admin_airticket_edit_view(@RequestParam int no,Model model){
		airticketService.admin_airticket_detail(no, model);
		return "admin_airticket_edit";
	}
	@PostMapping("/admin_airticket_edit.ks")
	public void admin_airticket_edit(AirTicketDto dto,@RequestParam int no,HttpServletRequest request, HttpServletResponse response) throws IOException{
		airticketService.admin_airticket_edit(dto, no, request, response);	
	}
	@PostMapping("/admin_airticket_stop.ks")
	public void admin_airticket_stop(HttpServletRequest request, HttpServletResponse response) throws IOException{
		airticketService.admin_airticket_stop(request, response);
	}
	@PostMapping("/admin_airticket_restart.ks")
	public void admin_airticket_restart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		airticketService.admin_airticket_restart(request, response);
	}
	@GetMapping("/admin_reservation_list.ks")
	public String admin_reservation_list(@RequestParam(value="pstartno", defaultValue = "0")int pstartno ,Model model){
		Map<String, Integer> para=new HashMap<String, Integer>();
		para.put("pstartno", pstartno);
		para.put("onepagelimit", 10);
		model.addAttribute("list",reservationService.listCnt(para));
		model.addAttribute("paging",reservationService.paging(pstartno));
		return "admin_reservation_list";
	}
	@GetMapping("/admin_user_list.ks")
	public String admin_user_list(@RequestParam(value="pstartno", defaultValue = "0")int pstartno ,
			HttpServletRequest request,Model model){
		String username="";
		if(request.getParameter("username")==null) {username=null;}
		else {username=request.getParameter("username");}
		Map<String, Object> para=new HashMap<String, Object>();

		para.put("pstartno", pstartno);
		para.put("onepagelimit", 10);
		para.put("username", username);
		
		model.addAttribute("list",userService.listCnt(para));
		model.addAttribute("paging",userService.paging(para));
		return "admin_user_list";
	}
	@PostMapping("/admin_user_delete.ks")
	public void admin_user_delete(HttpServletRequest request, HttpServletResponse response) throws IOException{
		userService.admin_user_delete(request, response);
	}
	
	
	
}
	



