<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
<spring:url value="/main" var="mainurl" />
<spring:url value="/profile" var="profileurl" />
<spring:url value="/library" var="libraryurl" />
<spring:url value="/about_us" var="about_usurl" />
<spring:url value="/logout" var="logouturl" />


<div id="header">
	<p align="center">
		<a href="${mainurl}"><img 
			src="<c:url value="/resources/images/home.jpg"/>"
			onclick="this.src='<c:url value="/resources/images/homeonclick.jpg"/>'"
			onmouseout="this.src='<c:url value="/resources/images/home.jpg"/>'"
			onmouseover="this.src='<c:url value="/resources/images/homeonmouseover.jpg"/>'"></a>
		<a href="${profileurl}"><img
			src="<c:url value="/resources/images/profile.jpg"/>"
			onclick="this.src='<c:url value="/resources/images/profileonclick.jpg"/>'"
			onmouseout="this.src='<c:url value="/resources/images/profile.jpg"/>'"
			onmouseover="this.src='<c:url value="/resources/images/profileonmouseover.jpg"/>'"></a>
		<a href="${libraryurl}"><img
			src="<c:url value="/resources/images/library.jpg"/>"
			onclick="this.src='<c:url value="/resources/images/libraryonclick.jpg"/>'"
			onmouseout="this.src='<c:url value="/resources/images/library.jpg"/>'"
			onmouseover="this.src='<c:url value="/resources/images/libraryonmouseover.jpg'"/>"></a>
		<a href="${about_usurl}"><img
			src="<c:url value="/resources/images/about_us.jpg"/>"
			onmouseout="this.src='<c:url value="/resources/images/about_us.jpg"/>'"
			onclick="this.src='<c:url value="/resources/images/about_usonclick.jpg"/>'"
			onmouseover="this.src='<c:url value="/resources/images/about_usonmouseover.jpg"/>'"></a>
		<a href="${logouturl}"><img
			src="<c:url value="/resources/images/log_out.jpg"/>"
			onmouseout="this.src='<c:url value="/resources/images/log_out.jpg"/>'"
			onclick="this.src='<c:url value="/resources/images/log_outonclick.jpg"/>'"
			onmouseover="this.src='<c:url value="/resources/images/log_outonmouseover.jpg"/>'"></a>
	</p>
</div>
