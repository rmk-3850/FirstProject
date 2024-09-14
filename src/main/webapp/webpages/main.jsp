<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 캘린더 스타일 -->
    <link rel="stylesheet" href="css/cal-style.css">
    <!-- 캘린더 아이콘 스타일 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <!-- 캘린더 스크립트 -->
    <script src="js/cal-script.js" defer></script>
    <title>대시 보드</title>
    <!-- 월별 매출 현황 그래프 _ 외부 라이브러리 참조 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 90%;
            margin: 0 auto;
        }
        h1 {
            font-size: 36px;
            margin: 20px 0;
            border-bottom: 2px solid black;
        }
        .upper, .lower {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
       
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
            background-color: #f2f2f2;
        }
        /* 테이블 내용 텍스트 _ 왼쪽 정렬 */
        td {
            border: 1px solid black;
            padding: 10px;
            text-align: start;
        }
        thead td {
            border: 0px;
            text-align: center;
        }
        /* 매출현황 차트 */
        #chart {
            height: 20%;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            /* 매출 현황 차트 */
            let chart = new Chart(document.getElementById("chart"), {
                type: 'bar',
                data: {
                    // X-axis
                    labels: ['파마', '커트', '염색', '영양'],
                    // Y-axis
                    datasets: [
                    {
                        label: '매출현황',
                        data: [18, 30, 25, 12], /* x축에 해당하는 y축 값 */
                        backgroundColor: '505050', /* dataset 배경색 */
                        borderColor: 'white',      /* dataset 테두리 색상 */
                        borderWidth: 2,            /* dataset 테두리 두께 */
                        maxBarThickness: 25        /* 최대 bar의 두께 설정 */
                    }
                    ]
                }
            }); 
            
        })
    </script>
</head>
<body>

<div class="container">
    <h1>대시 보드</h1>
    <!-- 윗 컨텐츠 블럭 -->
    <div class="upper">

        <!-- 공지 사항 -->
        <div class="action-notice">
            <table>
                <thead>
                    <tr>
                        <th>공지</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><li>시스템 사용법</li></td>
                    </tr>
                    <tr>
                        <td><li>업데이트 안내</li></td>
                    </tr>
                    <tr>
                        <td><li>사용법</li></td>
                    </tr>
                    <tr>
                        <td><li>공지 - 오류해결</li></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 매출 현황 차트 _ 데이터 입력 및 스타일 설정 방법 숙지 요망 -->
        <div class="chart">
            <canvas id="chart"></canvas>
        </div>
    </div>

    <!-- 아래 컨텐츠 블럭 -->
    <div class="lower">
        <!-- 재고 수량 테이블 -->
        <div class="stock">
            <table>
                <thead>
                    <tr>
                        <th>재고 수량</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><li>상품명 : 수량</li></td>
                    </tr>
                    <tr>
                        <td><li>샴푸 : 2개</li></td>
                    </tr>
                    <tr>
                        <td><li>파마약 : 3개</li></td>
                    </tr>
                    <tr>
                        <td><li>영양제 : 1개</li></td>
                    </tr>
                    <tr>
                        <td><li>염색(검정) : 3개</li></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 캘린더 _ 외부 라이브러리 참조 _ 크기 조정 필요 -->
        <div class="calendar-wrapper">
            <!-- 캘린더 헤더 -->
            <header>
              <!-- 이번 달, 연도 -->  
              <p class="current-date"></p>
              <!-- 월별 이동 아이콘 -->
              <div class="icons">
                <span id="prev" class="material-symbols-rounded">chevron_left</span>
                <span id="next" class="material-symbols-rounded">chevron_right</span>
              </div>
            </header>
            <!-- 캘린더 바디 -->
            <div class="calendar">
              <ul class="weeks">
                <li>Sun</li>
                <li>Mon</li>
                <li>Tue</li>
                <li>Wed</li>
                <li>Thu</li>
                <li>Fri</li>
                <li>Sat</li>
              </ul>
              <ul class="days"></ul>
            </div>
        </div>

        <!-- 메모 : 캘린더 일정 세부 사항 -->
        <div class="memo">
            <table>
                <thead>
                    <tr>
                        <th>9월 12일 예약 현황</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><li>시간 - 서비스명 - 고객명</li></td>
                    </tr>
                    <tr>
                        <td><li>10시 - 파마 - 이건희</li></td>
                    </tr>
                    <tr>
                        <td><li>11시 - 염색 - 정소율</li></td>
                    </tr>
                    <tr>
                        <td><li>13시 - 커트 - 김로민</li></td>
                    </tr>
                    <tr>
                        <td><li>14시 - 커트 - 염정섭</li></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div><!-- .container end -->
</body>
</html>