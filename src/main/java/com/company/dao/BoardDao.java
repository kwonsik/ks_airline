package com.company.dao;

import java.util.List;
import java.util.Map;

import com.company.dto.*;

@MyDao
public interface BoardDao {
	public int listtotal(); // 전체 갯수
	public List<BoardDto> listCnt(Map<String,Integer> para);
	public int board_write(BoardDto dto);
	public BoardDto board_detail(int bno);
	public void board_hit(int bno);
	public int board_edit(BoardDto dto);
	public int board_delete(int bno);
}
