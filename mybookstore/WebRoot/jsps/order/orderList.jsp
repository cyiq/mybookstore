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
			<td colspan="4">以下是您的所有的订单</td>
		</tr>
		<tr style="background:#ffddaa;">
			<td>订单号</td>
			<td>订单总额</td>
			<td>状态</td>
			<td>订单时间</td>
		</tr>
		<c:set value="0" var="sums"></c:set>
		<c:forEach items="${orderList}" var="order">
			
			<tr>
				<td><font color="blue" style="font-size: 20;">${order.id}</font></td>
				<td><font color="blue" style="font-size: 20;"><fmt:formatNumber
						value="${order.money}" pattern="#.00" /></font>
				</td>
				<td>
				<c:choose>
					<c:when test="${order.stat == '0'}">
						<font color="blue" style="font-size: 20;">已付款</font>
					</c:when>
					<c:otherwise>
						<font size="5" color="blue" >待取货</font>
					</c:otherwise>
				</c:choose>
				</td>
				<td>
					${order.ctime}
				</td>
			</tr>
			<tr>
				<td align="right">
					<font color="green">订单明细</font>
				</td>
				<td >
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
			<c:forEach items="${orderLineList}" var="orderLine">
				<c:choose>
					<c:when test="${order.id == orderLine.orderid}">
					<tr align="left">
						<c:forEach items="${bookList}" var="book">
							<c:choose>
								<c:when test="${book.id == orderLine.bookid}">
								<td>&nbsp;</td>
								<td> 
								  	商品名：<a href="<c:url value="/bookServlet?cmd=detail&bookid=${book.id}" />">${book.name}</a> 
								</td>
								<td>
								   	货物数量 ：${orderLine.cont}  
								</td>
								<td>
								   	货物单价：${orderLine.price} <br/>
								</td>
								</c:when>
								<c:otherwise>
								</c:otherwise>	 
							</c:choose>
						</c:forEach>
					</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<tr>
				<td colspan="4"><hr/></td>
			</tr>
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
