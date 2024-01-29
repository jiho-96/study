<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-top: 50px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h2>Hello, Spring Framework!</h2>
<a href="${pageContext.request.contextPath}/board/save">글 작성</a>
<a href="${pageContext.request.contextPath}/board/">글 목록</a>
<a href="${pageContext.request.contextPath}/board/paging">페이징 목록</a>
</body>
</html>