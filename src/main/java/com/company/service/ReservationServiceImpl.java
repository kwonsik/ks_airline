package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.company.dao.ReservationDao;

import com.company.dto.AirTicketDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;
import com.company.util.PagingDto;

@Service("rservationService")
public class ReservationServiceImpl implements ReservationService{

	@Autowired ReservationDao dao;

	@Override
	public void reservation_view(Model model) {
		model.addAttribute("alist",dao.getAList());
		System.out.println(dao.getAList());
		model.addAttribute("dlist",dao.getDList());
		System.out.println(dao.getDList());
	}

	@Override
	public void reservation_search(AirTicketDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		dto.setDate(request.getParameter("go"));
		request.setAttribute("list1", dao.searchList1(dto));
		if(request.getParameter("come")!="") {
			dto.setDate(request.getParameter("come"));
			request.setAttribute("list2", dao.searchList2(dto));
		};		
	}
	@Transactional
	@Override
	public void reservation(ReservationVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		vo.setUserno((int)session.getAttribute("userno"));
		int adult=0;
		int kid=0;
		int aprice=0;
		int kprice=0;
		int sum=0;
		int result=0;
		
		if(request.getParameter("adult")!=null) {
			adult=Integer.parseInt(request.getParameter("adult"));
			
			
		}	
		if(request.getParameter("kid")!=null) {
			kid=Integer.parseInt(request.getParameter("kid"));
		}
		vo.setAdultCnt(adult);
		vo.setKidCnt(kid);
		System.out.println("vo : "+vo);
//		dao.reservationPrice(vo);
		if(request.getParameter("select2")!=null) {
			vo.setNo(Integer.parseInt(request.getParameter("select")));
			aprice=adult*dao.getAprice(vo);
			kprice=kid*dao.getKprice(vo);
			sum=aprice+kprice;
			vo.setNo(Integer.parseInt(request.getParameter("select2")));
			aprice=adult*dao.getAprice(vo);
			kprice=kid*dao.getKprice(vo);
			sum+=aprice+kprice;
			vo.setPrice(sum);
			result=dao.reservationPrice(vo);
			for(int i=0;i<adult;i++) {
				vo.setNo(Integer.parseInt(request.getParameter("select")));
				dao.reservationA(vo);
				vo.setNo(Integer.parseInt(request.getParameter("select2")));
				dao.reservationA(vo);
				dao.reservationCount(vo);
			}
			for(int i=0;i<kid;i++) {
				vo.setNo(Integer.parseInt(request.getParameter("select")));
				dao.reservationK(vo);
				vo.setNo(Integer.parseInt(request.getParameter("select2")));
				dao.reservationK(vo);
				dao.reservationCount(vo);
			}
		}
		else if(request.getParameter("select2")==null){
			System.out.println("편도");
			vo.setNo(Integer.parseInt(request.getParameter("select")));
			aprice=adult*dao.getAprice(vo);
			kprice=kid*dao.getKprice(vo);
			sum=aprice+kprice;
			vo.setPrice(sum);
			result=dao.reservationPrice(vo);
			for(int i=0;i<adult;i++) {
				vo.setNo(Integer.parseInt(request.getParameter("select")));
				dao.reservationA(vo);
				dao.reservationCount(vo);

			}
			for(int i=0;i<kid;i++) {
				vo.setNo(Integer.parseInt(request.getParameter("select")));
				dao.reservationK(vo);
				dao.reservationCount(vo);
			}
		}
		if(result>0) {
			out.print("<script>alert('비행기 예매 완료!');location.href='main.ks'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='main.ks'</script>");
		}
		
	}

	@Override
	public void myreservation(int userno, Model model) throws IOException {
		model.addAttribute("list",dao.myreservation(userno));	
	}

	@Override
	public void myreservation_detail(int rpno, Model model) throws IOException {
		model.addAttribute("list",dao.myreservation_detail(rpno));	
		
	}

	@Override
	public void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String rno[]=request.getParameterValues("rno");
		PrintWriter out=response.getWriter();
		int result=0;
		for(int i=0;i<rno.length;i++) {
			result+=dao.pay(Integer.parseInt(rno[i]));
		}
		if(result==rno.length) {
			out.print("<script>alert('결제 완료!');location.href='main.ks'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='main.ks'</script>");
		}
	}

	@Override
	public void reservationCancle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String rno[]=request.getParameterValues("rno");
		PrintWriter out=response.getWriter();
		int result=0;
		for(int i=0;i<rno.length;i++) {
			result+=dao.reservationCancle(Integer.parseInt(rno[i]));
		}
		if(result==rno.length) {
			out.print("<script>alert('취소 완료!');location.href='main.ks'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='main.ks'</script>");
		}
		
	}


	@Override
	public List<ReservationDto> listCnt(Map<String, Integer> para) {
		return dao.listCnt(para);
	}

	@Override
	public PagingDto paging(int pstartno) {
		return new PagingDto(dao.listtotal(),pstartno);
	}	

}
