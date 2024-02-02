package com.company.dao;

import java.util.List;

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
	public List<ReservationPriceDto> myreservation(int userno);
	
}
