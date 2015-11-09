<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>

	<spring:url value="/library" var="libraryurl" />
	<spring:url value="/profile" var="profileurl" />
	<spring:url value="/upload" var="uploadurl" />
	<spring:url value="/playlist" var="playlisturl" />
	
	<div id="body">

		<div id="text">
			
			<h2>SoundCloud-2 рад приветствовать Вас,
			<c:out value="${user.name}" />.<br/> Желаем приятного времяпрепродвождения. Инструкцию по пользованию
			сайтом вы можете почитать ниже.<br/></h2>
			<div>
				<button id="submit" onclick="javascript:collapsElement('identifikator')" title="">Инструкция</button>
				<div id="identifikator" style="display: none">
				<br/><br/>
					<p>В <a href="${profileurl}">Profile</a> хранится информация о вас.<br/>В библиотеке Вы можете
			ознакомится с <a href="${libraryurl}">нашей базой</a> музыкальных файлов, добавить их в свой
			<a href="${playlisturl}">Playlist</a>, для комфортного прослушивания полюбившейся Вам музыки.<br/>Во
			вкладке <a href="${uploadurl}">Upload Song</a> Вы имеете возможность загружать музыкальные файлы
			ради себя и других пользователей. Не забывайте выбирать нужный жанр в
			выпадающем списке! Это сделано для удобства поиска определенной
			музыки...<br/>Под каждой песней Вы,
			<c:out value="${user.name}" />
			, а также другие пользователи имеете возможность оставлять
			комментарии, делиться впечатлениями, как позитвными, так и
			негативными. Но будьте благоразумными - &#822;н&#822;е&#822;
			&#822;у&#822;с&#822;т&#822;р&#822;а&#822;и&#822;в&#822;а&#822;й&#822;т&#822;е&#822;
			&#822;с&#822;р&#822;а&#822;ч&#822;
			не используйте ненормативную лексику!
			<br/>
			А теперь вперед! Покоряйте горизонты музыкальной библиотеки SoundCloud-2! =)))</p>
				</div>
			</div>
		</div>
		<script>
			function collapsElement(id) {
				if (document.getElementById(id).style.display != "none") {
					document.getElementById(id).style.display = 'none';
				} else {
					document.getElementById(id).style.display = '';
				}
			}
		</script>
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
		<c:import url="linkbar.jsp" charEncoding="UTF-8"></c:import>
	</div>
</body>
</html>