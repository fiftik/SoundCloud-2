<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet"
		href="<c:url value="/resources/css/loginpage.css"/>" />
</head>
<body>
	
	<div id="body">

		<div id="text">

			<spring:url value="/login/check" var="logincheckurl" />
			<spring:url value="/reg" var="regurl" />

			<div id="auth">
				<form:form action="${logincheckurl}" id="login" commandName="user"
					method="post">
					<h1>Войти</h1>
					<fieldset id="inputs">
						<form:input id="username" placeholder="Логин" autofocus=""
							required="" type="text" path="login" />							
						<form:input id="password" placeholder="Пароль" required=""
							type="password" path="password" /></br>
							<form:errors cssStyle="color: red;" path="login"/>
					</fieldset>
					<fieldset id="actions">
						<input id="submit" value="Войти" type="submit"><a href="${regurl}">Регистрация</a>
					</fieldset>
				</form:form>
			</div>

		</div>

	</div>
</body>
</html>