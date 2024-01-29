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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;  /* 전체 배경색 지정 */
        }

        h2 {
            margin-bottom: 0;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #fff;  /* 컨테이너 배경색 지정 */
            width: 50%;
            margin: auto;
        }

        .search-container {
            text-align: right;
        }

        .nav-container {
            text-align: left;
        }

        .nav-container a {
            margin-right: 10px;
            text-decoration: none;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;  /* 테이블 배경색 지정 */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <h2>학점관리</h2>
    </div>
    <div class="search-container">
        <br/>
        찾기 : <input type="search" name="q" onkeyup="enterkey();">
    </div>
</div>

<div class="container">
    <div class="nav-container">
        <a href="/student/login">로그인</a>
        <a href="/student/save">학생등록</a>
    </div>
</div>

<div class="container">
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
        </tr>
        <c:forEach items="${studentList}" var="student">
            <tr>
                <td>
                    <a href="/student?num=${student.num}">${student.num}</a>
                </td>
                <td>${student.name}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>