<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>持名法州后台管理中心</title>

	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"></link>
	<script type="text/javascript" src="script/jquery.js"></script>
	<script type="text/javascript" src="script/common.js"></script>
	<script type="text/javascript">

        //更换验证码
        $(function () {
            //点击更换验证码：
            $("#captchaImage").click(function () {
                //点击更换验证码
                $("#captchaImage").prop("src", "${pageContext.request.contextPath}/image/image.do?" + (new Date()).getTime())
            });


            //验证码页面判断
            $(function () {
                $("#enCode").blur(function () {
                    var imagecode = $(this).val();

                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/image/code.do",
                        data: "code=" + imagecode,
                        dataType: "text",
                        success: function (data) {
                            if (data == 1) {
                                $("#s").text("√")
                            } else {
                                $("#s").text("验证码有误");
                            }

                        }

                    });
                });
            });


            //form 表单提交
            $("#loginForm").bind("submit", function () {
                var test = $(".text").val();
                var s = $("#s").val();
                if (test != null && s == "√") {

                    return true;
                } else {
                    alert("用户名或密码不能为空");
                    return false;
                }

            });
        });

	</script>
</head>
<body>

<div class="login">
	<form id="loginForm" action="${pageContext.request.contextPath}/admin/login.do" method="post">
		<table>
			<thead>
			<p align="center">${requestScope.error}</p>
			</thead>
			<tbody>
			<tr>
				<td width="190" rowspan="2" align="center" valign="bottom">
					<img src="${pageContext.request.contextPath}/img/header_logo.gif"/>
				</td>
				<th>
					用户名:
				</th>
				<td>
					<input type="text" name="name" class="text" value="请输入用户名" maxlength="20"/>
				</td>
			</tr>
			<tr>
				<th>
					密&nbsp;&nbsp;&nbsp;码:
				</th>
				<td>
					<input type="password" name="password" class="text" maxlength="20"
						   autocomplete="off"/>
				</td>


			</tr>

			<tr>
				<td>&nbsp;</td>
				<th>验证码:</th>
				<td>
					<input type="text" id="enCode" name="enCode" class="text captcha" maxlength="4" autocomplete="on"/>
					<img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/image/image.do"
						 title="点击更换验证码"/><span id="s"></span>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<th>
					&nbsp;
				</th>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<th>&nbsp;</th>
				<td>
					<input type="button" class="homeButton" value="" onclick="location.href='/'"><input type="submit"
																										class="loginButton"
																										value="登录">
				</td>
			</tr>
			</tbody>
		</table>
		<div class="powered">COPYRIGHT © 2008-2017.</div>
		<div class="link">
			<a href="http://www.chimingfowang.com/">持名佛网首页</a> |
			<a href="http://www.chimingbbs.com/">交流论坛</a> |
			<a href="">关于我们</a> |
			<a href="">联系我们</a> |
			<a href="">授权查询</a>
		</div>
	</form>
</div>
</body>
</html>