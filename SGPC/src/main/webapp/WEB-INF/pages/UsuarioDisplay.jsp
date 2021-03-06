<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="es">
<head>
<%@include file="templates/head.jsp"%>
<title>${model} <c:out value="${objeto.codigo}" /></title>
</head>
<body>
	<%@include file="templates/nav.jsp"%>

	<ol class="breadcrumb">
		<li><a href="<c:url value="/" />">Inicio</a></li>
		<li><a href="<c:url value="/gestion" />">Gesti�n</a></li>
		<li><a href="<c:url value="${basepath}" />">${model}</a></li>
		<li class="active"><c:out value="${objeto.codigo}" /></li>
	</ol>

	<h1>${model} ${objeto.codigo}</h1>

	<dl class="dl-horizontal">
	
		<dt>C�digo</dt>
		<dd>${objeto.codigo}</dd>
		
		<dt>NIF/NIE</dt>
		<dd>${objeto.nifNie}</dd>
		
		<dt>Nombre</dt>
		<dd>${objeto.nombre}</dd>

		<dt>Apellido 1</dt>
		<dd>${objeto.apellido1}</dd>

		<dt>Apellido 2</dt>
		<dd>${objeto.apellido2}</dd>

		<dt>Email</dt>
		<dd>${objeto.email}</dd>
		
		<dt>Tel�fono</dt>
		<dd>${objeto.telefono}</dd>

		<dt>Rol</dt>
		<dd>${objeto.rol.codigo}</dd>

		<dt>Fecha Alta</dt>
		<dd>${objeto.fechaAlta}</dd>

		<c:if test="${not empty objeto.fechaBaja}">
			<dt>Fecha baja</dt>
			<dd>${objeto.fechaBaja}</dd>
		</c:if>
		
		<dt>Tests</dt>
		<dd><ul>
			<c:forEach items="${objeto.getTests()}" var="test">
				<li>${test.codigo} - ${test.nombre} - Fecha Inicio: ${test.fechaInicio} - Fecha Fin: ${test.fechaFin}</li>
			</c:forEach>
			</ul>
		</dd>
		
		 <%--  <dt>Intentos asignados</dt>
		<dd><ul>
			<c:forEach items="${objeto.intentos}" var="intento">
				<li>${intento}</li>
			</c:forEach>
			</ul>
		</dd>   --%>
		
	</dl>

	<p class="text-right">
		<c:if test="${empty objeto.fechaBaja}">
			<a href="#ventanaModalDelete"
				data-toggle="modal"
				class="btn btn-danger"><span class="glyphicon glyphicon-trash"
				aria-hidden="true"></span> Borrar</a>
		</c:if>
		<c:if test="${not empty objeto.fechaBaja}">
			<a href="<c:url value='${basepath}/${objeto.codigo}/reactivar' />"
				class="btn btn-warning"><span
				class="glyphicon glyphicon-retweet" aria-hidden="true"></span>
				Reactivar</a>
		</c:if>
		<a href="<c:url value='${basepath}/${objeto.codigo}/editar' />"
			class="btn btn-success"><span class="glyphicon glyphicon-pencil"
			aria-hidden="true"></span> Editar</a>
	</p>
	<%@include file="templates/modalWindowDelete.jsp"%>
	<%@include file="templates/footer.jsp"%>
</body>
</html>