<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>게시물 상세보기</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        table {
            width: 60%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
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

        button {
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        input {
            padding: 10px;
            margin: 5px;
        }

        #comment-list {
            width: 60%;
            margin: 20px auto;
        }

        #comment-list table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #comment-list th, #comment-list td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        #comment-list th {
            background-color: #3498db;
            color: #fff;
        }

        #comment-list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #comment-list tr:hover {
            background-color: #ddd;
        }

    </style>
</head>
<body>
<table border="1">
    <tr>
        <th>ID</th>
        <td>${board.id}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${board.boardWriter}</td>
    </tr>
    <tr>
        <th>작성일</th>
        <td>${board.boardCreatedTime}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${board.boardContents}</td>
    </tr>
</table>
<div>
    <button onclick="listFn()">목록</button>
    <button onclick="updateFn()">수정</button>
    <button onclick="deleteFn()">삭제</button>
</div>
<div>
    <input type="text" id="commentWriter" placeholder="작성자">
    <input type="text" id="commentContents" placeholder="내용">
    <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>
</div>
<div id="comment-list">
    <table>
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.commentCreatedTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const listFn = () => {
        const page = ${page};
        location.href = "/board/paging?page=" + page;
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const deleteFn = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }
    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function(commentList) {
                console.log("작성 성공");
                console.log(commentList);
                let output = "<table>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in commentList) {
                    output += "<tr>";
                    output += "<td>" + commentList[i].id + "</td>";
                    output += "<td>" + commentList[i].commentWriter + "</td>";
                    output += "<td>" + commentList[i].commentContents + "</td>";
                    output += "<td>" + commentList[i].commentCreatedTime + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value = '';
                document.getElementById('commentContents').value = '';
            },
            error: function() {
                console.log("작성 실패");
            }
        });
    }
</script>
</html>