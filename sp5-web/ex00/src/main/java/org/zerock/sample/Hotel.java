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
	 //@AllArgsConstructor�� ����ϸ鼭 �����ڵ��� �ۼ� �ʿ� ����
	public Hotel(Chef chef) {
		this.chef = chef;
	}
	*/
	
}
