<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/pages/auth.css">    
</head>

<body>
    <div id="auth">
        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo"></div>
                    <h1 class="auth-title">로그인</h1>
                    
                    <form action="/FirstProject/Controller" method="post">
                    	<input type="hidden" name="command" value="LOGINCONFIRM" >
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="id" placeholder="${cookie.id != null ? cookie.id.value : '아이디'}" required="required">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="pw" placeholder="비밀번호" required="required">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-check form-check-lg d-flex align-items-end">
                            <input class="form-check-input me-2" type="checkbox" ${cookie.id != null ? 'checked' : ''} name="idreg" id="flexCheckDefault">
                            <label class="form-check-label text-gray-600" for="flexCheckDefault">
                                아이디 저장
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-5">로그인</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class="text-gray-600">
                        	<a href="/FirstProject/Controller" class="font-bold">회원가입</a>
                        </p>
                        <p>
                        	<a class="font-bold" href="auth-forgot-password.html">비밀번호를 잊으셨나요?</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>

    </div>
</body>

</html>