package com.company.util;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Component
public class PagingDto {
	private int listTotal;
	private int onepagelimit;
	private int pageAll;
	private int bottomnav; // 하단 페이지 노출 수
	private int pstartno;
	private int currentBtn;
	private int startBtn;
	private int endBtn;
	
	// private List<Object> list;
	public PagingDto(int listTotal, int pstartno) {
		super();
		this.listTotal = listTotal;
		this.onepagelimit = 10;
		this.pageAll = (int)Math.ceil(listTotal/(double)onepagelimit);
		this.bottomnav = 10;
		this.pstartno = pstartno;
		
		this.currentBtn = (int) (Math.ceil(pstartno+1)/(double)onepagelimit)+1;
		this.startBtn = ((int)(Math.floor((this.currentBtn-1)/(double)bottomnav)))*bottomnav+1;
		this.endBtn = this.startBtn+bottomnav-1;
		if(pageAll<endBtn) {this.endBtn=pageAll;}
	}
}