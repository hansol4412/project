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
@ContextConfiguration(classes = {org.zerock.config.RootConfig.class})
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	/*
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("���� �ۼ��ϴ� ��3");
		board.setContent("���� �ۼ��ϴ� ����3");
		board.setWriter("newbie3");
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("���� �ۼ��ϴ� ��2");
		board.setContent("���� �ۼ��ϴ� ����2");
		board.setWriter("newbie2");
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
		log.info("DELETE COUNT:"+mapper.delete(17L));
	}
	
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(16L);
		board.setTitle("������ ��");
		board.setContent("������ ����");
		board.setWriter("user01");
		int count = mapper.update(board);
		log.info(board);
	}
	*/
}