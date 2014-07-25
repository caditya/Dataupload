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
		
		
		
		$("#submit-button").click(function() {
			$("#newaccountform").attr("action", "/it/createnewaccount");
			$("#newaccountform").attr("method", "post");
			$("#newaccountform").submit();
		});
		$("#confirmUpload").click(function() {
			uploadFile();
		});
		
		$body = $("body");

		$(document).on({
		    ajaxStart: function() { $body.addClass("loading");    },
		    ajaxStop: function() { $body.removeClass("loading"); }    
		});
	});
	
	
	
</script>

<script>
function uploadFile(){
	
	$.getJSON("/connector/dataupload", { store: $('#store').val(), campus: $('#campus').val(), campusName: $('#campusName').val(),term: $('#term').val(),termName: $('#termName').val(),fileName: $('#fileName').val() }, function(status) {
		
		
		if (status.errorCode== '1') {
        	$("#placeholder_status").html("File Upload done.");
        	$("#confirmUpload").hide();
        	$("#pageHeading").html("<b>Last File Uploaded</b>");
        	$("#datadiv").css('background', 'C0C0C0')
            
        } else if (status.errorCode!='1'){
        	$("#placeholder_status").html("File upload failed. Please try manually. " +  status.errorcode);
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

	<form:form method="POST" commandName="dataBlock"
		action="/connector/dataupload">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<div class="roundcorners" id="datadiv">
		<table id="dataTable" name="dataTable">
			
			<tr>
				<td id="pageHeading" class='label' style="text-decoration:"><b>Confirm Upload</b></td>

			</tr>

			<td class='label'>Store</td>
			<input type="hidden" name="store" id="store" value="${dataBlock.store}" />
			<td class='label'><c:out value="${dataBlock.store}"></c:out></td>
			</tr>
			<tr>
				<td class='label'>Campus</td>
				<input type="hidden" name="campus" id="campus" value="${dataBlock.campus}" />
				<td class='label'><c:out value="${dataBlock.campus}"></c:out></td>
			</tr>

			<tr>
				<td class='label'>Campus Name</td>
				<input type="hidden" name="campusName" id="campusName" value="${dataBlock.campusName}" />
				<td class='label'><c:out value="${dataBlock.campusName}"></c:out></td>
			</tr>
			<tr>
				<td class='label'>Term</td>
				<input type="hidden" name="term" id="term" value="${dataBlock.term}" />
				<td class='label'><c:out value="${dataBlock.term}"></c:out></td>
			</tr>
			<tr>
				<td class='label'>Term Name</td>
				<input type="hidden" name="termName" id="termName" value="${dataBlock.termName}" />
				<td class='label'><c:out value="${dataBlock.termName}"></c:out></td>
			</tr>
			<tr>
				<td class='label'>Data File</td>
				<input type="hidden" name="fileName" id="fileName" value="${dataBlock.dataFile.originalFilename}" />
				<td class='label'><c:out value="${dataBlock.dataFile.originalFilename}"></c:out></td>
				<td></td>

			</tr>
			
			
		</table>
		</div>
		
		<table>
		<tr>
				<td colspan="3"><input type="button" value="Confirm Upload"  name="confirmUpload" id="confirmUpload" /></td>
			</tr>
		</table>
		
		<div class="modal"><!-- Place at bottom of page --></div>
		<div class="modal"><!-- Place at bottom of page --></div>
		
	</form:form>
	
<%@ include file="shared/CoffeeFooter.jsp"%>
</body>
</html>