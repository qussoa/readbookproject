<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>□□□ 나의 JSP page □□□</title>
</head>
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			let btn_id = $(this).attr("id")
			let url = "${rootPath}/"
			if (btn_id == "btn-update") {
				url += "update/${bookDTO.b_code}"
			} else if (btn_id == "btn-delete") {
				url += "delete/${bookDTO.b_code}"
			} else if (btn_id == "btn-list"){
				url += "rbinsert/${bookDTO.b_code}"
			}
			document.location.href = url
		})
	})
</script>
<body>
	<header>
		<hr>
		<h3>${bookDTO.b_name}</h3>
	</header>
	<hr>
	<article>
		<dl class="row">
			<dt class="col-sm-3 bg-default">도서코드</dt>
			<dd class="col-sm-9 text-left">${bookDTO.b_code}</dd>
		</dl>
		<dl class="row">
			<dt class="col-sm-3">도서명</dt>
			<dd class="col-sm-9 text-left">${bookDTO.b_name}</dd>
		</dl>
		<dl class="row">
			<dt class="col-sm-3">출판사</dt>
			<dd class="col-sm-9 text-left">${bookDTO.b_comp}</dd>
		</dl>
		<dl class="row">
			<dt class="col-sm-3">저자</dt>
			<dd class="col-sm-9 text-left">${bookDTO.b_auther}</dd>
		</dl>
		<dl class="row">
			<dt class="col-sm-3">구입연도</dt>
			<dd class="col-sm-9 text-left">${bookDTO.b_year}</dd>
		</dl>
		<dl class="row">
			<dt class="col-sm-3 ">구입가격</dt>
			<fmt:formatNumber value="${bookDTO.b_iprice}" type="number"
				maxFractionDigits="3" var="commaPrice" />
			<dd class="col-sm-9 text-left">${commaPrice}</dd>
		</dl>
		<div>
			<button class="btn btn-dark mb-2" id="btn-update" type="button">수정</button>
			<button class="btn btn-dark mb-2" id="btn-delete" type="button">삭제</button>
			<button class="btn btn-dark mb-2" id="btn-list" type="button">독서록작성</button>
		</div>
	</article>
</body>
</html>