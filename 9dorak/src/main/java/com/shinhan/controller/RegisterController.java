package com.shinhan.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinhan.dto.MemVO;
import com.shinhan.model.MyPageService;
import com.shinhan.model.RegisterService;

import oracle.jdbc.proxy.annotation.Post;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("register")
public class RegisterController {
//	
	@Autowired
	RegisterService rService;
	MyPageService mService;
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@GetMapping("registerType.do")
	public void registerType() {
	}

	@GetMapping("registerForm.do")
	public String registerForm(Model model) {
//		System.out.println("registerForm.do");
		List<MemVO> mlist = rService.selectAll();
		model.addAttribute("mlist", mlist);
		return "register/registerForm";
	}

	@RequestMapping(value = "idCheck.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String idCheck(String mem_id) {
		int result = rService.idCheck(mem_id);
		if (result == 1) {
			return "false";
		} else {
			return "true";
		}

	}

	@RequestMapping(value = "codeCheck.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String codeCheck(String mem_code) {
		int result = rService.codeCheck(mem_code);
		if (result == 1) {
			return "true";
		} else {
			return "false";
		}

	}

	@PostMapping("register.do")
	public String register(Model model, MemVO mem, HttpSession session) {
		int result = rService.insertMember(mem);
		MemVO loginmem = mService.getMember(mem.getMem_id());
		session.setAttribute("loginmem", loginmem);
		return "home";
	}

}
