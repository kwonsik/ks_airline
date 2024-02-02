package com.company.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.company.dto.AirTicketDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;


public interface ReservationService {

	public void reservation_view(Model model);
	public void reservation_search(AirTicketDto dto,HttpServletRequest request,HttpServletResponse response) throws IOException;
	public void reservation(ReservationVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException;
	
}
