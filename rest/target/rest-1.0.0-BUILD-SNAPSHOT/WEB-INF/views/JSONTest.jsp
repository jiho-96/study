<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSONTest</title>
    <script>
        $(function() {
            $("#checkJson").click(function() {
                // 회원 정보를 json으로 생성
                var member = {
                    id:"RestJSP",
                    name:"레스트",
                    pwd:"123123",
                    email:"RestJSP@test.com" };
                $.ajax({
                    type:"post",
                    // /test/info 로 요청하기
                    url:"${contextPath}/test/info",
                    contentType: "application/json", // 클라이언트가 서버에게 전송하는 데이터 형식을 명시적으로 지정하는데 도움, 클라이언트가 서버로 보내는 데어탁 JSON 형식임을 나타냄
                    data :JSON.stringify(member),  // 회원정보를 json 문자열로 변환
                    success:function (data,textStatus){
                    },
                    error:function(data,textStatus){
                        alert("에러가 발생했습니다.");
                    },
                    complete:function(data,textStatus){
                    }
                });//end ajax
            });
        });
    </script>
</head>
<body>
<input type="button" id="checkJson" value="회원 정보 보내기" /> <br><br>
<div id="output"></div>
</body>
</html>
