<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%
	/*
		spring-form tag lib
		html input, form 등의 입력 box용 tag를 확장하여
		spring의 controller와 연동이 쉽게해주는 lib
	*/
%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>□□□ 나의 JSP page □□□</title>
<style>
@font-face {
	font-family: 'BinggraeMelona';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BinggraeMelona.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: BinggraeMelona;
}

fieldset {
	width: 70%;
	margin: 20px auto;
	border: 1px solid #D9D4CF;
	border-radius: 10px;
}

legend {
	font-weight: bold;
	font-size: 20px;
}

input,textarea{
	display: inline-block;
	width: 90%;
	padding: 8px;
	margin: 5px;
	border-radius: 20px;
	
}

input:focusm textarea:focus {
	border: 2px solid #D9D4CF;
}
</style>
</head>
<body>
	<%
		/*
			html form은 default method get
			form : form tag	default method host
		
		*/
	%>

	<fieldset>
		<legend>메모작성</legend>
		<form:form modelAttribute="dto" class="memo-form">

			<%
				/*
								 html tag의 inputbox와 달리 name이라는 속성을 사용하지 않고
								 path라는 속성이 변수설정 역할을 수행
							*/
			%>

			<form:input path="m_auth" class="in-box" placeholder="작성자 id" />
			<br />
			<form:input path="m_date" class="in-box" placeholder="작성일자" />
			<br />
			<form:input path="m_time" class="in-box" placeholder="작성시각" />
			<br />
			<form:input path="m_cat" class="in-box" placeholder="카테고리" />
			<br />
			<form:input path="m_subject" class="in-box" placeholder="제목" />
			<br />
			<form:textarea path="m_text" rows="5"/><br/>
			<button>ENTER</button>
		</form:form>
	</fieldset>
</body>
</html>