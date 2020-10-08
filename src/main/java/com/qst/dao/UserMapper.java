package com.qst.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.qst.bean.User;

@Mapper
public interface UserMapper {

	public List<User> getUserList(@Param("uid") Integer uid);

	public void insertUsers(User users);

	public void deleteUsersById(Integer id);

	public void updateUsers(User users);

}
