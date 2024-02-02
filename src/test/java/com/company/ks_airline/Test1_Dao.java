package com.company.ks_airline;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.company.dao.ReservationDao;
import com.company.dao.TestDao;
import com.company.dto.UserDto;

import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log
public class Test1_Dao {
	@Autowired ApplicationContext context;
	@Autowired ReservationDao dao;

	@Test @Ignore public void test0() { log.info("컨텍스트는 "+context); }
	@Test  public void test2() { 
			System.out.println(dao.getAList());
		
	}
	
	
}



