<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>save</title>
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
<form action="/student/save" method="post" id="studentForm">
    <p>학번 : <input type="text" name="num" placeholder="학번" id="num" onblur="numCheck()"></p>
    <p id="check-result"></p>
    <p>이름 : <input type="text" name="name" placeholder="이름"></p>
    <p>국어 : <input type="text" name="korean" placeholder="점수"></p>
    <p>영어 : <input type="text" name="english" placeholder="점수"></p>
    <p>수학 : <input type="text" name="math" placeholder="점수"></p>
    <input type="submit" value="입력">
    <input type="button" value="초기화" onclick="resetForm()">
</form>

<!-- 홈 버튼 추가 -->
<a href="/" class="home-button">홈</a>
</body>

<script>
    function resetForm() {
        // 폼 요소를 가져와서 초기화
        var form = document.getElementById("studentForm");
        form.reset();
    }

    const numCheck = () => {
        const email = document.getElementById("num").value;
        const checkResult = document.getElementById("check-result");
        console.log("입력한 학번", num);
        $.ajax({
            type: "post",
            url: "/member/num-check",
            data: {
                "num": num
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res == "ok") {
                    console.log("등록가능한 학번");
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "등록가능한 학번";
                } else {
                    console.log("이미 사용중인 학번");
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "이미 사용중인 학번";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>
</html>