<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ex05</title>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<button onclick="ex05Fn()">ex05 함수 호출</button>
</body>
<script>
    const ex05Fn = () => {
        const val1 = "Hello SpringBoot!!";

        const params = {
            "param1": val1,
            "param2": "안녕"
        };

        $.ajax({
            // 요청방식: get
            // 요청주소: /ex05
            type: "get",
            url: "/ex05",
            // parameter 전달하기
            data: params,
            // 요청이 성공했을 때 실행되는 부분
            success: function(res) {
                console.log("성공", res);
            },
            // 요청이 실패했을 때 실행되는 부분
            error: function() {
                console.log("실패");
            }
        })
    }

</script>
</html>
