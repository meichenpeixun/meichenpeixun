package com.mxt.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mxt.biz.AdvertisementUserBiz;
import com.mxt.dao.AdvertisementUserDao;
import com.mxt.entity.AdvertisementUser;

@Service("advertisementUserBizImpl")
public class AdvertisementUserBizImpl implements AdvertisementUserBiz{

	@Autowired
	@Qualifier("advertisementUserDaoImpl")
	public AdvertisementUserDao advertisementUserDao;
	
	public AdvertisementUser findAdUserByUserName(String adUserName){
		return advertisementUserDao.findAdUserByUserName(adUserName);
	}
	
	/**
	 * 更新登录信息
	 */
	public void updateLoginInfo(AdvertisementUser adUser){
		advertisementUserDao.updateLoginInfo(adUser);
	}
	
	/**
	 * 添加用户
	 */
	public void addAdUser(AdvertisementUser adUser){
		advertisementUserDao.addAdUser(adUser);
	}
}
