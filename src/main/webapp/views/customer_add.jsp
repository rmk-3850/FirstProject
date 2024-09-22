<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
    
    <style>
        .div {
            padding-left: 55px;
        }
        .form, textarea, select {
            width: 80%;
            border-radius: 5px;
            border: solid rgb(228, 228, 228) 2px;
            font-family: "맑은고딕", Malgun Gothic;
            margin-top: 8px;
        }
        .form {
            height: 25px;      
        }
        textarea {
            height: 150px;
        }
        button {
            background-color: rgb(42, 105, 241);
            color: white;
            border: none;
            border-radius: 5px;
            height: 25px;
            width: 50px;
            cursor: pointer;
        }
    </style>
</head>
 <title>서비스 등록</title>
</head>
<body>
<div class="div">
    <h2>회원 등록</h2>
    <form method="post" action="cus_add_proc.jsp" accept-charset="UTF-8">
   		 <div>
            <label>회원 ID</label>
            <br><input type="text" class="form" name="b_cus_id" placeholder="아이디를 입력해 주세요.">
        </div>
        <br>
        <div>
            <label>회원 이름</label>
            <br><input type="text" class="form" name="b_cus_name" placeholder="이름을 입력해 주세요.">
        </div>
        <br>
            <label>성별</label>
            <div class="search-filter" >
            <select class="form" name="b_cus_gender">
                <option value="남자">남자</option>
                <option value="여자">여자</option>
            </select>
        </div>
        <br>
        <div>
            <label>회원 연락처</label>
            <br><input type="text" class="form" name="b_cus_ph" placeholder="연락처를 입력해 주세요.">
        </div>
        <br>
        <div>
            <label>회원 이메일</label>
            <br><input type="text" class="form" name="b_cus_mail" placeholder="이메일을 입력해 주세요.">
        </div>
        <br>
        <div>
            <label>회원 등록일</label>
            <br>
            <div class="date-filter">
                <input type="date" class="form" name="b_cus_regdate" id="regdate">
            </div>
        </div>
        <script>
            document.getElementById('regdate').valueAsDate = new Date();
        </script>
        </div>
        <br>
        <div>
            <label>회원 등급</label>
            <div class="search-filter">
            <select class="form" name="b_cus_rank">
                <option value="GOLD">GOLD</option>
                <option value="SILVER">SILVER</option>
                <option value="BRONZE">BRONZE</option>
            </select>
        </div>
        <br>
        <div>
        	<label>회원 특이사항</label>
        	<br><input type="text" class="form" name="b_cus_note" placeholder="특이사항을 입력해 주세요.">
        </div>
        <br>
        <div class="button-container">
            <button type="submit" onclick="alert('등록되었습니다.')">등록</button>
            <button type="button" onclick="location.href='customer.jsp'">목록</button>
        </div>
    </form>
</div>

</body>
</html>