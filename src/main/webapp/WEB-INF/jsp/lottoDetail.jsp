<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${result.round}회 상세 결과</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">${result.round}회 로또 상세 결과</h2>

    <div class="mb-3">
        <p>당첨 번호:</p>
        <span class="badge bg-success me-1">${result.number1}</span>
        <span class="badge bg-success me-1">${result.number2}</span>
        <span class="badge bg-success me-1">${result.number3}</span>
        <span class="badge bg-success me-1">${result.number4}</span>
        <span class="badge bg-success me-1">${result.number5}</span>
        <span class="badge bg-success me-1">${result.number6}</span>
    </div>

    <div class="mb-3">
        <p>보너스 번호:</p>
        <span class="badge bg-warning text-dark">${result.bonus}</span>
    </div>

    <a href="/" class="btn btn-outline-primary">← 목록으로 돌아가기</a>
</body>
</html>