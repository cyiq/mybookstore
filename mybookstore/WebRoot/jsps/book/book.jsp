<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

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
	<table style="width:100%;" border="0">
	 <tr>
	 	<td style="width:180px;">
			<img class="img" src="<c:url value='/images/${book.img}'/>"/> 
		</td>
		<td valign="bottom">
			商品名：${book.name}<br/>
			原价：${book.price}<br/>
			折率：${book.rebate}<br/>
			现价:：<fmt:formatNumber value="${book.price*book.rebate}" pattern="#.00"/><br/>
			库存：${book.stock}<br/>
			上架时间：${book.onlinetime}<br/>
			<a href="<c:url value='/secu/collectServlet?cmd=save&bookid=${book.id}'/>">收藏商品</a>
			<br/>
			<a href="<c:url value='/secu/BuyServlet?bookid=${book.id}'/>">
			<img src="<c:url value='/images/btn_buy.gif'/>"></img>
			</a></br>
		</td>
	 </tr>
	 <tr style="background:#F1E1FF;">
	 	<td	colspan="2">
	 		${book.brief}
	 	</td>
	 </tr>
	 <tr style="background:#CEFFCE;">
	 	<td	colspan="2">
	 		${book.content}
	 	</td>
	 </tr>
	</table>
</body>
</html>
