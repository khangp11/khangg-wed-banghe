package com.poly.interceptor;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.model.Account;
import com.poly.model.RoleDetail;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@Component
public class AuthInterceptor implements HandlerInterceptor{
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String uri = request.getRequestURI();
		Account account = session.get("user");
		String error = "";
		
		if(account == null) {
			error = "Please login!";
		}else {
			for(RoleDetail roleDetail : account.getRoleDetails()) {
				if(roleDetail.getRole().getRole().equals("user") && uri.startsWith("/admin")) {
					error = "Access denied!";
					break;
				}
			}
		}
		
		if(error.length() > 0) {
			session.set("security-uri", uri);
			response.sendRedirect("/login?message="+error);
			return false;
		}
		return true;
	}

}
