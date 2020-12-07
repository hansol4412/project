package org.zerock.sample;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter
//@AllArgsConstructor
@RequiredArgsConstructor
public class Hotel {
	@NonNull
	private Chef chef;

	/*
	 //@AllArgsConstructor을 사용하면서 생성자따로 작성 필요 없음
	public Hotel(Chef chef) {
		this.chef = chef;
	}
	*/
	
}
