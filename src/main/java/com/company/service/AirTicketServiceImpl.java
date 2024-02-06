package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
