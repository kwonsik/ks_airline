package com.company.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.AirTicketDto;
import com.company.util.PagingDto;



public interface AirticketService {
	public PagingDto paging(int pstartno);
	public List<AirTicketDto> listCnt(Map<String,Integer> para);
	public void admin_airticket_add(AirTicketDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException;
	public void admin_airticket_detail(int no,Model model);
	public void admin_airticket_edit(AirTicketDto dto,@RequestParam int no,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void admin_airticket_stop(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
