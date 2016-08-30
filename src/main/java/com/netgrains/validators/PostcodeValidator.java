package com.netgrains.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("postcodeValidator")
public class PostcodeValidator {

	private Pattern pattern;
	private Matcher matcher;

	private static final String EMAIL_PATTERN = "[AC-FHKNPRTV-Y]{1}[0-9]{1}[0-9W]{1}[ \\-]?[0-9AC-FHKNPRTV-Y]{4}";

	public PostcodeValidator() {
		pattern = Pattern.compile(EMAIL_PATTERN);
	}

	public boolean valid(final String email) {

		matcher = pattern.matcher(email);
		return matcher.matches();

	}
}