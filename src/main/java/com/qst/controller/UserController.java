package com.qst.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qst.bean.Message;
import com.qst.bean.User;
import com.qst.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userList");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public List<User> getAllUsers() {
		List<User> userList = userService.getUserList();
		return userList;
	}

	@ResponseBody
	@RequestMapping(value = "/news", method = RequestMethod.POST)
	public Message addNews(User user) {
		userService.insertUsers(user);
		Message msg = new Message();
		msg.setMsg("添加成功!!!");
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "/news/{uid}", method = RequestMethod.DELETE)
	public Message deleteUser(@PathVariable("uid") Integer uid) {
		userService.deleteUsersById(uid);
		Message msg = new Message();
		msg.setMsg("删除成功!!!");
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "/news/{id}", method = RequestMethod.GET)
	public Message getUserById(@PathVariable("id") Integer id) {
		User user = userService.getUserById(id);
		Message msg = new Message(user);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "/news", method = RequestMethod.PUT)
	public Message updataNews(User user) {
		userService.updateUsers(user);
		Message msg = new Message("更新成功！！！");
		return msg;
	}
}
