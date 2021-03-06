package com.elcar;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override 
	public void configure(WebSecurity web) throws Exception {
		web
		.ignoring() 
		.requestMatchers(PathRequest.toStaticResources()
		.atCommonLocations()); 
		}

	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.cors().disable()
		.csrf().disable()
		.formLogin().disable()
		.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.and()
		.headers().frameOptions().disable();

	}
	
}
