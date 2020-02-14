<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>

.input-box{
	display: flex;
	width: 80%;
	margin: 5px auto;
}
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

#rb_star{
 width : 0;
 border: none;
}
</style>
<script>
	$(function() {

		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});

		$("#rb_star").change(function() {
			let star = $(this).val()
			star = star * 10
			$("span.star-red").css("width", star + "%")
			$("span#star-v").text($(this).val())
		})
	})
</script>

<header>
	<br>
	<h2>감상록 작성</h2>
	<br>
</header>
<section>
	<article>
		<form:form modelAttribute="readBookDTO">
			<div class="input-box">
				<form:input type="text" path="rb_bcode" placeholder="도서코드" />
				<input id="rb_bname" name="rb_bname" placeholder="도서이름을 입력한 후 Enter">
			</div>
			<div class="input-box">
				<form:input type="date" path="rb_date" placeholder="독서일자" />
			</div>
			<div class="input-box">
				<form:input type="time" path="rb_stime" placeholder="독서시작시간" />
				<form:input type="text" path="rb_rtime" placeholder="독서시간" />
			</div>

			<div class="input-box">
				<form:input type="text" path="rb_subject" placeholder="한줄평" />
			</div>
			<div class="input-box">
				<form:input path="rb_star" min="1" max="10" placeholder="별점" id="rb_star" />
				<div class="starRev">
					<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
					<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
					<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
					<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
					<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
				</div>
			</div>
			<div class="input-box">
				<form:textarea type="text" path="rb_text" />
			</div>

			<div class="input-box">
				<div class="in-box">
					<button class="btn btn-outline-secondary">저장</button>
				</div>
			</div>
		</form:form>
	</article>
</section>