package com.company.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.BoardDto;

import com.company.util.PagingDto;


public interface BoardService {

	public PagingDto paging(int pstartno);
	public List<BoardDto> listCnt(Map<String,Integer> para);
	public void board_write(BoardDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void board_detail(int bno,Model model) throws IOException;
	public void board_edit(BoardDto dto,HttpServletRequest request, HttpServletResponse response) throws IOException;
	public void board_delete(int bno,HttpServletRequest request, HttpServletResponse response) throws IOException;
	
	public void admin_board_delete(HttpServletRequest request, HttpServletResponse response) throws IOException;
	
}
