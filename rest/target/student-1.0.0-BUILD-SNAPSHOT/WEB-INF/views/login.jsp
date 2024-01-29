<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<form action="/student/login" method="post">
    ID : <input type="text" name="ID" placeholder="아이디"> <br/>
    PW : <input type="password" name="PW" placeholder="비밀번호">
    <input type="submit" value="로그인">
</form>
</body>
</html>