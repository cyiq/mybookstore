<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		*{
			font-size:10pt;
		}
		.img{
			border:0px solid gray;
			width:150px;
			height:200px;
		}
	</style>
</head>

<body style="margin-top:0px;">
	<form action="<c:url value='/bookAdd'/>" method="post" enctype="multipart/form-data">
	<table style="width:100%;" border="0">
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			商品名
		</td>
		<td valign="bottom">
			<input type="text" name="name">
		</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			价格
		</td>
		<td valign="bottom">
			<input type="text" name="price">
		</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			商品图片
		</td>
		<td valign="bottom">
			<input type="file" name="img">
		</td>
	 </tr>
	  <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			折率
		</td>
		<td valign="bottom">
			<input type="text" name="rebate">
		</td>
	 </tr>
	   <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			库存
		</td>
		<td valign="bottom">
			<input type="text" name="stock">
		</td>
	 </tr>
	   <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			商品简述
		</td>
		<td valign="bottom">
			<input type="text" name="brief">
		</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			商品详情
		</td>
		<td valign="bottom">
			<textarea rows="4" cols="25" name="content"></textarea>
		</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			选择分类
		</td>
		<td valign="bottom">
		<select name="type">
			<c:forEach items="${types}" var="t">
				<option value="${t.id}">${t.name}</option>		
			</c:forEach>
		</select>
		</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td style="width:180px;">
			<input type="submit" />
		</td>
		<td valign="bottom">
			<input type="reset" />
		</td>
	 </tr>
	</table>
	</form>
</body>
</html>
