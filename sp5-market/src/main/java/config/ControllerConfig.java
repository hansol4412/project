package config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import member.MemberRegisterService;
import controller.RegisterController;
@Configuration
public class ControllerConfig {
	// 컨트롤러 의존설정 
	
	@Autowired
	private MemberRegisterService memberRegSvc;
	
	@Bean
	public RegisterController registerController() {
	RegisterController controller = new RegisterController();
	controller.setMemberRegisterService(memberRegSvc);
	return controller;
	}
}