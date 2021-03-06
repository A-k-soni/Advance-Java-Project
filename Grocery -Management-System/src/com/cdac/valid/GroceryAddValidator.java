package com.cdac.valid;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cdac.dto.Grocery;
import com.cdac.dto.User;

@Service
public class GroceryAddValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(User.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemName","itemName", "*Item Name Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "purchaseDate","purchaseDate", "Purchase Date Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "expiryDate","expiryDate", "Expiry Date Required");
		
	}
	
}
