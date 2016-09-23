<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>美享厅广告系统用户中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="美享厅广告用户中心">
    <meta name="description" content="美享厅广告用户中心">
    <link rel="stylesheet" type="text/css" href="css/index1.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/captcha.js"></script>
	<script type="text/javascript" src="js/signup.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery-1.js" id="hz6d_flp_jquery"></script>
	<script type="text/javascript">
		function register(){
		var phone = $("#phone").val();
		var password=$("#password").val();
		var yzcode=$("#yzcode").val();
		var sends1=$("#sends").val();
		if(sends1=="重新发送验证码"){
			$("#autos1").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />验证码失效,请重新发送");
			return;
		}
		
		if(phone==""){
			$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />不能为空");
			return;
		}
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />号码格式不正确");
				return;
		}
		if(password==""){
			$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码不能为空");
			return;
		}
		if(password.length<6){
				$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码为6-16位");
				return;
		}
		if(password.length>16){
			$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码为6-16位");
				return;
		}
		if(yzcode==""){
		$("#autos1").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />验证码不能为空");
			return;
		}
		if(yzcode.length<6){
			$("#autos1").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />验证码格式不正确");
			return;
		}
		$.ajax({
			type:"POST",
			data:{phone:$("#phone").val(),password:$("#password").val(),yzcode:yzcode},
      		url:"<%=basePath%>advertisment/register.do",
      		success:function(data){
      		if(data==""){
      			window.location="<%=basePath%>index.jsp";
      		}if(data=="验证码错误"){
      			$("#autos1").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />"+data);
      		}
      		else{
      			$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />"+data);
      		}
      	}
		})
	}
	
	var InterValObj; //timer变量，控制时间
	var count = 120; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	
	function send(){
		var phone = $("#phone").val();
		if(phone==""){
		$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />不能为空");
		return;
		}
		
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />输入错误");
				return;
		}
		curCount = count;
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
			$("#sends").css("background-color","blue");
			$("#sends").val("重新发送验证码");
		}else {
			curCount--;
			$("#sends").val("剩余" + curCount + "秒");
		}
	}
	
	function ss(){
		var phone = $("#phone").val();
		if(phone==""){
		$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />不能为空");
		return;
		}
		if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				$("#auto-id-1474190060396").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />号码不正确");
				return;
		}else{
			$("#auto-id-1474190060396").html("<img src='images/true.png' style='margin-right: 10px; vertical-align: middle;' />");
		}
	}
	
	function ss1(){
		var password = $("#password").val();
		if(password==""){
		$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码不能为空");
		return;
		}
		if(password.length<6){
				$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码为6-16位");
				return;
		}
		if(password.length>16){
			$("#autos").html("<img src='images/false.png' style='margin-right: 10px; vertical-align: middle;' />密码为6-16位");
				return;
		}
		else{
			$("#autos").html("<img src='images/true.png' style='margin-right: 10px; vertical-align: middle;' />");
		}
	}
	
	</script>
  </head>
  
  <body>
  <div id="reg_block" class="g-bd">

  <div class="top_tlt">注册帐号</div>
<div class="m-tr-block">已有帐号？去<a id="btn_Login" href="login.jsp">登录</a></div>
<!--Regular if0-->
<div class="m-opr">
    <form class="" id="bind-phone-form">
		<div class="u-input j-phone-box">
            <label class="u-label" for="inpt-phone">手机号：</label>
            <input onblur="ss()" class="i-inpt " maxlength="20" placeholder="11位手机号" id="phone" name="phone" type="text">
            <div class="u-tip f-dn" style="width:220px;">
				<div id="auto-id-1474190060396" style="width: 220px; color: red;opacity: 1;" class="spritebg u-clear">
				</div>
			</div>
            <!--Regular if12--><!--Regular if13-->
        </div>
        <div class="u-input">
            <label class="u-label" for="inpt-pw">密&nbsp;&nbsp;&nbsp; 码：</label>
            <input style="display: none;" id="p" name="password" type="password">
            <input onblur="ss1()" id="password" class="i-inpt" placeholder="6-16位密码，区分大小写" id="inpt-pw" name="password" type="password">
            <div class="u-tip f-dn" style="width:220px;">
				<div id="autos" style="width: 220px; color: red;opacity: 1;" class="spritebg u-clear">
				</div>
			</div>
        </div>
        <div class="u-input u-note">
        <label class="u-label"></label><!-- 忘记密码时，可通过手机快速找回密码 --></div>
        <div class="u-input">
            <label class="u-label" for="inpt-sms">验证码：</label>
            <input class="i-inpt smsize " maxlength="6" placeholder="输入短信验证码" id="yzcode" name="sms" type="text" style="width: 149px">
            <div class="u-tip f-dn"><div id="auto-id-1474190060398" class="spritebg u-clear"></div></div>
            <!-- <span class="b-btn btn-getsms btn-getsms-btndisabled" id="sends">获取验证码</span> -->
            <input type="button" class="b-btn btn-getsms btn-getsms-btndisabled" id="sends" onclick="send()" value="获取验证码"/>
            
            <div class="u-tip f-dn" style="width:220px;">
				<div id="autos1" style="width: 220px; color: red;opacity: 1;" class="spritebg u-clear">
				</div>
			</div>
            <!--Regular if16-->
            <!--Regular if17--><!--Regular if18-->
            <!--Regular if19-->
        </div>
        <div style="height: 58px;" class="u-input" onclick="register()">
            <label class="u-label">&nbsp;</label>
            <div style="cursor:pointer;" class="b-btn btn-reg btn-red btndisabled">注&nbsp;&nbsp;册 </div>
            <!--Regular if24-->
        </div>

        <div class="u-tips">
            <label class="u-label">&nbsp;</label>
            <span class="tip">用户注册即代表同意<a href="javascript:;" target="_blank">《服务条款》</a></span>
        </div>

    </form>
    <!--Regular if25-->
</div>

</div>
<div class="g-ft">
    <div class="g-in">
      <div class="m-cp">
        <p>©2016 www.meixt.cn </p><p>京ICP备16037877号 北京美晨科技有限公司版权属有</p>
      </div>
    </div>
  </div>
</body></html>
