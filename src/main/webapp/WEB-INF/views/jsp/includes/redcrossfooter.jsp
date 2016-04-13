<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/wro/bundledJs.js" var="bundledJs" />
<spring:url value="/logout" var="logoutUrl" />

<script src="${bundledJs}"></script>

<!-- csrt for log out-->
<form action="${logoutUrl}" method="post" id="logoutForm">
  <input type="hidden" 
	name="${_csrf.parameterName}"
	value="${_csrf.token}" />
</form>

<section>	
<div class="container">	
<address>
  <strong>Irish Red Cross Head Office</strong><br/>
  16 Merrion Square<br/>
  Dublin 2 D02 XF85, Ireland<br/>
  t: +353 (0) 1 642 4600<br/>
  f: +353 (0) 1 661 4461<br/>

</address>
</div>	
</section>      
