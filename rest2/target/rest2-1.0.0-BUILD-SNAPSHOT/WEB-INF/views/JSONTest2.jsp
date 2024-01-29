<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSONTest2</title>
    <script>
        $(function() {
            $("#checkJson").click(function() {
                var article = {
                    <!-- 새로운 글 정보를 json으로 생성 -->
                    articleNo:"5",
                    writer:"tester",
                    title:"안녕하세요",
                    content:"test입니다"
                };
                $.ajax({
                    <!-- 새로운 글 등록은 post 방식으로 요청 -->
                    type:"POST",
                    <!-- 새 글을 등록하는 메소드를 호출 -->
                    url:"${contextPath}/boards",

                    type:"PUT",
                    url:"${contextPath}/boards/5",

                    contentType:"application/json",
                    <!-- 글 정보를 json 형식으로 전송 -->
                    data :JSON.stringify(article),
                    success:function (data,textStatus){
                        alert(data);
                    },
                    error:function(data, textStatus){
                        alert("에러가 발생했습니다")
                    },
                    complete:function(data, textStatus){
                    }
                });//end ajax
            });
        });
    </script>
</head>
<body>
<input type="button" id="checkJson" value="새 글작성" /><br><br>
<div id="output"></div>
</body>
</html>
