package test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import fleaMarket.a02_service.CommunitySelectService;
import fleaMarket.a03_dao.CommunitySelectDao;
import vo.CapplicationList;
import vo.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/dispatcher-servlet.xml")
public class CommunityTest {
	
	@Autowired
	private CommunitySelectDao mapper;
	
	@Autowired
	private CommunitySelectService service;
	
	private final Logger logger = LoggerFactory.getLogger(CommunityTest.class);
	
	/**
	 * @param dao
	 */

    /*mapper test*/
	@Test
	public void testGetCommunityList() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		List<CapplicationList> list = mapper.getCommunityList(cri);
		list.forEach(commu -> logger.info(""+commu));
	}
	
	
}
