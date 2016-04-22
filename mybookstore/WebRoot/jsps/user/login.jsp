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

<link rel="stylesheet" type="text/css" href="<c:url value='/css/pubs.css'/>">
	<style type="text/css">
		*{
			font-size:10pt;
		}
		table{
			border:1px solid gray;
			border-collapse:collapse;
			width:200px;
		}
		td{
			border:1px solid gray;
		}
		.txt{
			border:1px solid gray;
			width:100%;
		}
	</style>
</head>

<body style="text-align:center;margin-top:0px;padding:30%; padding-top: 10%">
	<form action="<c:url value='/userServlet?cmd=login'/>" method="post">
	<table>
		<colgroup>
			<col width="30%">
			<col width="*%">
		</colgroup>
		<tr style="background:#00ddaa">
			<td colspan="2" align="center" style="height:30px; ">
				用户登录
			</td>
		</tr>
		<tr>
			<td>
				用户名：
			</td>
			<td>
				<input class="txt" type="text" name="name" value="${user.name}"/>
			</td>
		</tr>	
		
		<tr>
			<td>
				密码：
			</td>
			<td>
				<input class="txt" type="password" name="pwd" />
			</td>
		</tr>	
		<tr>
			<td style="color:red" colspan="2" align="center">
			<c:if test="${not empty sessionScope.msg}">
				${sessionScope.msg}
				<c:remove var="msg" scope="session" />
			</c:if>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input class="OperBtn" type="submit" value="登录"/>
				&nbsp;
				<a href="<c:url value='/jsps/user/reg.jsp'/>">注册</a>
			</td>
		</tr>	
	</table>
	</form>  
</body>
</html>
