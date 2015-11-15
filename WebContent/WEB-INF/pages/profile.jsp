<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
	
	<c:url value="/profile/change" var="changeurl"></c:url>
	<div id="body">
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
		<div id="text">	
			<form action="${changeurl}" method="post">
				<table>	
					<tr><td>Ваш логин:</td><td><c:out value="${user.login}" /></td><td><input id="login" name="login" value="${user.login}"></td></tr>
					<tr><td>Ваш пароль:</td><td><c:out value="${user.password}" /></td><td><input id="password" name="password" value="${user.password}"></td></tr>
					<tr><td>Ваше имя:</td><td><c:out value="${user.name}" /></td><td><input id="name" name="name" value="${user.name}"></td></tr>
					<tr><td>Ваша фамилия:</td><td><c:out value="${user.surname}" /></td><td><input id="surname" name="surname" value="${user.surname}"></td></tr>
					<tr><td>Ваш E-mail:</td><td><c:out value="${user.email}" /></td><td><input id="email" name="email" value="${user.email}"></td></tr>
					<tr><td>Ваш телефон:</td><td><c:out value="${user.phone}" /></td><td><input id="phone" name="phone" value="${user.phone}"></td></tr>
					<tr><td>Ваш город:</td><td><c:out value="${user.city}" /></td><td><input id="city" name="city" value="${user.city}"></td></tr>
					<tr><td></td><td></td><td><input id="submit" value="Изменить" type="submit" /></td></tr>
				</table>
			</form>
		</div>
		
	</div>
</body>
</html>