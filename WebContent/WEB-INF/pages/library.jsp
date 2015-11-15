<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
	
	
	<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
	
	<c:url value="/song" var="songurl"></c:url>
	<c:url value="/changeRap" var="rapurl"></c:url>
	<c:url value="/changeHV" var="hvurl"></c:url>
	<c:url value="/changeRock" var="rockurl"></c:url>
	<c:url value="/changePop" var="popurl"></c:url>
	<c:url value="/changeDance" var="danceurl"></c:url>
	<c:url value="/changeOther" var="otherurl"></c:url>
	<c:url value="/library" var="allmusicurl"></c:url>
	<c:url value="/addmusic" var="addmusicurl"></c:url>
	<c:url value="/library/search" var="searchurl"></c:url>

	<div id="body">
		<jsp:include page="/WEB-INF/pages/header.jsp" />
	
	
		<div id="text">
		</br> 
		<label>Вы можете выбрать жанр</label>
			<select
				onChange="if(this.options[this.selectedIndex].value!=''){window.location=this.options[this.selectedIndex].value}else{this.options[selectedIndex=0];}">
				<option value="">----------------------------
				<option value="${allmusicurl}">All Music</option>
				<option value="${rapurl}">Rap</option>
				<option value="${rockurl}">Rock</option>
				<option value="${hvurl}">Heavy Metal</option>
				<option value="${popurl}">Pop</option>
				<option value="${danceurl}">Dance</option>
				<option value="${otherurl}">Other</option>
			</select>
			<form action="${searchurl}" method="post">
			<input id="search" name="search" placeholder="Search...">
			<input value="Search" type="submit" />
			</form>
			<br/>
			<c:forEach items="${music}" var="music">
				<br/>
				<a href='<c:url value="/song?id=${music.id}"/>'>${music.author} - ${music.name_song}</a>&nbsp &nbsp Жанр: ${music.genre}
				<br/>
				<!-- <embed src='<c:url value="/music?id=${music.id}"/>' type="audio/mpeg"
					width="280" height="60" autostart="false" loop="false"
					align="middle" volume="100">
				</embed> -->

				<audio controls>
    				<source src='<c:url value="/music?id=${music.id}"/>' type="audio/mpeg"></source>
				</audio>


				<form action='<c:url value="/addmusic?id=${music.id}"/>' method="post" id="${music.id}" class="addmsc">
					<input type="submit" value="Добавить в свой Playlist" />
				</form>
			</c:forEach>
			
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