package com.chat;

public class Chat {
	
	private int chatId;
	private String chatName;
	private String chatContent;
	private String ChatTime;

	
	
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public String getChatContent() {
		return chatContent;
	}
	
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return ChatTime;
	}
	public void setChatTime(String chatTime) {
		ChatTime = chatTime;
	}
	@Override
	public String toString() {
		return "Chat [chatName=" + chatName + ", chatContent=" + chatContent + ", ChatTime=" + ChatTime + "]";
	}
	
	
	
	
}
