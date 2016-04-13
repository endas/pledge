package com.netgrains.web.exception;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class AccessDeniedHandlerImpl implements AccessDeniedHandler {
	
	static final Logger logger = LoggerFactory.getLogger(AccessDeniedHandlerImpl.class);

	private String errorPage;

	public AccessDeniedHandlerImpl() {
	}

	public AccessDeniedHandlerImpl(String errorPage) {
		this.errorPage = errorPage;
	}

	public String getErrorPage() {
		return errorPage;
	}

	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
		AccessDeniedException accessDeniedException) 
                throws IOException, ServletException {

		logger.debug("handle - errorPage: " + errorPage);
		//do some business logic, then redirect to errorPage url
		response.sendRedirect(errorPage);

	}

}
