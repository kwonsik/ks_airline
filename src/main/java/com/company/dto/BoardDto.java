package com.company.dto;

import lombok.Data;

@Data
public class BoardDto {
	private int bno,bhit,userno;
	private String bname,btitle,bcontent,bdate,bip;
	
}
/*
 bno	int	NO	PRI	
bname	varchar(100)	NO		
btitle	varchar(1000)	NO		
bcontent	text	NO		
bdate	timestamp	NO		CURRENT_TIMESTAMP
bhit	int	NO		0
bip	varchar(50)	NO		
 */
