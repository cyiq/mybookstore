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
		div{
			border:1px solid gray;
			width:150px;
			height:240px;
			text-align:center;
			float:left;
			margin:3px;
		}
		img{
			border:0px solid gray;
			width:150px;
			height:200px;
		}
	</style>
</head>

<body style="margin-top:0px;">
	以下是所有的商品<br/>
	<c:forEach items="${list}" var="book">
		<div>
			<a href="<c:url value='/bookServlet?cmd=detail&bookid=${book.id}'/>">
			<img src="<c:url value='images/${book.img}'/>"/>
			</a>
			<br/>
			${book.name}
			<br/>
			<c:choose>
				<c:when test="${book.rebate==1}">
				${book.price}
				</c:when>
				<c:otherwise>
					<font style="text-decoration: line-through;">
				<font size="18" color="blue">原价：${book.price}</font>												
					</font>
				&nbsp;
				<font size="18" color="red"><fmt:formatNumber value="${book.price*book.rebate}" pattern="#.00"></fmt:formatNumber></font>
				</c:otherwise>
			</c:choose>
		</div>		
	</c:forEach>
</body>
</html>
