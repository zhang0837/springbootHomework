package com.qst.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	private int uid;
	private String user_name;
	private String sex;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", user_name=" + user_name + ", sex=" + sex + ", birthday=" + birthday + "]";
	}

}
