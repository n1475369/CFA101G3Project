package com.locationroom.model;

import java.util.*;

import com.member.model.MemVO;


public interface LocrDAO_interface {


	public void insert(LocrVO LocrVO);
	public void update(LocrVO LocrVO);
	public void delete(Integer LOCR_ID);
	public LocrVO findByPrimaryKey(Integer LOCR_ID);
	public List<LocrVO> getAll() ;
//	public List<LocrVO> GET_SMEM_LOCR(Integer LOCR_SMEM_ID);
	public LocrVO getLastID();
	public MemVO  getSmem(Integer MEM_ID);
	
}
