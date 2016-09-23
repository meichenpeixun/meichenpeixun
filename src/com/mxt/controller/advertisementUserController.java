package com.mxt.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mxt.biz.AdvertisementUserBiz;
import com.mxt.entity.AdvertisementUser;
import com.mxt.utils.Md5Util;

@Controller("AdvertisementController")
@RequestMapping("/advertisment")
public class advertisementUserController {

	@Autowired
	@Qualifier("advertisementUserBizImpl")
	private AdvertisementUserBiz ad;
	
	@RequestMapping("login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String adUserName = request.getParameter("adUserName");
		
		String pwd = request.getParameter("password");
		
		String password =  Md5Util.strToMD5(pwd);
		
		String code = request.getParameter("code");
		
		HttpSession session = request.getSession();
		
		AdvertisementUser AdUser= ad.findAdUserByUserName(adUserName);
		
		response.setContentType("text/html;charset=UTF-8");
		if(code.equalsIgnoreCase((String)request.getSession().getAttribute("code"))){
			if (AdUser!=null) {
				if (AdUser.getPassword().toString().equals(password)) {
					if(AdUser.getDeleteType()==2){
						response.getWriter().write("登陆异常，请联系客服：400-859-9335");
						response.getWriter().flush();
					}else{
						session.setAttribute("name",AdUser.getRealName());
						session.setAttribute("username",AdUser.getAdUserName());
						Date date = new Date();
						AdUser.setLastLoginTime(date);
						String ip = InetAddress.getLocalHost().getHostAddress();
						AdUser.setLastLoginIp(ip);
						ad.updateLoginInfo(AdUser);
						if(AdUser.getDeleteType()==1){
							response.getWriter().write("succeed1");
							response.getWriter().flush();
						}else{
							response.getWriter().write("succeed");
							response.getWriter().flush();
						}
					}
				}else {
					response.getWriter().write("密码错误");
					response.getWriter().flush();
				}
			}else {
				response.getWriter().write("用户名不存在");
				response.getWriter().flush();
			}
		}else {
			response.getWriter().write("验证码错误");
			response.getWriter().flush();
		}
	}
	
	@RequestMapping("register")
	public void register(HttpServletRequest request,HttpServletResponse response,String phone,String password,String yzcode) throws IOException{
		System.out.println((String)request.getSession().getAttribute(phone));
		if(yzcode.equalsIgnoreCase((String)request.getSession().getAttribute(phone))){
			System.out.println(11111);
			AdvertisementUser adUser = ad.findAdUserByUserName(phone);
			System.out.println(2222);
			if(adUser!=null){
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("该手机后已被注册，不能再次注册！");
			    response.getWriter().flush();
			    response.getWriter().close();
			}else{
				System.out.println(33333);
				Date date = new Date();
				AdvertisementUser adUsers = new AdvertisementUser();
				adUsers.setPhone(phone);
				adUsers.setCreateTime(date);
				String pwd =  Md5Util.strToMD5(password);
				adUsers.setPassword(pwd);
				String adUserName = "用户"+new Date().getTime();
				adUsers.setAdUserName(adUserName);
				String ip = InetAddress.getLocalHost().getHostAddress();
				adUsers.setCreateIp(ip);
				ad.addAdUser(adUsers);
				HttpSession session = request.getSession();
				session.setAttribute("username",adUserName);
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("");
			    response.getWriter().flush();
			    response.getWriter().close();
			}
		}else{
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("验证码错误");
		    response.getWriter().flush();
		    response.getWriter().close();
		}
	}
	
}
