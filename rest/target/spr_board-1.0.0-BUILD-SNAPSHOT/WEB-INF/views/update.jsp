<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>게시물 수정</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f8f8;
      margin: 0;
      padding: 0;
      text-align: center;
    }

    form {
      width: 60%;
      margin: 20px auto;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 10px;
    }

    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin: 5px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      border-radius: 5px;
    }

    input[type="button"] {
      background-color: #3498db;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="button"]:hover {
      background-color: #2072b7;
    }
  </style>
</head>
<body>
<form action="/board/update" method="post" name="updateForm">
  <input type="hidden" name="id" value="${board.id}" readonly><br><br>
  <input type="text" name="boardWriter" value="${board.boardWriter}" readonly><br><br>
  <input type="text" name="boardPass" id="boardPass" placeholder="비밀번호"><br><br>
  <input type="text" name="boardTitle" value="${board.boardTitle}"><br><br>
  <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea><br><br>
  <input type="button" value="수정" onclick="updateReqFn()">
</form>
</body>
<script>
  const updateReqFn = () => {
    const passInput = document.getElementById("boardPass").value;
    const passDB = '${board.boardPass}';
    if (passInput === passDB) {
      document.updateForm.submit();
    } else {
      alert("비밀번호가 일치하지 않습니다!!");
    }
  }
</script>
</html>