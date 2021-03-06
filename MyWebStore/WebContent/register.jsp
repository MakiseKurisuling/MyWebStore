<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入表单检验插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- 刷新验证码 -->
<script type="text/javascript">
	$(function(){
		$("#checkImg").click(function(){
			$("#checkImg").attr("src","${pageContext.request.contextPath}/checkImg?timeStamp="+new Date().getTime());
		});
	});
</script>


<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}

.error {
	color: red;
}
</style>

<script type="text/javascript">
$.validator.addMethod(
"checkEmail",
function(value,element,params){
	var flag = false;
	$.ajax({
		"async":false,
		"url":"${pageContext.request.contextPath}/user?method=checkEmail",
		"data":{"email":value},
		"type":"POST",
		"dataType":"json",
		"success":function(data){
			flag = data.isExit;
		}
	});
	//返回false代表该校验器不通过
	return !flag;
}
);
	//自定义校验规则
	$.validator.addMethod(
		//规则的名称
		"checkUsername",
		//校验的函数
		function(value,element,params){
			
			//定义一个标志
			var flag = false;
			//value:输入的内容
			//element:被校验的元素对象
			//params：规则对应的参数值
			//目的：对输入的username进行ajax校验
			$.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/user?method=checkUsername",
				"data":{"username":value},
				"type":"POST",
				"dataType":"json",
				"success":function(data){
					flag = data.isExit;
				}
			});
			//返回false代表该校验器不通过
			return !flag;
		}
	);
	$(function(){
		$("#registerForm").validate({
			rules:{
				"username":{
					"required":true,
					"checkUsername":true,
					"rangelength":[1,15]
				},
				"password":{
					"required":true,
					"rangelength":[6,20]
				},
				"repassword":{
					"equalTo":"#password"
				},
				"email":{
					"required":true,
					"checkEmail":true,
					"email":true
				},
				"name":{
					"required":true
				}
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"checkUsername":"用户名已存在",
					"rangelength":"用户名长度为1到15位"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"密码长度为6到12位"
				},
				"repassword":{
					"equalTo":"两次密码不一致"
				},
				"email":{
					"required":"邮箱不能为空",
					"email":"邮箱格式错误",
					"checkEmail":"email已被注册"
				},
				"name":{
					"required":"姓名不能为空"
				}
			}
		});
	});
</script>

</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form id="registerForm" class="form-horizontal"
					style="margin-top: 5px;"
					action="${pageContext.request.contextPath }/user?method=register"
					method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd"
								name="repassword" placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3"
								name="email" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="usercaption"
								name="name" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="checkCode">

						</div>
						<div class="col-sm-2">
							<img src="${pageContext.request.contextPath }/checkImg"
								id="checkImg" />&nbsp;&nbsp; <span id="checkImg_info"
								style="color: red">${register_info }</span>
						</div>

					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit"
								style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>
</body>
</html>




