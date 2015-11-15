<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
	<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
	<spring:url value="/song/comm" var="addcommurl" />
	<div id="body">
	<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
	<div id="text">
		
				<br/>
				<a href='<c:url value="/song?id=${music.id}"/>'>${music.author} - ${music.name_song}</a>&nbsp &nbsp Жанр: ${music.genre}
				<br/>
				<!-- <embed src='<c:url value="/music?id=${music.id}"/>' type="video/avi"
					width="280" height="40" autostart="false" loop="false"
					align="middle" volume="100">
				</embed>-->
				<audio controls>
    				<source src='<c:url value="/music?id=${music.id}"/>' type="audio/mpeg"></source>
				</audio>
				<form action='<c:url value="/addmusic?id=${music.id}"/>' method="post" id="${music.id}" class="addmsc">
					<input type="submit" value="Добавить в свой Playlist" />
				</form>
			<form action='<c:url value="/song/comm?id=${music.id}"/>' method="post" id="addcom">
				<label>Оставьте комментарий:</label>
				<input type="hidden" name="name_user" id="name_user"
					value="${user.login}" />
				<br />
				<textarea id="comment" name="comment" cols="40" rows="4"></textarea><br/><br/>
				<input id="submitcom" type="submit" value="Жахнуть коммент!)" onclick="send();"/>
			</form>
			<br/><br/>
			<div id="comments">
			<c:forEach items="${comm}" var="comm">
			<form id="commentform">
			<div id="textincomm">
			${comm.name_user} &nbsp&nbsp ${comm.date}
			<br/>
			<br/>
			${comm.comment}
			</div>
			</form>
			</c:forEach>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$('.addmsc').submit(function(e){
		e.preventDefault();
		var id = this.id
		var m_method=$(this).attr('method');
		var m_action=$(this).attr('action');
		var m_data=$(this).serialize();
		$.ajax({
		type: m_method,
		url: m_action,
		data: m_data,
		success: function(data) {
			alert('Песня добавлена в плейлист!')
		}
		});
		});
		});
	</script>	
</body>
</html>