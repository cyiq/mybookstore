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
			width:240px;
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
	<form action="<c:url value='/userServlet'/>" method="post">
	<table>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		<tr style="background:#00ddaa">
			<td colspan="2" align="center" style="height:30px;">
				用户注册
			</td>
		</tr>
		<tr>
			<td>
				用户名：
			</td>
			<td>
				<input class="txt" id="name" type="text" name="name" />
			</td>
		</tr>	
		
		<tr>
			<td>
				密&nbsp;&nbsp;码：
			</td>
			<td>
				<input class="txt" type="password" name="pwd" />
			</td>
		</tr>	
		<tr>
			<td>
				重复密码：
			</td>
			<td>
				<input class="txt" type="password" name="pwd2" />
			</td>
		</tr>	
		
			<tr>
			<td>
				电话：
			</td>
			<td>
				<input class="txt" type="text" name="tel" />
			</td>
		</tr>	
		<tr>
			<td align="center" colspan="2">
				<input class="OperBtn" type="button" onclick="_reg()" value="注册" />
			</td>
		</tr>	
	</table>
	</form>  
</body>
<script type="text/javascript">
	function _reg(){
		var nm = document.getElementById("name").value;
		nm = nm.trim();
		if(nm==""){
			alert("请输入用户名");
			return false;
		}	
		var pwd1 = document.getElementsByName("pwd")[0].value;
		var pwd2 = document.getElementsByName("pwd2")[0].value;
		if(pwd1!=pwd2){
			alert("两次密码不一样");
			return false;
		}
		document.forms[0].submit();
		
	}
	String.prototype.trim=function(){
		var pattern = /^\s*/;//匹配开始的所有空格
		var str = this.replace(pattern, "");
		pattern = /\s*$/;
		str = str.replace(pattern, "");
		return str;
	}
</script>
</html>
