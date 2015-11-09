<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
<spring:url value="/upload/up" var="uploadupurl" />
	<div id="body">

	<div id="text">
	 <form:form action="${uploadupurl}" commandName="music" method="post">
	 <table>
	 <tr><td><label for="author">Исполнитель:</label></td>
	 <td><form:input id="author" path="author"></form:input></td></tr><br/>
	 <tr><td><label for="name_song">Название песни:</label></td>
	 <td><form:input id="name_song" path="name_song"></form:input></td></tr><br/>
	 <tr><td><label for="genre">Выберите жанр:</label></td>
	 <td><form:select path="genre">
	 	<form:option value="Rap"></form:option>
	 	<form:option value="Rock"></form:option>
	 	<form:option value="Heavy Metal"></form:option>
	 	<form:option value="Pop"></form:option>
	 	<form:option value="Dance"></form:option>
	 	<form:option value="Other"></form:option>
	 </form:select></td></tr>
	 </table>
   <p><form:input id="path" type="file" path="path"></form:input><br/><br/>
   <input id="submit" type="submit" value="Загрузить"></p>
  	</form:form> 		
		
	</div>
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
		<c:import url="linkbar.jsp" charEncoding="UTF-8"></c:import>
	</div>
</body>
</html>