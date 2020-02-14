<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/include/include-header.jsp" %>
<style>
.header{
margin-top:200px;
}
</style>
<script>
	$(function() { // <input>요소에 문자가 입력될 때마다 호출됨.

		$("#btn-search").click(function() {
			let book = $("#search-box").val()
			document.location.href = "${rootPath}/list?b_name=" + book
		})

	})
</script>

	<header class="header">
		<h3>BOOK SEARCH</h3>
	</header>
	<form class="form-inline" id="form-box">
		<div class="form-group mx-sm-3 mb-2">
			<label for="input" class="sr-only">도서이름</label>
			<input type="text" class="form-control" id="search-box"
				placeholder="도서이름">
		</div>
		<button type="button" class="btn btn-default mb-2" id="btn-search">검색</button>
	</form>
