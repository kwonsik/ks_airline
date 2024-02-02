package com.company.dto;

import lombok.Data;

@Data
public class ReservationDto {
	/*
+--------+----------+------+-----+-------------------+-------------------+
| Field  | Type     | Null | Key | Default           | Extra             |
+--------+----------+------+-----+-------------------+-------------------+
| rno    | int      | NO   | PRI | NULL              | auto_increment    |
| userno | int      | NO   | MUL | NULL              |                   |
| no     | int      | NO   | MUL | NULL              |                   |
| time   | datetime | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| price  | int      | NO   |     | NULL              |                   |
| adult  | char(2)  | NO   |     | NULL              |                   |
| state  | int      | NO   |     | 1                 |                   |
+--------+----------+------+-----+-------------------+-------------------+
	*/
	private int rno,no,price,state,rpno;
	private String time,adult;
	
}
