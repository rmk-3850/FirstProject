<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    table {
        margin: auto;
        font-size: 15px;
        text-align: center;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
    }

    input[type="text"], input[type="password"] {
        width: 400px;
        height: 32px;
        font-size: 15px;
        border: 0;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
        margin-bottom: 10px;
    }

    .btn {
        width: 263px;
        height: 32px;
        font-size: 15px;
        border: 0;
        outline: none;
        background-color: rgb(80,80,80);
        color: white;
        cursor: pointer;
        margin-top: 10px;
    }

    .btn:active {
        background-color: rgb(61, 135, 255);
    }

    .actions {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
        gap: 0px;
    }

    .actions td {
        font-size: 14px;
        cursor: pointer;
    }

    .actions td:hover {
        text-decoration: underline;
    }

    .join {
        text-align: center;
        margin-top: 10px;
        cursor: pointer;
    }

    .join:hover {
        text-decoration: underline;
    }

</style>
<script>
    function goToPage(url) {
        window.location.href = url;
    }
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
	%>
    <table>
        <tr>
            <td><h2>로그인</h2></td>
        </tr>
        <tr>
            <td><input type="text" placeholder="아이디"></td>
        </tr>
        <tr>
            <td><input type="password" placeholder="비밀번호"></td>
        </tr>
        <tr>
            <td>
                <div class="actions">
                    <span><input type="checkbox"> 아이디 저장</span>
                    <span onclick="goToPage('find_account.html')">계정 찾기</span>
                </div>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="로그인" class="btn"
                onclick="alert('로그인 성공!')"></td>
        </tr>
        <tr>
            <td class="join" onclick="goToPage('join.html')">회원가입</td>
        </tr>
    </table>
</body>
</html>