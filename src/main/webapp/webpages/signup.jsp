<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            padding: 20px;
            width: 600px; /* 폭 확대 */
            box-sizing: border-box;
            border: 1px solid #000; /* 외곽선만 유지 */
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex; /* 레이블과 입력 필드를 같은 줄에 배치 */
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            flex: 0 0 150px; /* 레이블의 고정 폭 */
            margin-right: 10px;
            font-weight: bold;
        }

        .form-group input, .form-group select {
            flex: 1; /* 남은 공간을 차지하도록 설정 */
            padding: 8px;
            box-sizing: border-box;
        }

        .form-group .input-wrapper {
            display: flex;
            gap: 15px; /* 생년월일과 성별 간격 설정 */
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .checkbox-group input[type="checkbox"] {
            margin-right: 10px;
        }

        .checkbox-group a {
            margin-left: auto;
            font-size: 12px;
            text-decoration: underline;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: rgb(80,80,80);
            border: none;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-submit:disabled {
            background-color: #ccc;
        }

        .terms-detail {
            font-size: 12px;
            text-decoration: underline;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>회원가입</h1>

    <!-- 개인 회원가입 폼 -->
    <form id="personal-form">
        <div class="form-group">
            <label>이름</label>
            <input type="text" placeholder="이름 입력">
        </div>

        <div class="form-group">
            <label>생년월일/성별</label>
            <div class="input-wrapper">
                <input type="text" placeholder="생년월일 6자리" style="width: 70%;">
                <select style="width: 30%;" aria-label="성별">
                    <option value="" disabled selected>성별 선택</option>
                    <option value="male">남</option>
                    <option value="female">여</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>휴대전화</label>
            <input type="text" placeholder="010">
        </div>

        <div class="form-group">
            <label>이메일</label>
            <input type="text" placeholder="이메일 입력">
        </div>

        <div class="form-group">
            <label>아이디</label>
            <input type="text" placeholder="6~16자 / 영문 소문자 및 숫자만 입력">
        </div>

        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" placeholder="8~16자 / 문자, 숫자, 특수문자 조합">
        </div>

        <!-- 약관 동의 -->
        <div class="checkbox-group">
            <input type="checkbox"> 모든 약관에 동의합니다.
        </div>
        <div class="checkbox-group">
            <input type="checkbox"> 이용 약관에 동의합니다. [필수] <a href="#">상세보기</a>
        </div>
        <div class="checkbox-group">
            <input type="checkbox"> 개인 정보 수집 및 이용에 동의합니다. [필수] <a href="#">상세보기</a>
        </div>
        <div class="checkbox-group">
            <input type="checkbox"> 마케팅 활용 및 광고성 정보 수신에 동의합니다. [선택] <a href="#">상세보기</a>
        </div>

        <button type="submit" class="btn-submit">가입하기</button>
    </form>

</div>

</body>
</html>
