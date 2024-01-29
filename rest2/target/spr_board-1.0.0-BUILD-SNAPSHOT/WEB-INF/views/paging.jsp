<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Paging</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            color: #216a94;
        }

        .pagination {
            margin: 20px auto;
            text-align: center;
        }

        .pagination a {
            color: #3498db;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            cursor: pointer;
        }

        .pagination span {
            color: #3498db;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Date</th>
            <th>Hits</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/board?id=${board.id}&page=${paging.page}">${board.boardTitle}</a>
                </td>
                <td>${board.boardWriter}</td>
                <td>${board.boardCreatedTime}</td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="text-align: right; margin-right: 200px;">
    <a href="${pageContext.request.contextPath}/board/save">
        <button>글쓰기</button>
    </a>
</div>

<div class="pagination">
    <c:choose>
        <c:when test="${paging.page<=1}">
            <span>[이전]</span>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/board/paging?page=${paging.page-1}">[이전]</a>
        </c:otherwise>
    </c:choose>

    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
        <c:choose>
            <c:when test="${i eq paging.page}">
                <span>${i}</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/board/paging?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${paging.page>=paging.maxPage}">
            <span>[다음]</span>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/board/paging?page=${paging.page+1}">[다음]</a>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>