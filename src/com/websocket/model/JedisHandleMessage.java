package com.websocket.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {
	// 此範例key的設計為(發送者名稱:接收者名稱)，實際應採用(發送者會員編號:接收者會員編號)

	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	public static List<String> getHistoryMsg(String sender, String receiver) {
		String key = new StringBuilder(sender).append(":").append(receiver).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
	}

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

}
