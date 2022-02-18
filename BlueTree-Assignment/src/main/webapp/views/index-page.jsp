<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.task.java.entity.Employee" %>

<!doctype html>
<html lang="en">
  <head>
    <center>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>@Index</title>
    <script src="https://kit.fontawesome.com/6e7b9792cc.js" crossorigin="anonymous"></script>

    <style type="text/css">
      .mynavbar{
        border-bottom: 5px solid green;
        box-shadow: 0 5px 5px 9px silver;
      }
     
    </style>


  </head>
  <body style="background-color: rgb(224,255,255);">
  
    
         <nav class="navbar navbar-expand-lg navbar-primary bg-white mynavbar">
  <a style="margin-left: 2%;" class="navbar-brand" href="/">${name}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">View Employee</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="add">Add Employee</a>
      </li>
      
      
    </ul>
   
  </div>
</nav>
<div class="container">
<br>
  
  <c:if test="${msg == 'Added Successfully...'}">
 <div class="alert alert-success" role="alert">
  <span>${msg}</span></div>
</c:if>
<c:if test="${msg == ' Updated Successfully...'}">
 <div class="alert alert-info" role="alert">
  <span>${msg}</span></div>
</c:if>
<c:if test="${msg == 'Deleted Successfully!!!'}">
 <div class="alert alert-danger" role="alert">
  <span>${msg}</span></div>
</c:if>
</div>
 

   <br><br><br><br>
       <div class="container">
          <table class="table table-striped table-striped">
            <header style="font-weight: bolder; font-size: 20px;">Employee Details</header>
            <br>
  <thead>
    <tr>
      <th scope="col">Sl.</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Dob</th>
      <th scope="col">Age</th>
      <th scope="col">Salary</th>
      <th scope="col">Status</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
    
    <c:forEach items = "${employees}" var = "emp" varStatus = "counter">
    <tr>
      <th scope="row">${counter.count}</th>
      <td>${emp.getName()}</td>
     <td>${emp.getEmail()}</td>
     <td>${emp.getDob()}</td>
     <td>${emp.getAge()}</td>
     <td>${emp.getSalary()}</td>
     <td>${emp.isStatus() == 'true' ? 'ACTIVE' : 'INACTIVE'}</td>
     <td><a href="edit/${emp.getId()}" style="color: green;"><button type="button" class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i></button></a></td>
      <td><a href="delete/${emp.getId()}" style="color: red;"><button type="button" class="btn btn-danger"><i class="fa-solid fa-trash"></i></button></a></td>
    </tr>
   

  </c:forEach>


  </tbody>
</table>
       </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  




</div>
</body>
</html>