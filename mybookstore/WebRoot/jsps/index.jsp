<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		table{
			border:1px solid gray;
			border-collapse:collapse;
			width:1024px;
			height:120%;
		}
		td{
			border:1px solid gray;
		}
	</style>
</head>

<body style="text-align:center;margin-top:0px">
	<table>
		<tr style="background:#ffddaa">
			<td colspan="2" height="80" style="padding-right:10px">
				<font style="font-size: 30px;">镐京学院二手商品交易网</font>
				<div style="float:right">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
					<a target="dataFrame" href="<c:url value='/jsps/user/login.jsp'/>">登录</a>
					|
					<a target="dataFrame" href="<c:url value='/jsps/user/reg.jsp'/>">注册</a>	
					</c:when>
					<c:otherwise>
						欢迎你:<a href="">${user.name}</a>
						|
						<a target="dataFrame" href="<c:url value='/secu/OrderServlet?cmd=list'/>">我的订单</a>
						|
						<a target="dataFrame" href="<c:url value='/secu/collectServlet?cmd=list'/>">收藏夹</a>
						|
						<a target="dataFrame" href="<c:url value='/jsps/buy/car.jsp'/>">购物车</a>
						|
						<c:if test="${user.name == 'admin'}">
							<a target="dataFrame" href="<c:url value="/bookAdd?cmd=add"/>">添加商品</a>		
						|
						</c:if>
						<a href="<c:url value='/indexServlet?cmd=exit'/>">退出</a>
					</c:otherwise>
				</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td align ="center" valign="top" style="width:120px;">
			<a target="dataFrame" href="<c:url value='/bookServlet'/>">全部</a><br/>
			<c:forEach items="${types}" var="t">
				<a target="dataFrame" href="<c:url value='/bookServlet?typeid=${t.id}'/>">${t.name}</a><br/>
			</c:forEach>
			</td>
			<td>
				<c:url value="/bookServlet" var="url"></c:url>
				<!-- 是否在session中存在bookid -->
				<c:if test="${not empty sessionScope.bookid}">
					<c:url value="/bookServlet?cmd=detail&bookid=${bookid}" var="url"/>
					<c:remove var="bookid" scope="session"/>
				</c:if>
				<iframe name="dataFrame" src='${url}' frameborder="0" width="100%" height="100%"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>
