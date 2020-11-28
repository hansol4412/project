package controller;
import java.util.List;
import java.util.ArrayList;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.validation.Errors;
import member.MemberRegisterService;
import member.DuplicateMemberException;
import member.RegisterRequest;
@Controller
public class RegisterController {
	private MemberRegisterService memberRegisterService;

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}
	
	@PostMapping("/register/step2")
	public String handleStep2(@RequestParam(value="agree", defaultValue="false")Boolean agree,
			Model model){
		if(!agree) {
			return "register/step1";
		}
		
		List<String> birthM = new ArrayList<>();
			birthM.add("01");
			birthM.add("02");
			birthM.add("03");
			birthM.add("04");
			birthM.add("05");
			birthM.add("06");
			birthM.add("07");
			birthM.add("08");
			birthM.add("09");
			birthM.add("10");
			birthM.add("11");
			birthM.add("12");
		model.addAttribute("birthM", birthM);
		
		List<String> emailT = new ArrayList<>();
			emailT.add("naver.com");
			emailT.add("hanmail.net");
			emailT.add("gmail.com");
			emailT.add("nate.com");
		model.addAttribute("emailT", emailT);
		
		List<String> phoneO = new ArrayList<>();
			phoneO.add("010");
			phoneO.add("011");
			phoneO.add("016");
			phoneO.add("017");
			phoneO.add("019");
		model.addAttribute("phoneO", phoneO);
		
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/step2";
	}
	
	@GetMapping("/register/step2")
	public String handleStep2Get() {
		return "redirect:/register/step1";
	}
	
	@PostMapping("/register/step3")
	public String handleStep3(RegisterRequest registerRequest, Errors errors) {
		new RegisterRequestValidator().validate(registerRequest, errors);
		if(errors.hasErrors()) return "register/step2";
		try {
			memberRegisterService.regist(registerRequest);
			return "register/step3";
		}catch(DuplicateMemberException ex){
			errors.rejectValue("id", "duplicate");
			return "/register/step2";
		}
	}
	
	@GetMapping("/register/step3")
	public String handleStep3Get() {
		return "redirect:/register/step1";
	}

}
