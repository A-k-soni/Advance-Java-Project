package com.cdac.cntr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdac.dto.Grocery;
import com.cdac.dto.User;
import com.cdac.service.GroceryService;
import com.cdac.valid.GroceryAddValidator;
import com.cdac.valid.GroceryUpdateValidator;

@Controller
public class GroceryController {
	
	@Autowired
	private GroceryService groceryService;
	@Autowired
	private GroceryAddValidator groceryAddValidator;
	@Autowired
	private GroceryUpdateValidator groceryUpdateValidator; 
	
	@RequestMapping(value = "/prep_grocery_add_form.htm",method = RequestMethod.GET)
	public String prepGroceryAddForm(ModelMap map , HttpSession session) {
		map.put("grocery", new Grocery());
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		}else {
			return "grocery_add_form";	
		}
		
	}
	
	@RequestMapping(value = "/grocery_add.htm",method = RequestMethod.POST)
	public String groceryAdd(Grocery grocery,BindingResult result,HttpSession session) {
		groceryAddValidator.validate(grocery, result);
		if(result.hasErrors()) {		
			return "grocery_add_form";
		}
		int userId = ((User)session.getAttribute("user")).getUserId();
		grocery.setUserId(userId); 
		groceryService.addGrocery(grocery);
		return "home";
	}
	
	@RequestMapping(value = "/grocery_list.htm",method = RequestMethod.GET)
	public String allGrocerys(ModelMap map,HttpSession session) {
		
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return "index";
		}else {	
		int userId = ((User)session.getAttribute("user")).getUserId();
		List<Grocery> li = groceryService.selectAll(userId);
		map.put("groceryList", li);
		return "grocery_list";
		}
	}
	
	@RequestMapping(value = "/grocery_delete.htm",method = RequestMethod.GET)
	public String groceryDelete(@RequestParam int groceryId,ModelMap map,HttpSession session) {
		
		groceryService.removeGrocery(groceryId); 
		
		int userId = ((User)session.getAttribute("user")).getUserId();
		List<Grocery> li = groceryService.selectAll(userId);
		map.put("groceryList", li);
		return "grocery_list";
	}
	
	@RequestMapping(value = "/grocery_update_form.htm",method = RequestMethod.GET)
	public String groceryUpdateForm(@RequestParam int groceryId,ModelMap map) {
		
		Grocery exp = groceryService.findGrocery(groceryId);
		map.put("grocery", exp);
		
		return "grocery_update_form";
	}
	
	@RequestMapping(value = "/grocery_update.htm",method = RequestMethod.POST)
	public String groceryUpdate(Grocery grocery,BindingResult result,ModelMap map,HttpSession session) {
		groceryAddValidator.validate(grocery, result);
		if(result.hasErrors()) {		
			return "grocery_update_form";
		}
		int userId = ((User)session.getAttribute("user")).getUserId();
		grocery.setUserId(userId);
		groceryService.modifyGrocery(grocery);
			
		List<Grocery> li = groceryService.selectAll(userId);
		map.put("groceryList", li);
		return "grocery_list";
	}
	
}