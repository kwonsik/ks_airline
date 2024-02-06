package com.company.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.company.dao.BoardDao;
import com.company.dao.ReservationDao;

import com.company.dto.AirTicketDto;
import com.company.dto.BoardDto;
import com.company.dto.ReservationVO;
import com.company.dto.UserDto;
import com.company.util.PagingDto;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDao dao;

	@Override
	public PagingDto paging(int pstartno) {
		return new PagingDto(dao.listtotal(),pstartno);
	}

	@Override
	public List<BoardDto> listCnt(Map<String, Integer> para) {

		return dao.listCnt(para);
	}

	@Override
	public void board_detail(int bno, Model model) throws IOException {
		model.addAttribute("dto",dao.board_detail(bno));
		dao.board_hit(bno);
	}


	@Override
	public void board_edit(BoardDto dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println("게시판 수정");
		int result=dao.board_edit(dto);

		if(result>0) {
			out.print("<script>alert('글수정 완료!');location.href='board_detail.ks?bno="+dto.getBno()+"'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='board_list.ks'</script>");
		}
	}

	@Override
	public void board_delete(int bno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int result=dao.board_delete(bno);

		if(result>0) {
			out.print("<script>alert('글삭제 완료!');location.href='board_list.ks'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='board_list.ks'</script>");
		}
		
	}

	@Override
	public void board_write(BoardDto dto, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		dto.setBip(InetAddress.getLocalHost().getHostAddress());
		PrintWriter out=response.getWriter();
		
		int result=dao.board_write(dto);

		if(result>0) {
			out.print("<script>alert('글쓰기 완료!');location.href='board_list.ks'</script>");
		}
		else {
			out.print("<script>alert('관리자에게 문의해주세요');location.href='board_list.ks'</script>");
		}
		
	}

	

	

}
