<%@ page contentType="text/html;charset=utf-8" isErrorPage="false" %> <%--true로하면 500번 대, false로 해야 500번으로 바뀌지 않음--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>error400.jsp</title>
</head>
<body>
<h1>예외가 발생했습니다.</h1>
<%--발생한 예외 : ${ex}<br>--%>
<%--예외 메시지 : ${ex.message}<br>--%>
<%--isErrorPage="true" 사용시 exception기본객체 사용--%>
발생한 예외 : ${pageContext.exception}<br>
예외 메시지 : ${pageContext.exception.message}<br>

<ol>
<%--    <c:forEach items="${ex.stackTrace}" var="i">--%>
    <c:forEach items="${pageContext.exception.stackTrace}" var="i">
        <li>${i.toString()}</li>
    </c:forEach>
</ol>
</body>
</html>