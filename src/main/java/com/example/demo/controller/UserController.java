package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.User;
import com.example.demo.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userservice;

	@Autowired
	HttpSession session;

	@GetMapping("/login")
	public ModelAndView loginform() {
		ModelAndView mv = new ModelAndView();
		// 세션에 값이 있으면 로그인 페이지로 못가게 할거야
		String name = (String) session.getAttribute("name");
		if (name == null) {
			mv.setViewName("login");
		} else {
			mv.setViewName("redirect:/boardlist");
		}
		return mv;
	}

	@PostMapping("/logout")
	public String logout() {
		session.invalidate();
		return "login";
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String userid, @RequestParam String userpw) {
		ModelAndView mv = new ModelAndView();
		try {
			User user = userservice.loginservice(userid, userpw);
			if (user != null) {
				session.setAttribute("name", user.getUsername());
				mv.setViewName("redirect:/boardlist");
			} else {
				mv.setViewName("login");
				mv.addObject("msg", "아이디 또는 비밀번호를 확인해주세요");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("err");
		}
		return mv;
	}

	@GetMapping("/join")
	public ModelAndView joinform() {
		ModelAndView mv = new ModelAndView("join");
		return mv;
	}

	@PostMapping("/join")
	public ModelAndView join(User user) {
		System.out.println(user.getUsername());
		System.out.println(user.getUserid());
		System.out.println(user.getUserpw());
		System.out.println(user.getUserpwCheck());
		System.out.println(user.getUserphone());
		System.out.println(user.getAgree());

		ModelAndView mv = new ModelAndView("login");
		try {
			userservice.joinservice(user);
			mv.addObject("msg", "회원가입을 축하해요");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}

	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestParam("userid") String userid) throws Exception {
		String msg = userservice.idCheck(userid);
		return msg;
	}

	
	
}
