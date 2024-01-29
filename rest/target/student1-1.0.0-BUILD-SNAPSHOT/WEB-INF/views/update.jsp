<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>save</title>
    <style>
        /* 추가된 CSS 스타일 */
        body {
            position: relative;
        }

        a.home-button {
            position: absolute;
            top: 10px;
            right: 300px;
        }

        /* 반응형 디자인을 위한 미디어 쿼리 */
        @media screen and (max-width: 600px) {
            a.home-button {
                right: 10px; /* 너비가 600px 이하일 때 위치 조정 */
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<form action="/student/update" method="post" id="updateForm">
    <p>학번 : <input type="text" name="num" value="${student.num}" readonly></p>
    <p id="check-result"></p>
    <p>이름 : <input type="text" name="name" value="${student.name}" readonly></p>
    <p>국어 : <input type="text" name="korean" value="${student.korean}" autofocus></p>
    <p>영어 : <input type="text" name="english" value="${student.english}"></p>
    <p>수학 : <input type="text" name="math" value="${student.math}"></p>
    <input type="button" value="수정" onclick="Update()">
</form>

<a href="/" class="home-button">홈</a>

<script>
    const Update = () => {
        document.getElementById('updateForm').submit();
    }
</script>


</body>
</html>