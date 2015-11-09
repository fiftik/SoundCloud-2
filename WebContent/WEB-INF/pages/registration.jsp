<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Регистрация</title>
<link rel="stylesheet"
		href="<c:url value="/resources/css/regpage.css"/>" />
		<spring:url value="/reg/check" var="checkurl" />
</head>
<body>
	<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.validate.min.js"/>"></script>
	<div id="auth">
		<form:form action="${checkurl}" id="login" commandName="user"
			method="post">
			<h1>Регистрация</h1>
			<fieldset id="inputs">
				<form:input id="username" placeholder="Логин" autofocus=""
					required="" type="text" path="login" /></br>
					
					<form:errors cssStyle="color: red;" path="login"/>
					
				<form:input id="password" placeholder="Пароль" required=""
					type="password" path="password" /></br>
					
					<form:errors cssStyle="color: red;" path="password"/>
					
				<form:input id="name" placeholder="Имя" autofocus=""
					required="" type="text" path="name" /></br>
					
					<form:errors cssStyle="color: red;" path="name"/>
					
				<form:input id="surname" placeholder="Фамилия" autofocus=""
					required="" type="text" path="surname" /></br>
					
					<form:errors cssStyle="color: red;" path="surname"/>
					
				<form:input id="email" placeholder="E-mail" autofocus=""
					required="" type="text" path="email" /></br>
					
					<form:errors cssStyle="color: red;" path="email"/>
					
				<form:input id="phone" placeholder="Телефон" autofocus=""
					required="" type="text" path="phone" /></br>
					
					<form:errors cssStyle="color: red;" path="phone"/>
					
				<form:input id="city" placeholder="Город" autofocus=""
					required="" type="text" path="city" /></br>
					
					<form:errors cssStyle="color: red;" path="city"/>
					
			</fieldset>
			<fieldset id="actions">
				<input id="submit" value="Зарегистрироваться" type="submit">
			</fieldset>
		</form:form>
	</div>
	<script>

		$(document).ready(function() {

			$("#login").validate({

				rules : {

					login : {
						required : true,
						minlength : 4,
						maxlength : 16,
					},

					password : {
						required : true,
						minlength : 6,
						maxlength : 16,
					},
					
					name : {
						required : true,
						minlength : 3,
						maxlength : 16,
					},
					
					surname : {
						required : true,
						minlength : 3,
						maxlength : 16,
					},
					
					email : {
						required : true,
						email : true,
					},
					
					phone : {
						required : true,
						minlength : 7,
						maxlength : 20,
						number : true,
					},
					
					city : {
						required : true,
						minlength : 3,
						maxlength : 20,
					},
				},

				messages : {

					login : {
						required : "Это поле обязательно для заполнения",
						minlength : "Логин должен быть минимум 4 символа",
						maxlength : "Максимальное число символов - 16",
					},

					password : {
						required : "Это поле обязательно для заполнения",
						minlength : "Пароль должен быть минимум 6 символов",
						maxlength : "Пароль должен быть максимум 16 символов",
					},
					
					name : {
						required : "Это поле обязательно для заполнения",
						minlength : "Имя должно быть минимум 3 символа",
						maxlength : "Имя должно быть максимум 16 символов",
					},
					
					surname : {
						required : "Это поле обязательно для заполнения",
						minlength : "Фамилия должна быть минимум 3 символа",
						maxlength : "Фамилия должна быть максимум 16 символов",
					},
					
					phone : {
						required : "Это поле обязательно для заполнения",
						minlength : "Телефон должен быть минимум 7 символов",
						maxlength : "Телефон должен быть максимум 20 символов",
					},
					
					city : {
						required : "Это поле обязательно для заполнения",
						minlength : "Город должен быть минимум 3 символа",
						maxlength : "Город должен быть максимум 20 символов",
					},

				},
				
				errorPlacement: function(error, element){
					element.after(error).after('<br/>');
				}

			});

		});
	</script>
</body>
</html>