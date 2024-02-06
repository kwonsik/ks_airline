package com.company.service;

import java.util.List;
import java.util.Map;

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

}
