<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>美享厅广告系统登陆</title>
    <link href="css/index_002.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet">
	<style>
.flexslider {
	margin: 0px auto 20px;
	position: absolute;
	width: 100%;
	height: 400px;
	overflow: hidden;
	zoom: 1;
}

.flexslider .slides li {
	width: 100%;
	height: 100%;
}

.flex-direction-nav a {
	width: 70px;
	height: 70px;
	line-height: 99em;
	overflow: hidden;
	margin: -35px 0 0;
	display: block;
	background: url(images/ad_ctr.png) no-repeat;
	position: absolute;
	top: 50%;
	z-index: 10;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
	-webkit-transition: all .3s ease;
	border-radius: 35px;
}

.flex-direction-nav .flex-next {
	background-position: 0 -70px;
	right: 0;
}

.flex-direction-nav .flex-prev {
	left: 0;
}

.flexslider:hover .flex-next {
	opacity: 0.8;
	filter: alpha(opacity=25);
}

.flexslider:hover .flex-prev {
	opacity: 0.8;
	filter: alpha(opacity=25);
}

.flexslider:hover .flex-next:hover,
.flexslider:hover .flex-prev:hover {
	opacity: 1;
	filter: alpha(opacity=50);
}

.flex-control-nav {
	width: 100%;
	position: absolute;
	bottom: 10px;
	text-align: center;
}

.flex-control-nav li {
	margin: 0 2px;
	display: inline-block;
	zoom: 1;
	*display: inline;
}

.flex-control-paging li a {
	background: url(images/dot.png) no-repeat 0 -16px;
	display: block;
	height: 16px;
	overflow: hidden;
	text-indent: -99em;
	width: 16px;
	cursor: pointer;
}

.flex-control-paging li a.flex-active,
.flex-control-paging li.active a {
	background-position: 0 0;
}

.flexslider .slides a img {
	width: 100%;
	height: 400px;
	display: block;
}
</style>
    </head>
<body>
<div class="header">
    <div style="font-size:25px;" class="row">
		<div style="float:right;">美享厅广告系统登陆</div>
		<span style="float:left;font-size:16px;">
			<a href="http://www.meixt.cn"><img src="http://www.meixt.cn/list/images/logo3.png" alt="美享厅主站" /></a>
		</span>
    </div>
</div>
<div class="main-content">
   <div id="banner_tabs" class="flexslider">
	<ul class="slides">
		<li>
			<a title="" target="_blank" href="#">
				<img width="1920" height="482" alt="" style="background: url(images/banner1.jpg) no-repeat center;" src="images/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="#">
				<img width="1920" height="482" alt="" style="background: url(images/banner2.jpg) no-repeat center;" src="images/alpha.png">
			</a>
		</li>
		<li>
			<a title="" href="#">
				<img width="1920" height="482" alt="" style="background: url(images/banner3.jpg) no-repeat center;" src="images/alpha.png">
			</a>
		</li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
		<li><a>1</a></li>
		<li><a>2</a></li>
		<li><a>2</a></li>
	</ol>
</div>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script src="js/slider.js"></script>
<script type="text/javascript" src="js/jquery.tips.js"></script>
<script type="text/javascript">
$(function() {
	var bannerSlider = new Slider($('#banner_tabs'), {
		time: 5000,
		delay: 400,
		event: 'hover',
		auto: true,
		mode: 'fade',
		controller: $('#bannerCtrl'),
		activeControllerCls: 'active'
	});
	$('#banner_tabs .flex-prev').click(function() {
		bannerSlider.prev()
	});
	$('#banner_tabs .flex-next').click(function() {
		bannerSlider.next()
	});
})

function changeImg(){
	$("#index_code").val(""); 
    var imgSrc = $("#imgObj");
    var src = imgSrc.attr("src");    
    imgSrc.attr("src",chgUrl(src));    
}  

//时间戳    
//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳    
function chgUrl(url){    
    var timestamp = (new Date()).valueOf();    
    url = url.substring(0,37);    
    if((url.indexOf("&")>=0)){  
        url = url + "×tamp=" + timestamp;    
    }else{    
        url = url + "?timestamp=" + timestamp;    
    }    
    return url;    
}  

