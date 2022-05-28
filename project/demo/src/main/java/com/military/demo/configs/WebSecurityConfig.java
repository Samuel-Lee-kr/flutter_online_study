package com.military.demo.configs;

import com.military.demo.configs.handlers.CustomFailureHandler;
import com.military.demo.configs.handlers.CustomSuccessHandler;
import com.military.demo.services.UserService;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
    private final CustomSuccessHandler customSuccessHandler;
	private final CustomFailureHandler customFailureHandler;
	private final CustomAuthProvider customAuthProvider;
	private final UserService userService;

    @Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().ignoringAntMatchers("/graphql/**");
		
		http.authorizeRequests()
				.antMatchers("/static/**", "/login", "/join", "/forgot", "/mqtt/**", "/graphql/**").permitAll()
				// .antMatchers("/**").hasRole("ADMIN")
				// .antMatchers("/**").hasAnyRole("ADMIN", "USER")
				.anyRequest().authenticated();

		http.formLogin()
				.loginPage("/login") // default
				.loginProcessingUrl("/loginProcess")
				.usernameParameter("email")
				.passwordParameter("password")
				.successHandler(customSuccessHandler)
				.failureHandler(customFailureHandler)
				.permitAll();

		http.logout()
				.logoutUrl("/logout") // default
				.logoutSuccessUrl("/login")
				.invalidateHttpSession(true)
				.permitAll();

		http.exceptionHandling()
				.accessDeniedPage("/error/403");

		http.authenticationProvider(customAuthProvider);

	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}
    
}
