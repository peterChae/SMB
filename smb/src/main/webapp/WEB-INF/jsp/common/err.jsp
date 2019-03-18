<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4>Failed URL: ${url} Exception: ${exception.message}</h4> 
<c:forEach items="${exception.stackTrace}" var="ste">
	${ste} 
</c:forEach>