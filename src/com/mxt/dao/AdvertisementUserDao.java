package com.mxt.dao;

import com.mxt.entity.AdvertisementUser;

public interface AdvertisementUserDao {

	public AdvertisementUser findAdUserByUserName(String adUserName);
	
	public void updateLoginInfo(AdvertisementUser adUser);	//更新登录信息
	
	public void addAdUser(AdvertisementUser adUser);	//添加用户
	
}
