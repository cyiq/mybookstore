<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/pubs.css'/>">
<style type="text/css">
* {
	font-size: 10pt;
}

table {
	border-collapse: collapse;
	width: 100%;
}


.txt {
	border: 1px solid gray;
	width: 100%;
}
</style>
</head>

<body style="margin-top:0px">
	<table>
		<tr style="background:#AAddaa">
			<td colspan="4">我的收藏夹</td>
		</tr>
		<tr style="background:#ffddaa;">
			<td>商品名称</td>
			<td>价格</td>
			<td>删除收藏</td>
		</tr>
		<c:set value="0" var="sums"></c:set>
		<c:forEach items="${collectList}" var="collect">
			<c:forEach items="${bookList}" var="book">
				<c:choose>
					<c:when test="${book.id == collect.bookid}">
					<tr>
						<td>
						<a href="<c:url value="/bookServlet?cmd=detail&bookid=${book.id}" />">${book.name}</a> 
						</td>
						<td>
						${book.price}
						</td>
						<td>
						<a href="<c:url value='/secu/collectServlet?cmd=delete&collectid=${collect.collectid}'/>">删除收藏</a> 
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
	function _chk(obj){
		if(obj.checked==true){
			document.getElementById("addr").value=obj.value; 
		}
		
	}
	function _create(){
		document.forms['x'].submit();
	}

</script>
</html>
