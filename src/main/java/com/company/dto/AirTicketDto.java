package com.company.dto;

import lombok.Data;

@Data
public class AirTicketDto {
	/*+-----------+-------------+------+-----+-------------------+-------------------+
| Field     | Type        | Null | Key | Default           | Extra             |
+-----------+-------------+------+-----+-------------------+-------------------+
| no        | int         | NO   | PRI | NULL              | auto_increment    |
| company   | varchar(30) | NO   |     | NULL              |                   |
| name      | varchar(30) | NO   |     | NULL              |                   |
| departure | varchar(50) | NO   |     | NULL              |                   |
| arrival   | varchar(50) | NO   |     | NULL              |                   |
| date      | date        | NO   |     | NULL              |                   |
| dtime     | time        | NO   |     | NULL              |                   |
| atime     | time        | NO   |     | NULL              |                   |
| aprice    | int         | NO   |     | NULL              |                   |
| kprice    | int         | YES  |     | NULL              |                   |
| count     | int         | NO   |     | NULL              |                   |
| addtime   | datetime    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-----------+-------------+------+-----+-------------------+-------------------+*/
	private int no,aprice,kprice,count,state;
	private String company,name,departure,arrival,date,dtime,atime,addtime;

}
