<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
<spring:url value="/upload" var="uploadurl" />
<spring:url value="/playlist" var="playlisturl" />

<div id="linkbar">
<p align="left">
<a href="${uploadurl}"><img src="<c:url value="/resources/images/upload_song.jpg"/>"
	onmouseout="this.src='<c:url value="/resources/images/upload_song.jpg"/>'"
	onclick="this.src='<c:url value="/resources/images/upload_songonclick.jpg"/>'"
	onmouseover="this.src='<c:url value="/resources/images/upload_songonmouseover.jpg"/>'"></a>
</br>
<a href="${playlisturl}"><img src="<c:url value="/resources/images/my_playlist.jpg"/>"
	onmouseout="this.src='<c:url value="/resources/images/my_playlist.jpg"/>'"
	onclick="this.src='<c:url value="/resources/images/my_playlistonclick.jpg"/>'"
	onmouseover="this.src='<c:url value="/resources/images/my_playlistonmouseover.jpg"/>'"></a>
</p>
</div>