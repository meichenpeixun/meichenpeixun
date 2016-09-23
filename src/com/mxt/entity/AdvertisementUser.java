package com.mxt.entity;

import java.util.Date;

public class AdvertisementUser {
	
	//广告用户id
	private int adUserId;
	
	//用户名
	private String adUserName;
	
	//密码
	private String password;
	
	//用户属性
	private int userType;
	
	//业务id
	private int businessId;
	
	//前台用户id
	private int userid;
	
	//真实姓名
	private String realName;
	
	//联系方式
	private String phone;
	
	//删除状态
	private int deleteType;
	
	//添加/注册时间
	private Date createTime;
	
	//添加人
	private String createPerson;
	
	//最后登录时间
	private Date lastLoginTime;
	
	//最后登录ip
	private String lastLoginIp;
	
	//组织机构代码证号
	private String orgCode;
	
	//最后修改人
	private String lastUpdatePerson;
	
	//最后修改时间
	private Date lastUpdateTime;
	
	//注册人ip
	private String createIp;

	public int getAdUserId() {
		return adUserId;
	}

	public void setAdUserId(int adUserId) {
		this.adUserId = adUserId;
	}

	public String getAdUserName() {
		return adUserName;
	}

	public void setAdUserName(String adUserName) {
		this.adUserName = adUserName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getBusinessId() {
		return businessId;
	}

	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDeleteType() {
		return deleteType;
	}

	public void setDeleteType(int deleteType) {
		this.deleteType = deleteType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getLastUpdatePerson() {
		return lastUpdatePerson;
	}

	public void setLastUpdatePerson(String lastUpdatePerson) {
		this.lastUpdatePerson = lastUpdatePerson;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getCreateIp() {
		return createIp;
	}

	public void setCreateIp(String createIp) {
		this.createIp = createIp;
	}
	
}
