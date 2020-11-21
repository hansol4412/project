package config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Autowired;

import config.MarketConfig;
import controller.RegisterController;
@Configuration
public class ControllerConfig {
	// 컨트롤러 의존설정 
	
	@Bean
	public RegisterController registerController() {
		return new RegisterController();
	}
}
