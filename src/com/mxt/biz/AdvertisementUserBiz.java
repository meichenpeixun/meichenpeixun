package com.mxt.biz;

import com.mxt.entity.AdvertisementUser;

public interface AdvertisementUserBiz {

	public AdvertisementUser findAdUserByUserName(String adUserName);
	
	public void updateLoginInfo(AdvertisementUser adUser);	//���µ�¼��Ϣ
	
	public void addAdUser(AdvertisementUser adUser);	//����û�
}
