package com.company.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dto.AirTicketDto;
import com.company.util.PagingDto;



public interface AirticketService {
	public PagingDto paging(int pstartno);
	public List<AirTicketDto> listCnt(Map<String,Integer> para);
	public void admin_airticket_add(AirTicketDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException;
}
