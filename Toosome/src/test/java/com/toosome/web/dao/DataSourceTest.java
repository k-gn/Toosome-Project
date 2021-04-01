package com.toosome.web.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.toosome.web.testController.AdminVO;
import com.toosome.web.testController.TestMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {

	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;

	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private TestMapper mapper;
	
	@Test
	public void testConnection() {
		try (Connection con = dataSource.getConnection();) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	@Test
	public void testMyBatis() {
		try (SqlSession session = sqlSessionFactory.openSession(); 
			 Connection con = session.getConnection();) {
			log.info(session);
			log.info(con);

		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testQuery() {
		System.out.println(mapper);
		List<AdminVO> adminList = mapper.getAdminList();
		for(AdminVO vo : adminList) {
			System.out.println(vo);
		}
	}
}