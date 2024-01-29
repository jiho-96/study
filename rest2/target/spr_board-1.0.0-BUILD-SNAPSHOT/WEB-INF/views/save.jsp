<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"],
        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/board/save" method="post">
    <table border="1">
        <tr>
            <td>작성자</td> <td><input type="text" name="boardWriter" placeholder="작성자" autofocus></td>
        </tr>
        <tr>
            <td>비밀번호</td> <td><input type="text" name="boardPass" placeholder="비밀번호"></td>
        </tr>
        <tr>
            <td>제목</td> <td><input type="text" name="boardTitle" placeholder="제목"></td>
        </tr>
        <tr>
            <td>내용</td> <td><textarea name="boardContents" cols="22" rows="10" placeholder="내용을 입력하세요"></textarea></td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <input type="submit" value="작성">
                <button type="button" onclick="history.back()">뒤로가기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>