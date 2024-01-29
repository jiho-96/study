<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>detail</title>
    <style>
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
<table>
    <tr>
        <th>학번 : </th>
        <td>${student.num}</td>
    </tr>
    <tr>
        <th>이름 : </th>
        <td>${student.name}</td>
    </tr>
    <tr>
        <th>국어 : </th>
        <td>${student.korean}</td>
    </tr>
    <tr>
        <th>영어 : </th>
        <td>${student.english}</td>
    </tr>
    <tr>
        <th>수학 : </th>
        <td>${student.math}</td>
    </tr>
    <tr>
        <th>총점 : </th>
        <td>${student.korean + student.english + student.math}</td>
    </tr>
    <tr>
        <th>평균 : </th>
        <td>${(student.korean + student.english + student.math) / 3.0}</td>
    </tr>
    <tr>
        <th>등수 : </th>
        <td></td>
    </tr>
    <td>
        <button onclick="updateStudent('${student.num}')">수정</button>
    </td>
    <td>
        <button onclick="deleteStudent('${student.num}')">삭제</button>
    </td>
</table>

</body>
<script>
    const deleteStudent = (num) => {
        console.log(num);
        alert("정말 삭제하시겠습니까?")
        location.href = "/student/delete?num="+num;
    }
    const updateStudent = (num) => {
        console.log(num);
        location.href = "/student/update?num="+num;
    }
</script>

<!-- 홈 버튼 추가 -->
<a href="/" class="home-button">홈</a>
</body>

</html>