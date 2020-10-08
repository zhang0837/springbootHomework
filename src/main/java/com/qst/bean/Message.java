package com.qst.bean;

public class Message {
	private String msg;
	private User user;

	public Message() {
		super();
	}

	public Message(String msg) {
		this.msg = msg;
	}

	public Message(User users) {
		this.user = users;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
