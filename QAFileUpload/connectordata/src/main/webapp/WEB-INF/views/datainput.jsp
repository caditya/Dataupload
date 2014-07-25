<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/css/coffee.css" />"
	rel="stylesheet">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function() {
		$(function() {
		    $(document).keypress(function(event) {
		        var ch = String.fromCharCode(event.keyCode || event.charCode);
		        switch (ch) {
		            case 'c': case 'C':
		            	uploadFile();
		                break;
		        }
		    });
		});


		
		$("#submit-button").click(function() {
			$("#newaccountform").attr("action", "/it/createnewaccount");
			$("#newaccountform").attr("method", "post");
			$("#newaccountform").submit();
		});
		$("#startfile").click(function() {
			createstart();
		});
		
		
		
	});
</script>

<script>
function createstart(){
	alert('createstart');
	$.getJSON("/connector/startfile", { store: $('#store').val() }, function(startfile) {
		if (startfile.error== 'false') {
        	$("#placeholder_startfile").html(startfile);
            
        } else if (availability.error=='true'){
        	$("#placeholder_startfile").html("Cannot create file with this data");
        }
    });
}



	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
				.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');
</script>
<title>Follett Apps</title>
<style>
.error {
	color: #ff0000;
}
 
</style>
</head>
<body>

	<%@ include file="shared/CoffeeHeader.jsp"%>
	<c:if test="${'Account Created' eq account_status}">
		<c:out value="Account Created1"></c:out>
	</c:if>
	
	 <div class="roundcorners">
	<form:form method="POST" commandName="dataBlock" action="/connector/startfile" enctype="multipart/form-data">
		<form:errors path="*" cssClass="errorblock" element="div" />
	
	 <table>
		<tr>
				<td class='label' style="text-decoration:"><b>Upload data</b></td>
				
			</tr>
			<tr>
				<td class='label'>Store</td>
				<td> <form:input path="store"  size="40"/></td>
				<td><form:errors path="store" cssClass="error" /></td>
			</tr>
			<tr>
				<td class='label'>Store</td>
				<td><form:input path="campus"  size="40"/></td>
				<td><form:errors path="campus" cssClass="error"  /></td>
			</tr>
			
			<tr>
			<td class='label'>Campus Name</td>
				<td><form:input path="campusName" size="40"/></td>
				<td><form:errors path="campusName" cssClass="error" /></td>
			</tr>
			<tr>
				<td class='label'>Term</td>
				<td><form:input path="term" size="40"/></td>
				<td><form:errors path="term" cssClass="error" /></td>
			</tr>
			<tr>
				<td class='label'>Term Name</td>
				<td><form:input path="termName" size="40"/></td>
				<td><form:errors path="termName" cssClass="error" /></td>
			</tr>
			<tr>
				<td class='label'>Data file</td>
				
				<td>
				<input type="file" name="dataFile"/>
				</td>
				
			</tr>
			<tr>
			<td><input type='button' id='startfile' name='startfile'
				value='Generate Start File' hidden="true" /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" /></td>
			</tr>
			<tr>
		<td><a href="/connector/" class='font'>Back to main page</a></td>
		</tr>
		<tr>
			<td><p  class='font' id="placeholder_startfile"></p></td>
		</tr>
		
		</table>
	
	</form:form>
	</div>
	
	
</body>
</html>