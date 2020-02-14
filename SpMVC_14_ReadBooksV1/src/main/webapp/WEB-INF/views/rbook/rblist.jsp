<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(function() {
		$("#main-table tbody tr").click(function() {
			let rb_seq = $(this).attr("data-id")
			document.location.href = "${rootPath}/rbook/rbview/" + rb_seq
		})
	})
</script>
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<section class="rblist">
	<article class="rbody">
		<header class="header">
			<h3>도서감상록</h3>
		</header>
		<table class="table table-hover" id="main-table">
			<thead>
				<tr>
					<th scope="col">SEQ</th>
					<th scope="col">도서코드</th>
					<th scope="col">독서날짜</th>
					<th scope="col">독서시작날짜</th>
					<th scope="col">독서종료시각</th>
					<th scope="col">제목</th>
					<th scope="col">별점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty READLIST}">
						<tr scope="row">
							<td colspan="7"><a href="${rootPath}/rbook/rbinsert">독후감
									작성하기</a></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${READLIST}" var="readBookDTO" >
							<tr scope="row" data-id="${readBookDTO.rb_seq}">
								<td>${readBookDTO.rb_seq}</td>
								<td>${readBookDTO.rb_bcode}</td>
								<td>${readBookDTO.rb_date}</td>
								<td>${readBookDTO.rb_stime}</td>
								<td>${readBookDTO.rb_rtime}</td>
								<td>${readBookDTO.rb_subject}</td>
								<td>${readBookDTO.rb_star}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</article>
</section>
