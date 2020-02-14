<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<style>
body {
	justify-content: center;
	text-align: center;
}

td {
	font-size: medium;
}
</style>
<script>
	$(function() {
		$("#search-table tr").click(function() {
			let b_code = $(this).attr("data-id")
			document.location.href = "${rootPath}/view/" + b_code
		})
	})
</script>
<style>
</style>
</head>
<body>
	<header class="header">
		<h3>도서정보</h3>
	</header>
	<section class="list" id="search-list">
		<article class="body">
			<table class="table table-hover table-sm" id="search-table">
				<thead>
					<tr>
						<th scope="col">ISBN</th>
						<th scope="col">도서명</th>
						<th scope="col">출판사</th>
						<th scope="col">저자</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty BOOKLIST}">
							<tr scope="row">
								<td colspan="6">도서정보없음</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${BOOKLIST}" var="bookDTO">
								<tr scope="row" data-id="${bookDTO.b_code}">
									<td>${bookDTO.b_code}</td>
									<td>${bookDTO.b_name}</td>
									<td>${bookDTO.b_auther}</td>
									<td>${bookDTO.b_comp}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</article>
	</section>
	<a href="${rootPath}/insert" class="btn btn-outline-secondary">추가</a>

</body>
</html>