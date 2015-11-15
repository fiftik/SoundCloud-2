<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
<spring:url value="/main" var="mainurl" />
<spring:url value="/profile" var="profileurl" />
<spring:url value="/library" var="libraryurl" />
<spring:url value="/about_us" var="about_usurl" />
<spring:url value="/logout" var="logouturl" />
<spring:url value="/upload" var="uploadurl" />
<spring:url value="/playlist" var="playlisturl" />


<div id="wrapper">
	<header id="header">
		

		<nav id="main-nav">
		
			<ul>
				<li class="first home active"><a href="${mainurl}"><span>Home</span></a></li>
						
				<li class="parent dropdown "><a href="#"><span>Profile</span></a>
					
					<ul>
						<li class=""><a href="${playlisturl}">My Playlist</a></li>
						<li class=""><a href="${profileurl}">Settings</a></li>
						</ul>
				</li>
				
				<li class="blog "><a href="${libraryurl}"><span>Library</span></a></li>

				<li class="profile "><a href="${uploadurl}"><span>Upload Song</span></a></li>
					
				<li class="contact "><a href="${about_usurl}"><span>About us</span></a></li>

				<li class="log_out "><a href="${logouturl}"><span>Log Out</span></a></li>

								
							</ul>
			
			<div class="clear"></div>
		
		</nav><!--/main-nav-->
		
		<div class="clear"></div>

	</header><!-- /#header -->	
	

    
</div><!-- /#wrapper -->
