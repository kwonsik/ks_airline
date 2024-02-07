package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.company.dao.AirTicketDao;
import com.company.dto.AirTicketDto;
import com.company.util.PagingDto;

@Service("airticketService")
public class AirTicketServiceImpl implements AirticketService{
	
	@Autowired AirTicketDao dao;
	@Override
	public List<AirTicketDto> listCnt(Map<String, Integer> para) {
		return dao.listCnt(para);
	}
	@Override
	public PagingDto paging(int pstartno) {
		return new PagingDto(dao.listtotal(),pstartno);
	}
	@Override
	public void admin_airticket_add(AirTicketDto dto, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		dto.setKprice(dto.getAprice()/2);
		int result=dao.admin_airticket_add(dto);

		if(result>0) {
			out.print("<script>alert('항공편 추가 완료!');location.href='admin_airticket_list.ks'</script>");
		}
		else {
			out.print("<script>alert('사이트 관리자에게 문의해주세요');location.href='admin_airticket_list.ks'</script>");
		}
		
	}
	@Override
	public void admin_airticket_detail(int no, Model model) {
		model.addAttribute("dto",dao.admin_airticket_detail(no));
	}
	@Override
	public void admin_airticket_edit(AirTicketDto dto, int no, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		dto.setKprice(dto.getAprice()/2);
		dto.setNo(no);
		int result=dao.admin_airticket_edit(dto);

		if(result>0) {
			out.print("<script>alert('항공편 수정 완료!');location.href='admin_airticket_list.ks'</script>");
		}
		else {
			out.print("<script>alert('사이트 관리자에게 문의해주세요');location.href='admin_airticket_list.ks'</script>");
		}
		
	}
	@Override
	public void admin_airticket_stop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String check[]=request.getParameterValues("check");

		int result=0;
		int no=0;
		for(int i=0;i<check.length;i++) {
			no=Integer.parseInt(check[i]);
			result+=dao.admin_airticket_stop(no);		
		}
		if(result==check.length) {
			dao.admin_reservation_cancle(no);
			out.print("<script>alert('운행 중지 완료!');location.href='admin_airticket_list.ks'</script>");
		}
		else {
			out.print("<script>alert('사이트 관리자에게 문의해주세요');location.href='admin_airticket_list.ks'</script>");
		}


		
	}

}
