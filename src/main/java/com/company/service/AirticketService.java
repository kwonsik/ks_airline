package com.company.service;

import java.util.List;
import java.util.Map;

import com.company.dto.AirTicketDto;
import com.company.util.PagingDto;



public interface AirticketService {
	public PagingDto paging(int pstartno);
	public List<AirTicketDto> listCnt(Map<String,Integer> para);
}
