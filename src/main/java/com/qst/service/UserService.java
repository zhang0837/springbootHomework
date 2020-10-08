package com.qst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qst.bean.User;
import com.qst.dao.UserMapper;
import com.qst.service.UserService;

@Service
public class UserService {

	@Autowired
	public UserMapper userMapper;

	public List<User> getUserList() {
		List<User> userList = userMapper.getUserList(null);
		return userList;
	}

	public void insertUsers(User users) {
		userMapper.insertUsers(users);
	}

	public void deleteUsersById(Integer uid) {
		userMapper.deleteUsersById(uid);
	}

	public User getUserById(Integer uid) {
		List<User> userList = userMapper.getUserList(uid);
		if (userList.size() > 0) {
			return userList.get(0);
		} else {
			return null;
		}
	}

	public void updateUsers(User users) {
		// TODO Auto-generated method stub
		userMapper.updateUsers(users);
	}
}
