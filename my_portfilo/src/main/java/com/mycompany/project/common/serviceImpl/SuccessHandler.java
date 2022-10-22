package com.mycompany.project.common.serviceImpl;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication. AuthenticationSuccessHandler;


public class SuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess (HttpServletRequest request, HttpServletResponse response,
			 Authentication authentication) throws IOException, ServletException {

		String auth = authentication.getAuthorities().toString();
		
		
		if("[ROLE_PAUSE]".equals(auth)) {
			
			response.sendRedirect("/pause");
		} else {
		
		 		response.sendRedirect("/main");
		}
//		RequestDispatcher rd = request.getRequestDispatcher("/main");
//		rd. forward(request, response);
	}
}