/* 登录验证 */
             function toh(){
                var user = $("#u").val();
                var pass = $("#ucsl-password-edit").val();
                var code = $("#index_code").val();
                if(user == ""){
                     alert("用户名不能为空");
                     return false;
                 }else if(pass == "")
					{
						alert("密码不能为空");
						return false;
					}else if(code == ""){
						alert("验证码不能为空");
						return false;					
					}else{
						$.ajax({
							type:'post',
							url:'<%=basePath%>advertisment/login.do?adUserName='+user+'&password='+pass+'&code='+code,
							success:function(msg){
								if(msg=='succeed'){
										window.location.href='<%=basePath%>index.jsp';
									}else if(msg=='succeed1'){
										window.location.href='<%=basePath%>index1.jsp';
									}else{
										alert(msg);
										changeImg();
									}
							}
						});
					}
             }
</script>
    <div class="container row">
        <div class="login-container span8 ml0">
            <div class=" uc-common-login" id="login-container">
			<div id="common-login" class="login ">
			<div class="login-shadow"></div>
			<span class="watermark"></span>
				<form></form>	
					<div class="login-info">
						<h2>账号登录</h2>
						<div class="account">
							<span></span>
							<input id="u" name="entered_login" placeholder="用户名/手机号" tabindex="1" maxlength="100" type="text">
						</div>
						<p id="account-error" class="error"></p>
						<div class="password">
						<span></span><input id="uc-common-password" name="entered_password" style="display:none;" type="hidden">
						<div style="display: block;" id="uc-safe-pwd-input" class="safe-input">
						<input value="4126EDB97BEE6120DB99811D9A370957" name="sid" id="ucsl-input-sid" type="hidden"><input name="pwd" id="ucsl-input-pwd" type="hidden">
						<input id="ucsl-password-edit" placeholder="密码" tabindex="2" style="box-sizing:border-box;width:100%;height:100%;padding-left:0; " type="password">
						</div>
						</div>
						<p id="password-error" class="error"></p>
						<div class="token">
							<input id="index_code" placeholder="验证码" tabindex="3" maxlength="4" name="entered_imagecode" type="text">
							<%-- <img id="imgObj" alt="" src="<%=basePath%>code.do" style="vertical-align:middle;"/> --%>
							<img id="imgObj" src="<%=basePath%>code.do" class="js-change-token" title="验证码" alt="验证码" src="" height="39" width="99">
							<a href="javascript:changeImg();" class="js-change-token">换一张</a>
						</div>
						<p id="token-error" class="error"></p>
					</div>
					<div class="login-action">
						<!-- <button type="button" class="btn btn-primary btn-block btn-large" onclick="toh()">登录</button> -->
						<button id="submit-form" onclick="toh()" class="submit">登录</button>
						<div class="other">
						<div class="fr">
							<a href="refusters.jsp">注册</a> | <a href="javascript:;" target="_blank">忘记密码</a>
						</div>
						</div>
					</div>
			</div>
			</div>
        </div>
    </div>
</div>
<div class="topics">
    <div class="topics-head">
        <div>
            <h2>公告</h2>
        </div>
        <a href="javascript:;" target="_blank">+更多</a>
    </div>
    <div class="underline">
        <span></span>
    </div>
             <div id="topics" class="row"> 
			 <div class="span8 fl ml0">  
				 <a href="javascript:;" target="_blank"> 
					<img src="ggxt_files/1450667937.jpg" height="120" width="280">
				 </a> 
			 <h3>推广活动页面标题</h3>
			 <p>			 推广页面活动详请页专题详细信息展示 
				<a href="javascript:;" target="_blank">查看详情&gt;</a>  
			 </p>
			 </div>  
			 <div class="span8 fl">
				 <a href="javascript:;" target="_blank"> 
					<img src="ggxt_files/1447058729.jpg" height="120" width="280">   
				 </a>    
				 <h3>新产品或者重要公告标题</h3>   
				 <p>                     新产品或重要公告详细信息简介说明
					<a href="javascript:;" target="_blank">查看详情&gt;</a>  
				 </p>  
			 </div>
             <ul class="span8 fl other-topics">  
			 <li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>广告系统2016年9月16日正式上线</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li>
			<li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>2016中秋放假及业务调整通知</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li><li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>2016国庆放假期间客服电话调整</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li><li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>关于网站受到攻击，服务器调整公告</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li><li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>广告系统2016年9月16日正式上线</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li>
			<li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>2016中秋放假及业务调整通知</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li><li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>2016国庆放假期间客服电话调整</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li><li>  
				 <a class="fl" href="javascript:;" target="_blank"> 
					<h3>关于网站受到攻击，服务器调整公告</h3>   
				 </a>  
				<a class="fr" href="javascript:;" target="_blank">                         2016-09-13                     </a>    
			 </li>
			 </ul> 
			 </div>        
</div>
<div class="footer">
   ©2016 meixt.cn 北京美晨科技有限公司版权属有
</div></body></html>
