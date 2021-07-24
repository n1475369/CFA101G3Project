package com.websocket.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.gson.Gson;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {
	//(sender發送者會員編號:receiver接收者會員編號)

	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private static Gson gson = new Gson();

	//取得歷史訊息並把未讀改為已讀
	public static List<String> getHistoryMsg(String sender, String receiver) {
		String key = new StringBuilder(sender).append(":").append(receiver).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> historyData = jedis.lrange(key, 0, -1);
		List<String> list = new ArrayList<String>();//將未讀狀態改為已讀
		for (int i = 0; i < historyData.size(); i++) {
			ChatMessage chatMessage = gson.fromJson(historyData.get(i), ChatMessage.class);
			chatMessage.setStatus("1");
			String json = gson.toJson(chatMessage);
			jedis.lset(key, i, json);
			list.add(json);
		}
		jedis.close();
		return list;
	}

	//儲存對話紀錄
	public static void saveChatMessage(String sender, String receiver, String message) {
		// 對雙方來說，都要各存著歷史聊天記錄
		String senderKey = new StringBuilder(sender).append(":").append(receiver).toString();
		String receiverKey = new StringBuilder(receiver).append(":").append(sender).toString();
		Jedis jedis = pool.getResource();
		jedis.rpush(senderKey, message);
		jedis.rpush(receiverKey, message);
		jedis.close();
	}
	
	//取得之前聊天過的會員集合
	public static Set<String> getHistoryFriends(String sender) {
		Jedis jedis = null;
		jedis = pool.getResource();
		Set<String> senderkeys = jedis.keys(sender+":*");
		Set<String> receiverkeys = jedis.keys("*:"+sender);

		Set<String> FriendsSet = new HashSet<String>();
		
		for(String senderkey:senderkeys) {
			String[] split = senderkey.split(":");
			FriendsSet.add(split[1]);
		}
		
		for(String receiverkey:receiverkeys) {
			String[] split = receiverkey.split(":");
			FriendsSet.add(split[0]);
		}
		System.out.println(FriendsSet);
		jedis.close();
		return FriendsSet;
	}
	
	//取得未讀數量
	public static Integer getUnReadCount(String sender, String receiver) {
		String key = new StringBuilder(sender).append(":").append(receiver).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		Integer count = 0;
		List<String> historyData = jedis.lrange(key, 0, -1);
		for (int i = 0; i < historyData.size(); i++) {
			ChatMessage chatMessage = gson.fromJson(historyData.get(i), ChatMessage.class);
			if(chatMessage.getStatus().equals("0")) {
				count++;
			}
		}
		jedis.close();
		return count;
	}
}
