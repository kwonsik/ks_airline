package com.company.dao;

import java.util.List;
import java.util.Map;

import com.company.dto.AirTicketDto;



@MyDao
public interface AirTicketDao {
	public int listtotal(); // 전체 갯수
	public List<AirTicketDto> listCnt(Map<String,Integer> para);
	public int admin_airticket_add(AirTicketDto dto);
}
