<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</HEAD>

<body>
	<!--  -->
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/admin?method=addProduct"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" colSpan="4" height="26"><strong><STRONG>
							${message} </STRONG> </strong></td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pname" id="userAction_save_do_logonName" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品编号：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pid" id="userAction_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					市场价格：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="market_price" id="userAction_save_do_logonName" class="bg" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商城价格：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="shop_price" id="userAction_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><input
					type="file" name="pimage" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					所属分类：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><select
					name="cid">
						<option value="1">文学</option>
						<option value="2">计算机</option>
						<option value="3">经管</option>
						<option value="4">励志</option>
						<option value="5">社科</option>
						<option value="6">学术</option>
						<option value="7">少儿</option>
						<option value="8">艺术</option>
						<option value="9">原版</option>
						<option value="10">科技</option>
						<option value="11">考试</option>
						<option value="12">生活百科</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					商品描述：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3"><textarea
						name="pdesc" rows="10" cols="100"></textarea></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="userAction_save_do_submit" value="确定"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<!-- 
					<script>
						function jump() {
							window.location.href = "${pageContext.request.contextPath}/admin/product/list.jsp";
						}
					</script> <INPUT class="button_ok" type="button" onclick="jump()" value="返回" />
					 -->
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>