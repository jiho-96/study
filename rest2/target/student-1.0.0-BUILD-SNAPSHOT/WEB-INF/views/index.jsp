<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script>
    function enterkey() {
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때 실행하는 반응
            $("#form").submit();
        }
    }
</script>

<head>
    <title>index</title>
</head>
<body topmargin="0" leftmargin="0">
<div style="float:left;width:50%;height:50%;">
    <h2>학점관리</h2>
</div>

<div style="clear:right;float:right;width:50%;height:50%;">
    <br/>
        찾기 : <input type="search" name="q" onkeyup="enterkey();">
</div>

<div style="float:left;width:50%;height:50%;">
    <a href="/student/login">로그인</a> <br/>
    <a href="/student/save">학생등록</a><br/>
</div>

<div>
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
        </tr>
        <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.num}</td>
            <td>${student.name}</td>
        </tr>
        </c:forEach>
</div>

</body>
</html>


