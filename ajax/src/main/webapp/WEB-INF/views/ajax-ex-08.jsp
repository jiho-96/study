<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ex08</title>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<button onclick="ex08Fn()">ex08 함수 호출</button>
</body>
<script>
    const ex08Fn = () => {
        const val1 = "Hello SpringBoot!!";

        const params = {
            "param1": val1,
            "param2": "안녕"
        };

        $.ajax({
            // 요청방식: post
            // 요청주소: /ex08
            type: "post",
            url: "/ex08",
            // parameter 전달하기
            data: JSON.stringify(params),
            contentType: "application/json",
            // 요청이 성공했을 때 실행되는 부분
            success: function(res) {
                console.log("성공", res);
                console.log(res[0]); // 객체에 0번 인덱스
                console.log(res[1].param1);
                for (let i in res) {
                    console.log("i: ", i);
                    console.log(res[i]);
                }
            },
            // 요청이 실패했을 때 실행되는 부분
            error: function() {
                console.log("실패");
            }
        })
    }

</script>
</html>