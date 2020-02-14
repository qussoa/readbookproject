<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<form:form modelAttribute="bookDTO">
	<legend>도서정보입력</legend>

	<div class="row">
		<div class="form-group col-xs-4">
			<form:input class="form-control" path="b_code" placeholder="도서코드" />
		</div>
	</div>

	<div class="row">
		<div class="form-group col-xs-4">
			<form:input class="form-control" path="b_name" placeholder="도서명" />
		</div>
	</div>

	<div class="row">
		<div class="form-group col-xs-4">
			<form:input class="form-control" path="b_auther" placeholder="도서명" />
		</div>
	</div>
	<div class="row">
		<div class="form-group  col-xs-4">
			<form:input class="form-control" path="b_comp" placeholder="출판사" />
		</div>
	</div>
	<div class="row  col-xs-4">
		<div class="form-group">
			<form:input class="form-control" path="b_year" placeholder="출판년도" />
		</div>
	</div>
	<div class="row">
		<div class="form-group  col-xs-4">
			<form:input class="form-control" path="b_iprice" placeholder="도서가격" />
		</div>
	</div>

	<label class="in-label"></label>
	<div class="in-box">
		<button class="btn btn-outline-secondary">저장</button>
	</div>
</form:form>




