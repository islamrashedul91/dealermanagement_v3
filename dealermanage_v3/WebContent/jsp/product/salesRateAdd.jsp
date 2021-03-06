<jsp:include page="../../base.jsp"></jsp:include>
<br>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Pharmacy</title>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/table.css">
</head>
<body>
<%
String action = (String) session.getAttribute("action");
System.out.println("++++++"+action);
%>
<div class="mcontent">
			<div class="titlenav">
				<ul>
					<li class="title"><a href="">
					<%
					if (action.equalsIgnoreCase("save")) {
					%>
						<td class="PageHeader">Sales Rate Add</td>
					<%
					} else if (action.equalsIgnoreCase("edit")) {
					%>
						<td class="PageHeader">Sales Rate Update</td>
					<%
					}
					%>
					</a></li>
					<li class="bread"><a href="">Dashboard > Sales Rate List > <%
					if (action.equalsIgnoreCase("save")) {
					%>
						<td class="PageHeader">Sales Rate Add</td>
					<%
					} else if (action.equalsIgnoreCase("edit")) {
					%>
						<td class="PageHeader">Sales Rate Update</td>
					<%
					}
					%></a></li>
				</ul>
			</div>
			<br>
		<div class="card">
			<div class="form-style-2">
<%
//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
Date date = new Date();  
String strDate = formatter.format(date);
%>	
	<form action="SalesRateController" method="post" name="frmSave">
		<div class="form-style-2-heading">Provide your information</div>

			<%
			if (action.equalsIgnoreCase("save")) {
			%>
			<label for="field1"><span>Sales Rate ID <span class="required">*</span></span> 
				<!-- generated auto increment id during add [S] -->
				<input type="text" class="input-field" readonly="readonly" name="sales_rate_id" id="sales_rate_id" value="${salesRateId}"  maxlength=25 size=40 required />
				<!-- generated auto increment id during add [E] -->
			</label> 
			<%
			} else if (action.equalsIgnoreCase("edit")) {
			%>
			<label for="field1"><span>Sales Rate ID <span class="required">*</span></span>
				<input type="text" class="input-field" readonly="readonly" name="sales_rate_id" id="sales_rate_id" value="${salesRate.sales_rate_id}"  maxlength=25 size=40 required /> 
			</label>
			<%
			}
			%>
			
			<label for="field2"><span>Rate Percent <span class="required">*</span></span>
				<input type="text" class="input-field" name="rate_percent" id="rate_percent" value="${salesRate.rate_percent}"  maxlength=40 size=40 required /> 
			</label>
			
			<label for="field3"><span>Description </span>
				<input type="text" class="input-field" name="description" id="description" value="${salesRate.description}"  maxlength=40 size=40 /> 
			</label>
			
			<%
			if (action.equalsIgnoreCase("save")) {
			%>
			<label for="field20"><span>Created <span class="required">*</span></span>
				<!-- just display fancy date only [S]-->
				<fmt:parseDate pattern="yyyyMMddHHmmss" value="<%=strDate%>" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" var="fmtDate" />
				<input type="text" class="input-field" readonly="readonly" value="${fmtDate}" size=40/>
				<!-- just display fancy date only [E]-->
				<input type="hidden" class="input-field" readonly="readonly" name="created" id="created" value="<%=strDate%>"  maxlength=14 size=40 required /> 
			</label>
			<%
			} else if (action.equalsIgnoreCase("edit")) {
			%>
			<label for="field20"><span>Created <span class="required">*</span></span>
				<!-- just display fancy date only [S]-->
				<fmt:parseDate pattern="yyyyMMddHHmmss" value="${salesRate.created}" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" var="fmtDate" />
				<input type="text" class="input-field" readonly="readonly" value="${fmtDate}" size=40/>
				<!-- just display fancy date only [E]-->
				<input type="hidden" class="input-field" readonly="readonly" name="created" id="created" value="${salesRate.created}"  maxlength=14 size=40 required /> 
			</label>
			<%
			}
			%>
			
			<%
			if (action.equalsIgnoreCase("save")) {
			%>
			<label for="field21"><span>Updated </span>
				<!-- just display fancy date only [S]-->
				<fmt:parseDate pattern="yyyyMMddHHmmss" value="${salesRate.updated}" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" var="fmtDate" />
				<input type="text" class="input-field" readonly="readonly" value="${fmtDate}" size=40/>
				<!-- just display fancy date only [E]-->
				<input type="hidden" class="input-field" readonly="readonly" name="updated" id="updated" value="${salesRate.updated}"  maxlength=14 size=40 /> 
			</label>
			<%
			} else if (action.equalsIgnoreCase("edit")) {
			%>
			<label for="field21"><span>Updated <span class="required">*</span></span>
				<!-- just display fancy date only [S]-->
				<fmt:parseDate pattern="yyyyMMddHHmmss" value="<%=strDate%>" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm:ss" var="fmtDate" />
				<input type="text" class="input-field" readonly="readonly" value="${fmtDate}" size=40/>
				<!-- just display fancy date only [E]-->
				<input type="hidden" class="input-field" readonly="readonly" name="updated" id="updated" value="<%=strDate%>"  maxlength=14 size=40 required /> 
			</label>
			<%
			}
			%>
			
			<label for="field24"><span>Created By </span>
				<input type="text" class="input-field-60" name="created_by" id="created_by" value="${salesRate.created_by}"  maxlength=40 size=40 /> 
			</label>
			
			<label for="field25"><span>Updated By </span>
				<input type="text" class="input-field-60" name="updated_by" id="updated_by" value="${salesRate.updated_by}"  maxlength=40 size=40 /> 
			</label>
			
			<br><br>
			<label><span></span>
					<input type="submit" value="Submit" />

					<a Class ="button" href="${pageContext.request.contextPath}/jsp/product/salesRate.jsp">Return</a>
			</label>
			
	</form>
	</div>
		</div>	
	</div><!-- mcontent -->
	
</div><!-- main -->
</body>
</html>
<br>
<div>