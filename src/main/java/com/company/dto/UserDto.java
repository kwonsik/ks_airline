package com.company.dto;

import lombok.Data;

@Data
public class UserDto {
	/*
| userno       | int           | NO   | PRI | NULL              | auto_increment    |
| userid       | varchar(30)   | NO   |     | NULL              |                   |
| username     | varchar(30)   | NO   |     | NULL              |                   |
| userpass     | varchar(30)   | NO   |     | NULL              |                   |
| useremail    | varchar(30)   | NO   |     | NULL              |                   |
| time         | datetime      | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| userphone    | varchar(20)   | NO   |     | NULL              |                   |
| userpost     | varchar(20)   | NO   |     | NULL              |                   |
| useraddress1 | varchar(1000) | NO   |     | NULL              |                   |
| useraddress2 | varchar(1000) | YES  |     | NULL              |                   |
| sms          | char(2)       | NO   |     | NULL              |                   |
| userip       | varchar(30)   | YES  |     | NULL              |                   |
+--------------+---------------+------+-----+-------------------+-------------------+
	*/
	private int userno;
	private String userid, username, userpass, useremail, time, userphone, userpost,
	               useraddress1,useraddress2,sms,userip;
	@Override
	public String toString() {
		return "UserDto [userno=" + userno + ", userid=" + userid + ", username=" + username + ", userpass=" + userpass
				+ ", useremail=" + useremail + ", time=" + time + ", userphone=" + userphone + ", userpost=" + userpost
				+ ", useraddress1=" + useraddress1 + ", useraddress2=" + useraddress2 + ", sms=" + sms + ", userip="
				+ userip + "]";
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserpost() {
		return userpost;
	}
	public void setUserpost(String userpost) {
		this.userpost = userpost;
	}
	public String getUseraddress1() {
		return useraddress1;
	}
	public void setUseraddress1(String useraddress1) {
		this.useraddress1 = useraddress1;
	}
	public String getUseraddress2() {
		return useraddress2;
	}
	public void setUseraddress2(String useraddress2) {
		this.useraddress2 = useraddress2;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
}	
