package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springweb.a01_start.A10_HelloController;

@Configuration
public class ControllerConfig {

	@Bean
	public A10_HelloController helloController() {
		return new A10_HelloController();
	}

}
