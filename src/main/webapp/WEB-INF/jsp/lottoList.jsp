<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>로또 최근 회차</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">최근 로또 회차</h2>
    <div class="list-group">
        <c:forEach var="res" items="${results}">
			<a href="/${res.round}" class="list-group-item list-group-item-action">
			    <strong>${res.round}회</strong> :
			    <span class="badge bg-primary me-1">${res.number1}</span>
			    <span class="badge bg-primary me-1">${res.number2}</span>
			    <span class="badge bg-primary me-1">${res.number3}</span>
			    <span class="badge bg-primary me-1">${res.number4}</span>
			    <span class="badge bg-primary me-1">${res.number5}</span>
			    <span class="badge bg-primary me-1">${res.number6}</span>
			    <span class="text-muted">(보너스: ${res.bonus})</span>
			</a>
        </c:forEach>
    </div>

    <a href="/stats" class="btn btn-outline-secondary mt-4">통계 보기</a>
</body>
</html>