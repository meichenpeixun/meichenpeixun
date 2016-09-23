package com.mxt.dao;

import com.mxt.entity.AdvertisementUser;

public interface AdvertisementUserDao {

	public AdvertisementUser findAdUserByUserName(String adUserName);
	
	public void updateLoginInfo(AdvertisementUser adUser);	//���µ�¼��Ϣ
	
	public void addAdUser(AdvertisementUser adUser);	//����û�
	
}
