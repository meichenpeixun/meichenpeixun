package com.mxt.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.Mapper;

import com.mxt.entity.AdvertisementUser;

@Mapper("advertisementUserMapper")
public interface AdvertisementUserMapper {
	
	@Select("select * from advertisementUser where adUserName = #{adUserName} or phone = #{adUserName}")
	public AdvertisementUser findAdUserByUserName(String adUserName);		//�����û�������ѯ��Ϣ
	
	@Update("update advertisementUser set lastLoginTime = #{lastLoginTime},lastLoginIp = #{lastLoginIp} where adUserId = #{adUserId}")
	public void updateLoginInfo(AdvertisementUser adUser);		//���µ�½��Ϣ	
	
	@Insert("insert into advertisementUser(phone,password,createTime,adUserName,createIp) value (#{phone},#{password},#{createTime},#{adUserName},#{createIp})")
	public void addAdUser(AdvertisementUser adUser);	//����û�
}