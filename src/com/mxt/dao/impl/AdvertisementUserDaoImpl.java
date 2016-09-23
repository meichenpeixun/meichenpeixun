package com.mxt.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.mxt.dao.AdvertisementUserDao;
import com.mxt.entity.AdvertisementUser;
import com.mxt.mapper.AdvertisementUserMapper;

@Repository("advertisementUserDaoImpl")
public class AdvertisementUserDaoImpl implements AdvertisementUserDao{

	@Autowired
	@Qualifier("advertisementUserMapper")
	private AdvertisementUserMapper adMapper;
	
	public AdvertisementUser findAdUserByUserName(String adUserName) {
		// TODO Auto-generated method stub
		return adMapper.findAdUserByUserName(adUserName);
	}
	
	/**
	 * 更新登录信息
	 */
	public void updateLoginInfo(AdvertisementUser adUser){
		adMapper.updateLoginInfo(adUser);
	}
	
	/**
	 * 添加用户
	 */
	public void addAdUser(AdvertisementUser adUser){
		adMapper.addAdUser(adUser);
	}
}
