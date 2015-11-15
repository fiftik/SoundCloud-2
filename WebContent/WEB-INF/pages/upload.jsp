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
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
		<div id="text">
			<!--<form:form action="${uploadupurl}" commandName="music" method="post">
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
   <p><br/><br/>
   <input id="submit" type="submit" value="Загрузить"></p>
  	</form:form> -->


			<form id="form_upload" action="${uploadupurl}" method="post"
				enctype="multipart/form-data">
				<table>
					<tr>
						<td><label for="author">Исполнитель:</label></td>

						<td><input id="author" name="author" value="${music.author}"></input></td>
					</tr>
					<br/>

					<tr>
						<td><label for="name_song">Название песни:</label></td>

						<td><input id="name_song" name="name_song"
							value="${music.name_song}"></input></td>
					</tr>
					<br />

					<tr>
						<td><label for="genre">Выберите жанр:</label></td>

						<td><select name="genre" id="genre">
								<option>Rap</option>
								<option>Rock</option>
								<option>Heavy Metal</option>
								<option>Pop</option>
								<option>Dance</option>
								<option>Other</option>
						</select></td>
					</tr>

				</table>
				<p>
					<input id="path" type="file" name="file"></input><br />
					<br /> <input id="submit" type="submit" value="Загрузить">
				</p>
			</form>




		</div>

	</div>
</body>
</html>