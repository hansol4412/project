package org.zerock.controller;

import java.util.List;
import java.util.Map;
import java.util.Collections;
import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;
import java.util.stream.IntStream;


import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class SampleController {
	// �ܼ� ���ڿ�
	@GetMapping(value = "/getTest", produces="Text/plain; charset=UTF-8")
	public String getText() {
		log.info("MIME TYPE:" + MediaType.TEXT_PLAIN_VALUE);
	return "�ȳ��ϼ���";
	}
	
	// ��ü
	@GetMapping(value = "/getSample", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public SampleVO getSample() {
		return new SampleVO(112, "��Ÿ", "�ε�");
	}
	
	@GetMapping(value = "/getSample2")
	public SampleVO getSample2() {
		return new SampleVO(113, "����", "����");
	}
	
	// ����Ʈ
	/*
	@GetMapping(value= "/getList")
	public List<SampleVO> getList()
	{
		return IntStream.range(1,10).mapToObj(i -> new SampleVO(i, i+"First", i+"Last")).collection(Collections.toList());
	}
	*/
	
	//��
	@GetMapping(value= "/getMap")
	public Map<String, SampleVO> getMap()
	{
		Map<String, SampleVO> map = new HashMap();
		map.put("First", new SampleVO(111, "�׷�Ʈ", "�ִϾ�"));
		return map;
	}
	
	//ResponseEntityŸ��
	@GetMapping(value="/check", params= {"height", "weight"} )
	public ResponseEntity<SampleVO> check(Double height, Double weight){
		SampleVO vo = new SampleVO(0,""+height, ""+weight);
		ResponseEntity<SampleVO> result = null;
		if(height<150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		}else {
			 result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		return result;
	}
	
	//PathVariable
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid) {
		return new String[] {"category: "+cat, "productId: "+pid};
	}
	
	//requestBody
	@PostMapping("ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("convert .......... ticket"+ticket);
		return ticket;
	}
}





