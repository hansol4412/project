package controller;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import member.RegisterRequest;

public class RegisterRequestValidator implements Validator{
	private static final String RegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*";
	private Pattern pattern;
	
	public RegisterRequestValidator() {
		pattern = Pattern.compile(RegExp);
	}
	
	//메소드 파라미터로 받은 clazz객체가 RegisterRequest클래스로 타입변환이 가능한지 확인
	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}
	
	//validate() 메소드는 target과 error 파라미터를 가진다.
	//target 파라미터는 검사 대상 객체이고, error 파라미터는 검사결과 에러코드를 설정하기 위한 객체
	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest)target;
		if(regReq.getId()==null || regReq.getId().trim().isEmpty()) {
			errors.rejectValue("id","required");
		}else {
			Matcher matcher = pattern.matcher(regReq.getId());
			if(!matcher.matches()) {
				errors.rejectValue("id","bad");
			}
		}
	
		ValidationUtils.rejectIfEmpty(errors, "password", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		ValidationUtils.rejectIfEmpty(errors, "gender", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birth", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "required");
		ValidationUtils.rejectIfEmpty(errors, "address", "required");
	
		if(!regReq.getPassword().isEmpty()) {
			if(!regReq.isPasswordEqualsToConfirmPassword()) {
				errors.rejectValue("confirmPassword", "nomatch");
			}
		}
	
	}
	
	}
