<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="dateTag" uri="/dateTag"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">
</head>
<body><div class="container">
    <jsp:include page="navbar.jsp"/>
</div>
<div class="description">
    <h1>Ticket Reservation</h1>
    <p class="lead">Fill in every field below to reserve your tickets</p>
</div>
<div class="container">
    <table id="shows" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Title</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${movieTitle}</td>
                <td><dateTag:DateTag date="${screening.time}"></dateTag:DateTag></td>
            </tr>
        </tbody>
    </table>
</div>
<div class=container>
    <form:form action="/confirmData/${screening.id}" name="form" method="POST">
        <div class="form-group row">
            <label for="name-input" class="col-xs-2 col-form-label">First name</label>
            <div class="col-xs-10">
                <input class="form-control" type="text" pattern="[A-Za-z]{1,20}" id="name-input" name="firstName" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label for="surname-input" class="col-xs-2 col-form-label">Last Name</label>
            <div class="col-xs-10">
                <input class="form-control" type="search" pattern="[A-Za-z]{1,20}" id="surname-input" name="lastName" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label for="email-input" class="col-xs-2 col-form-label">Email</label>
            <div class="col-xs-10">
                <input class="form-control" type="email" id="email-input" name="email" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label for="tel-input" class="col-xs-2 col-form-label">Telephone</label>
            <div class="col-xs-10">
                <input class="form-control" type="tel" pattern="[0-9]{9,12}" id="tel-input" name="telephone" required="required">
            </div>
        </div>
        <div class="form-group row">
            <label for="tickets-number-input" class="col-xs-2 col-form-label">Number of tickets</label>
            <div class="col-xs-10">
                <input class="form-control" type="number" id="tickets-number-input" min="1" max="10" name="numberOfTickets" required="required">
            </div>
        </div>
        <button type="submit" class="btn btn-warning pull-right">Book tickets</button>
    </form:form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

