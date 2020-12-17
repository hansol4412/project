package org.zerock.mapper;
import org.zerock.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글1");
		board.setContent("새로 작성하는 내용1");
		board.setWiter("newbie1");
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글2");
		board.setContent("새로 작성하는 내용2");
		board.setWiter("newbie2");
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(1L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT:"+mapper.delete(3L));
	}
	
	*/
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(1L);
		board.setTitle("수정된 글");
		board.setContent("수정된 내용");
		board.setWiter("user01");
		int count = mapper.update(board);
		log.info(board);
	}
}
