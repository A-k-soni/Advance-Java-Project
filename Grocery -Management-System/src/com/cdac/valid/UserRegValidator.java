package com.cdac.valid;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.dto.User;

@Service
public class UserRegValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(User.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName","firstName", "First Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "lastName","Last Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mobileNumber", "mobileNumber","Mobile Number Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email","Email Id Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPass", "userPass","Password Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "gender","Gender Required");
		
		User user = (User)target;
		if(user.getUserPass()!=null) {
			if(user.getUserPass().length()<6) { 
				errors.rejectValue("userPass", "passKey","Password Should Be Greater Than 6 Charecter");
			}
		}
		
		
	}
	
}
