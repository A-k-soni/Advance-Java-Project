package com.cdac.valid;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.dto.User;

@Service
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(User.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email","unmKey", "Email Id Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPass", "passKey","Password Required");
		
		User user = (User)target;
		if(user.getUserPass()!=null) {
			if(user.getUserPass().length()<3) { 
				
				errors.rejectValue("userPass", "passKey","Password Should Be Greater Than 6 Charecter");
				
			}
		}
		
		
	}
	
}
