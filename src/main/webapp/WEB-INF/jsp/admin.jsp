<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container py-4">
    <h2 class="mb-4">로또 회차 등록 / 수정 / 삭제</h2>

    <!-- 회차 등록 폼 -->
    <form id="registerForm" class="mb-5">
        <div class="row g-2">
            <div class="col-md-2">
                <input type="number" class="form-control" name="round" placeholder="회차" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num1" placeholder="번호1" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num2" placeholder="번호2" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num3" placeholder="번호3" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num4" placeholder="번호4" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num5" placeholder="번호5" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="num6" placeholder="번호6" min="1" max="45" required />
            </div>
            <div class="col">
                <input type="number" class="form-control" name="bonus" placeholder="보너스" min="1" max="45" required />
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">등록</button>
            </div>
        </div>
    </form>

    <!-- 삭제 및 수정 -->
    <div class="input-group mb-3">
        <input type="number" id="modifyRound" class="form-control" placeholder="수정 또는 삭제할 회차 입력">
        <button onclick="updateRound()" class="btn btn-warning">수정</button>
        <button onclick="deleteRound()" class="btn btn-danger">삭제</button>
    </div>

    <a href="/" class="btn btn-outline-secondary">← 돌아가기</a>

	<script>
	    document.getElementById('registerForm').addEventListener('submit', function(e) {
	        e.preventDefault();
	        const form = e.target;
	        const data = {
	            round: parseInt(form.round.value),
	            number1: parseInt(form.num1.value),
	            number2: parseInt(form.num2.value),
	            number3: parseInt(form.num3.value),
	            number4: parseInt(form.num4.value),
	            number5: parseInt(form.num5.value),
	            number6: parseInt(form.num6.value),
	            bonus: parseInt(form.bonus.value)
	        };
	
	        fetch('/admin/add', {
	            method: 'POST',
	            headers: {'Content-Type': 'application/json'},
	            body: JSON.stringify(data)
	        }).then(res => res.text()).then(alert);
	    });
	
	    function updateRound() {
	        const round = document.getElementById('modifyRound').value;
	        const updatedData = prompt("수정할 번호 (쉼표로 구분, 보너스 포함):\n예) 1,2,3,4,5,6,7");
	        if (!updatedData) return;
	
	        const arr = updatedData.split(',').map(Number);
	        const body = {
	            round: parseInt(round),
	            number1: arr[0],
	            number2: arr[1],
	            number3: arr[2],
	            number4: arr[3],
	            number5: arr[4],
	            number6: arr[5],
	            bonus: arr[6]
	        };
	
	        fetch('/admin/update', {
	            method: 'PUT',
	            headers: {'Content-Type': 'application/json'},
	            body: JSON.stringify(body)
	        }).then(res => res.text()).then(alert);
	    }
	
	    function deleteRound() {
	        const round = document.getElementById('modifyRound').value;
	        if (confirm(`${round}회차를 정말 삭제하시겠습니까?`)) {
	            fetch(`/admin/delete/${round}`, { method: 'DELETE' })
	                .then(res => res.text())
	                .then(alert);
	        }
	    }
	</script>
</body>
</html>