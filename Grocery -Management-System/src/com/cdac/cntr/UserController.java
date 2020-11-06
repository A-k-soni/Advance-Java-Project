package com.cdac.cntr;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;

import com.cdac.dto.User;
import com.cdac.service.UserService;
import com.cdac.valid.UserRegValidator;
import com.cdac.valid.UserValidator;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	@Autowired
	private UserRegValidator userRegValidator;
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value = "/prep_reg_form.htm",method = RequestMethod.GET)
	public String prepRegForm(ModelMap map) {
		map.put("user", new User());
		return "reg_form";
	}
	
	@RequestMapping(value = "/reg.htm",method = RequestMethod.POST)
	public String register(User user,BindingResult result,ModelMap map) {
		userRegValidator.validate(user, result);
		if(result.hasErrors()) {		
			return "reg_form";
		}
		boolean flag = userService.addUser(user);
		System.out.println("Flag = "+flag);
		if(flag==true) {
			return "login_form";
		}else {
			map.addAttribute("Email_Id_already_registerd", "Email_Id_already_registerd");
			
			return  "reg_form";
		}
	}
	
	@RequestMapping(value = "/prep_log_form.htm",method = RequestMethod.GET)
	public String prepLogForm(ModelMap map) {
		map.put("user", new User());
		return "login_form";
	}
	
	@RequestMapping(value = "/login.htm",method = RequestMethod.POST)
	public String login(User user,BindingResult result,ModelMap map,HttpSession session) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {		
			return "login_form";
		}
		boolean b = userService.findUser(user);
		if(b) {
			User u = userService.getUser(user.getUserId());
			session.setAttribute("user", u); 
			return "home";
		}else {
			map.put("user", new User());
			 map.addAttribute("Invalid_Credentials", "Invalid_Credentials");
			 session.setAttribute("error", "error");
			 session.removeAttribute("user");
				session.invalidate();
			return "login_form";
			}
	}
	
	@RequestMapping(value = "/logout.htm",method = RequestMethod.GET )
	public String logOutForm(ModelMap map , HttpSession session) {
		//session.invalidate();
		session.removeAttribute("user");
		session.invalidate();
		return "index";
	}
	@RequestMapping(value = "/prep_forgot_form.htm",method = RequestMethod.GET)
	public String prepForgotForm(ModelMap map) {
		map.put("user", new User());
		return "forgot_password";
	}
	
	@RequestMapping(value = "/prep_file_upload_form.htm",method = RequestMethod.GET)
	public String prepFileForm(ModelMap map) {
		map.put("user", new User());
		return "file_upload_form";
	}
	
	@RequestMapping(value = "/forgot_password.htm", method = RequestMethod.POST)
	public String forgotPassword(@RequestParam String email,ModelMap map) {
		String pass = userService.forgotPassword(email);
		String msg = "you are not registered";
		if(pass!=null) {	
			
			SimpleMailMessage message = new SimpleMailMessage();  
	        message.setFrom("cdacmumbai3@gmail.com");  
	        message.setTo(email);  
	        message.setSubject("Your password");  
	        message.setText(pass);  
	        //sending message   
	        mailSender.send(message);
			msg = "check the mail for password";
			map.put("user", new User());
			return "login_form";
		}else {
		map.addAttribute("msg",msg);
		return "forgot_password";
		}
	}
	
	@RequestMapping(value = "/upload_file.htm", method = RequestMethod.POST)
	public String uploadFile(@RequestParam("file") MultipartFile file,HttpSession session,HttpServletRequest request,ModelMap map) {
		String fileName = "0";

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				
				fileName = file.getOriginalFilename();
				fileName = fileName.substring(fileName.lastIndexOf("."));
				
				User user = (User)session.getAttribute("user");
				
				fileName = user.getUserId()+fileName;
				
				

				// Creating the directory to store file
				String rootPath = request.getServletContext().getRealPath("/");
				File dir = new File(rootPath + File.separator + "images");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				
				
				String filePath = dir.getAbsolutePath()+ File.separator +fileName;
				
				System.out.println("Server File Location= "+ filePath );
				
				File serverFile = new File(filePath);
				
						
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				userService.uploadImage(fileName, user.getUserId());
				
				user.setProfilePic(fileName);
				

			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		return "home";
	}
	
}