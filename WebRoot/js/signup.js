﻿/*! LPS4.0 2016-08-29
*/
function register_form_submit(e){var s=e||"mobile_register_form";"mobile_register_form"==s?($(".active .form-control").val().length>0&&$(".active .form-control").next("label").css({transform:"translateY(-18px)"}),$.ajax({type:"POST",url:"/user/register/mobile_verify/",data:{type:"mobile",mobile:$("#id_mobile_code").val(),password_m:$("#id_password_m").val(),geetest_challenge:$(".geetest_challenge").attr("value"),geetest_validate:$(".geetest_validate").attr("value"),geetest_seccode:$(".geetest_seccode").attr("value"),mobile_code:"-11111"},beforeSend:function(){$(".sign_btn").html("注册中..."),$("sign_btn").attr("disabled","disabled")},success:function(e){"success"==e.status?($.ajax({type:"POST",url:"/user/register/mobile/sendsms_signup/",data:{mobile:$("#id_mobile_code").val(),geetest_challenge:$(".geetest_challenge").attr("value"),geetest_validate:$(".geetest_validate").attr("value"),geetest_seccode:$(".geetest_seccode").attr("value")},success:function(e){e.mobile?($(".verify-tips").removeClass("success").addClass("error").html(e.mobile).show(500),$(".tab-pane.active .captcha").siblings(".v_sign_tips").addClass("error").html(e.mobile).show(500)):e.captcha?$(".verify-tips").removeClass("success").addClass("error").html(e.captcha).show(500):"failure"==e.status?$(".verify-tips").removeClass("success").addClass("error").html("短信验证码发送失败").show(500):($(".verify-tips").removeClass("error").addClass("success").html(e.info).show(500),$("#mobile_register_form").hide().siblings("#verify_form").show("fast",function(){$(".sign-tabs li").unbind("click")}),show_send_sms(60))}}),$(".user_mobile").html($("#id_mobile_code").val().substring(0,3)+"****"+$("#id_mobile_code").val().substring(8,11)),$("#verify-ok").on("click",function(){$.ajax({type:"POST",url:"/user/register/mobile/",data:{type:"mobile",mobile:$("#id_mobile_code").val(),password_m:$("#id_password_m").val(),geetest_challenge:$(".geetest_challenge").attr("value"),geetest_validate:$(".geetest_validate").attr("value"),geetest_seccode:$(".geetest_seccode").attr("value"),mobile_code:$("#Verify").val(),partner:$("#reg_partner").val(),openid:$("#reg_openid").val(),invitation_code:$("#invitation_code").val()},success:function(e){e.mobile_code?$(".verify-tips").removeClass("success").addClass("error").html(e.mobile_code).show(500):window.location="/user/sign_success/"}})})):e.mobile?$(".m_sign_tips").addClass("error").html(e.mobile).show(500):e.password_m?$(".p_sign_tips").addClass("error").html(e.password_m).show(500):e.captcha&&$(".tab-pane.active .captcha").siblings(".v_sign_tips").addClass("error").html(e.captcha).show(500)},complete:function(){$(".sign_btn").html("注册"),$(".sign_btn").removeAttr("disabled")}})):"email_register_form"==s&&$.ajax({cache:!1,type:"POST",url:"/user/register/email/",data:{type:"email",email:$("#id_email").val(),password:$("#id_password").val(),geetest_challenge:$("#email_register_form .geetest_challenge").attr("value"),geetest_validate:$("#email_register_form .geetest_validate").attr("value"),geetest_seccode:$("#email_register_form .geetest_seccode").attr("value"),partner:$("#reg_partner").val(),openid:$("#reg_openid").val(),invitation_code:$("#invitation_code").val()},beforeSend:function(){$(".sign_btn").html("注册中..."),$(".sign_btn").attr("disabled","disabled")},success:function(e){e.email?$("label[for=email]").siblings(".e_sign_tips").addClass("error").html(e.email).show(500):e.password?$("label[for=password]").siblings(".e_sign_tips").addClass("error").html(e.password).show(500):e.email_ue?$(".tab-pane.active .captcha").siblings(".v_sign_tips").addClass("error").html(e.email_ue).show(500):e.captcha?$(".tab-pane.active .captcha").siblings(".v_sign_tips").addClass("error").html(e.captcha).show(500):($("#email_register_form").hide().siblings("#email_form").show(),$(".email-tips").addClass("success"),$(".user_email").html($("#id_email").val()))},complete:function(){$(".sign_btn").html("注册"),$(".sign_btn").removeAttr("disabled")}})}var signInit=function(){$("#email_register_form").keydown(function(e){13==e.keyCode&&register_form_submit()}),$(".sign-left .form-control").focus(function(){$(this).next("label").css({transform:"translateY(-18px)"})}),$(".sign-left .form-control").blur(function(){""==$(this).val()?$(this).next("label").css({transform:"translateY(0px)"}):$(this).next("label").css({color:"#5ECFBA"})});var e=$(".sign-tabs li"),s=!0,t=!0,a=0;s&&(captcha(".tab-pane.active .captcha1","mobile/"),s=!1),e.on("click",function(){var i=e.index(this);$(this).hasClass("active")||($(this).addClass("active").siblings().removeClass("active"),captchaObjF&&$("#mobile_register_form .gt_input input").val().length>0&&(a>10&&window.location.reload(),a++,captchaObjF.refresh()),captchaObjF2&&$("#email_register_form .gt_input input").val().length>0&&(a>10&&window.location.reload(),a++,captchaObjF2.refresh())),$(".tab-pane.active .captcha").siblings(".v_sign_tips").removeClass("error").html("").show(500),$("label[for=mobile_code]").siblings(".m_sign_tips").removeClass("error success").html("").show(500),$("label[for=password_m]").siblings(".p_sign_tips").removeClass("error success").html("8-20位，区分大小写，不支持空格").show(500),$("label[for=email]").siblings(".e_sign_tips").removeClass("error success").html("").show(500),$("label[for=password]").siblings(".e_sign_tips").removeClass("error success").html("8-20位，区分大小写，不支持空格").show(500),$(".tab-content .tab-pane").eq(i).addClass("active").siblings().removeClass("active"),s&&0==i&&(captcha(".tab-pane.active .captcha1","mobile/"),s=!1),t&&1==i&&(captcha(".tab-pane.active .captcha2","email/"),t=!1),$("#verify_form").hide().siblings("#mobile_register_form").show(),$("#email_form").hide().siblings("#email_register_form").show(),""!=$(".active .form-control").val()&&$(".form-control").val("").next("label").css({transform:"translateY(0px)",color:"#999999"})}),$("#id_mobile_code").on("blur keyup",function(){var e=$(this).val(),s=$("label[for=mobile_code]"),t=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/g;null==e||""==e?s.siblings(".m_sign_tips").removeClass("success").addClass("error").html("请输入你的手机号").show(500):t.test(e)?s.siblings(".m_sign_tips").removeClass("error").addClass("success").html("").show(500):t.test(e)||s.siblings(".m_sign_tips").removeClass("success").addClass("error").html("手机号码格式不正确").show(500)}),$("#id_password_m").on("blur keyup",function(){var e=$("label[for=password_m]");null==$(this).val()||""==$(this).val()?e.siblings(".p_sign_tips").removeClass("success").addClass("error").html("请输入密码").show(500):8>$(this).val().length?e.siblings(".p_sign_tips").removeClass("success").addClass("error").html("8-20位，区分大小写，不支持空格").show(500):e.siblings(".p_sign_tips").removeClass("error").addClass("success").html("").show(500)}),$("#id_email").on("blur keyup",function(){var e=$(this).val(),s=$("label[for=email]"),t=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;null==e||""==e?s.siblings(".e_sign_tips").removeClass("success").addClass("error").html("请输入你的邮箱").show(500):t.test(e)?s.siblings(".e_sign_tips").removeClass("error").addClass("success").html("").show(500):t.test(e)?s.siblings(".e_sign_tips").removeClass("error").addClass("success").html("").show(500):s.siblings(".e_sign_tips").removeClass("success").addClass("error").html("注册账号需为邮箱格式").show(500)}),$("#id_password").on("blur keyup",function(){var e=$("label[for=password]");null==$(this).val()||""==$(this).val()?e.siblings(".e_sign_tips").removeClass("success").addClass("error").html("请输入密码").show(500):8>$(this).val().length?e.siblings(".e_sign_tips").removeClass("success").addClass("error").html("8-20位，区分大小写，不支持空格").show(500):e.siblings(".e_sign_tips").removeClass("error").addClass("success").html("").show(500)}),$(".sign-left .btn-micv5").click(function(){register_form_submit($(this).attr("typeF"))}),$("#send-verify").click(function(){send_sms_code("verify_form","verify-tips")}),$("#email_form .sendE a").unbind().click(function(){sendECount=setInterval(zy_Countdown,1e3),$(".zy_success").removeClass("upmove"),$(this).parent().hide(),$(".sendE2").show().find("span").html("60s"),$.ajax({type:"GET",url:"/user/send_again_email",data:{username:$("#id_email").val()},dataType:"html",success:function(e){zy_str="验证邮件发送成功",e&&zy_Countdown()},error:function(){zy_str="验证邮件发送失败"}})})};signInit();