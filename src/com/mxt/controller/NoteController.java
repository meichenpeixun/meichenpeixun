package com.mxt.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("SendNote")
@RequestMapping("/note")
public class NoteController {
	
	  @RequestMapping("/getCode")
	  public void getCode(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException {
		 String phone = req.getParameter("phone");
		 String code = RandomUtil.createRandomVcode(); 
		 HttpSession session = req.getSession();
	    /* System.out.print(code);*/
	     session.setAttribute(phone, code);
	     System.out.print(code);
		 String note = "您的验证码为"+code+"，请尽快填写，请勿向任何人泄露信息，感谢您使用美享厅在线教育平台";
		 HttpClient client = new HttpClient();
		 PostMethod post = new PostMethod("http://sms.cloud.hbsmservice.com:8080/sms_send2.do"); 
		 post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		 NameValuePair[] data ={ 
				 new NameValuePair("corp_id", "mc6632"),
				 new NameValuePair("corp_pwd", "6632de"),
				 new NameValuePair("corp_service","1069014881368"),
				 new NameValuePair("mobile",phone),
				 new NameValuePair("msg_content",note),
				 new NameValuePair("corp_msg_id",""),
				 new NameValuePair("ext","")
				 };
		 	post.setRequestBody(data);
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			System.out.println("statusCode:"+statusCode);
			for(Header h : headers){
		    	System.out.println(h.toString());
			}
			String result = new String(post.getResponseBodyAsString()); 
	   		System.out.println(result);
	    	post.releaseConnection();
	 }

}
