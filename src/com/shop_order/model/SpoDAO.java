package com.shop_order.model;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.shop_order_item.model.SpoiVO;

public interface SpoDAO {
	//新增商品訂單(需藉由別人的連線)(單筆)
	public Integer insert(SpoVO spoVO,List<SpoiVO> spoiVOList,Connection con);
	//新增多筆商品訂單
	public List<Integer> insertMultiple(HashMap<Integer, List<SpoiVO>> smemMap,String name,String phone,Integer paytype,HashMap<Integer,Integer> postageMap,String address,Integer bmem_id);
	//更新多筆訂單付款狀態
	public void updateAllSpo_pay_status(List<Integer> spo_idList,Integer spo_pay_status);
	//取得所有訂單
	public List<SpoVO> getAll();
	//獲取單筆訂單
	public SpoVO getOne(Integer spo_id);
	//更新訂單狀態
	public void update_spo_status(Integer spo_id,Integer spo_status);
	//更新付款狀態
	public void update_spo_pay_status(Integer spo_id,Integer spo_pay_status);
	//更新發貨狀態
	public void update_spo_cargo_status(Integer spo_id,Integer spo_cargo_status);
}