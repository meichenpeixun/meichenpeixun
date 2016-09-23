package com.mxt.biz;

import com.mxt.entity.AdvertisementUser;

public interface AdvertisementUserBiz {

	public AdvertisementUser findAdUserByUserName(String adUserName);
	
	public void updateLoginInfo(AdvertisementUser adUser);	//更新登录信息
	
	public void addAdUser(AdvertisementUser adUser);	//添加用户
}
