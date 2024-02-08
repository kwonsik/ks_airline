package com.company.dao;

import java.util.List;
import java.util.Map;

import com.company.dto.AirTicketDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationPriceDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;

@MyDao
public interface ReservationDao {
	public List<AirTicketDto> getDList();
	public List<AirTicketDto> getAList();
	public List<AirTicketDto> searchList1(AirTicketDto dto);
	public List<AirTicketDto> searchList2(AirTicketDto dto);
	public int reservationPrice(ReservationVO vo);
	public void reservationA(ReservationVO vo);
	public void reservationK(ReservationVO vo);
	public int getAprice(ReservationVO vo);
	public int getKprice(ReservationVO vo);
	public int reservationCount(ReservationVO vo);
	public List<ReservationPriceDto> myreservation(int userno);
	public List<ReservationVO> myreservation_detail(int rpno);
	public int pay(int rno);
	public int reservationCancle(int rno);
	public int listtotal(); // 전체 갯수
	public List<ReservationDto> listCnt(Map<String,Integer> para);
	
}
