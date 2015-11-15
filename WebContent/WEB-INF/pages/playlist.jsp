<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
</head>
<body>
	<c:url value="/song" var="songurl"></c:url>
	<div id="body">
		<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
		<div id="text">
	
			<c:forEach items="${music}" var="music">
				<!-- <embed src='<c:url value="/music?id=${music}"/>' type="video/avi"
					width="280" height="40" autostart="false" loop="false"
					align="middle" volume="100">
				</embed> -->
				<audio controls>
    				<source src='<c:url value="/music?id=${music}"/>' type="audio/mpeg"></source>
				</audio>
				</br>	
			</c:forEach>	
	
		</div>
		
	</div>
</body>
</html>