<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로또 번호 통계</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">로또 번호 통계 분석</h2>

    <div class="row">
        <div class="col-md-6">
            <h4>자주 나온 번호</h4>
            <p>
                <c:forEach var="num" items="${most}"><span class="badge bg-primary me-1">${num}</span></c:forEach>
            </p>
        </div>
        <div class="col-md-6">
            <h4>덜 나온 번호</h4>
            <p>
                <c:forEach var="num" items="${least}"><span class="badge bg-secondary me-1">${num}</span></c:forEach>
            </p>
        </div>
    </div>

    <hr>

    <h4 class="mt-4">번호 추천</h4>
    <div>
        <a href="/suggest/random" class="btn btn-success me-2" target="_blank">무작위 추천</a>
        <a href="/suggest/stat" class="btn btn-info" target="_blank">통계 기반 추천</a>
    </div>

    <a href="/" class="btn btn-outline-secondary mt-4">← 목록으로</a>
</body>
</html>