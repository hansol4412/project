package org.zerock.mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import java.util.stream.IntStream;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = { 141L, 142L, 143L, 144L, 145L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	/*
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 100).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("´ñÅ¬ Å×½ºÆ®" + i);
			vo.setReplyer("replyer" + i);
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno = 5L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}
	
	
	
	@Test
	public void testDelete() {
		Long targetRno = 10L;
		mapper.delete(targetRno);
	}
	
	
	@Test
	public void testUpdate() {
		Long targetRno = 5L;
		ReplyVO vo = mapper.read(targetRno);
		vo.setReply("update reply");
		int count = mapper.update(vo);
		log.info("update count::"+count);
		
	}
	*/
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 141L);
		replies.forEach(reply -> log.info(reply));
	}
	
}
