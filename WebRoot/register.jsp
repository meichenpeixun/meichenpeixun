<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="keywords" content="">
<meta name="description" content="">
<title>美享厅广告系统注册</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/signup.css">
<style type="text/css">
	.font14 {
    margin-right: 30px;
    font-weight: normal;
}.send-verify {
    width: 135px;
    height: 30px;
    line-height: 30px;
    background: #2b84ff;
    color: #fff;
    text-align: center;
    padding: 0;
    cursor: pointer;
    border: none;
}
.abhe{
	background: white;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #edf1f4;
}
</style>
<script type="text/javascript">
	function register(){
		var phone = $("#phone").val();
		var password=$("#password").val();
		var yzcode=$("#yzcode").val();
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				alert("请输入正确的手机号!");
				return;
		}
		if(password==""){
			alert("密码不能为空!");
			return;
		}
		if(yzcode==""){
			alert("验证码不能为空!");
			return;
		}
		
		$.ajax({
			type:"POST",
			data:{phone:$("#phone").val(),password:$("#password").val(),yzcode:yzcode},
      		url:"<%=basePath%>advertisment/register.do",
      		success:function(data){
      		if(data==""){
      		alert("注册成功!");
      			window.location="<%=basePath%>login.jsp";
      		}else{
      			alert(data);
      		}
      	}
		})
	}
	
	var InterValObj; //timer变量，控制时间
	var count = 120; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	
	function send(){
		var phone = $("#phone").val();
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				alert("请输入正确的手机号!");
				return;
		}
		curCount = count;
		alert($("#sends").val());
		$("#sends").attr("disabled","true");
		$("#sends").css("background-color","gray");
		$("#sends").val("剩余" + curCount + "秒");
		InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
		$.ajax({
			type:"POST",
			url:"<%=basePath%>note/getCode.do?phone="+phone,
			success:function(data){
			}
		})
	}
	
	//timer处理函数
	function SetRemainTime() {
		if (curCount == 0) {                
			window.clearInterval(InterValObj);// 停止计时器
			$("#sends").removeAttr("disabled");// 启用按钮
			$("#sends").css("background-color","2b84ff");
			$("#sends").val("重新发送验证码");
		}else {
			curCount--;
			$("#sends").val("剩余" + curCount + "秒");
		}
}
</script>
</head>
<body class="YaHei sign-up">
	<div class="abhe">
		 <div style="font-size:25px;margin:0 auto;width:1170px;" class="rows">
		<div style="float:right;">用户注册</div>
		<span style="float:left;font-size:16px;">
			<a href="http://www.meixt.cn"><img src="http://www.meixt.cn/list/images/logo3.png" alt="美享厅主站" /></a>
		</span>
    </div>
	</div>
<div class="main-area sign-main-area">
    <div class="container sign-container">
        <div class="sign-left fl">
            <ul class="sign-tabs">
                <li class="active"><a class="sign-mobile">手机注册</a></li>
            </ul>
            <input id="reg_partner" value="" type="hidden">
            <input id="reg_openid" value="" type="hidden">
            <input id="invitation_code" value="" type="hidden">
            <div class="tab-content">
                <div class="tab-pane active" id="sign-mobile">
                    <form id="mobile_register_form">
                        <div class="form-group marginB20">
							<input class="form-control"maxlength="11" id="phone" name="mobile_code" type="text">
							<label style="transform: translateY(0px);" for="mobile_code">请输入手机号码</label>
							<span style="" class="m_sign_tips font12 color99 error">请输入你的手机号</span>
						</div>
                        <div class="form-group">
							<input class="form-control" id="password" maxlength="20" name="password_m" value="" type="password">
							<label style="transform: translateY(0px);" for="password_m">设置您的登录密码</label>
							<span style="" class="p_sign_tips font12 color99 error">请输入密码</span>
						</div>
						<div class="form-group">
							<label class="font14">验证码</label>
							<input class="form-control font14" id="yzcode" style="width:85px;" maxlength="50" value="" type="text">
							<input id="sends" type="button" class="send-verify font14" value="发送验证码" onclick="send()"/>
						</div>
                        <button class="sign_btn btn btn-micv5 btn-block" type="button" onclick="register()">注册</button>
                    </form>
                </div>               
            </div>            
        </div>
        <div class="sign-right fl">
            <img src="http://www.meixt.cn/images/wx.jpg" alt="关注美享厅公众号"/>
        </div>
    </div>
</div>
<div class="footNewBox2 textC color99">
    <p class="p">&copy;2016 <a href="http://www.meixt.cn">meixt.cn</a> 北京美晨科技有限公司版权属有</p>
</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/captcha.js"></script>
<script type="text/javascript" src="js/signup.js"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery-1.js" id="hz6d_flp_jquery"></script>
</body></html>
