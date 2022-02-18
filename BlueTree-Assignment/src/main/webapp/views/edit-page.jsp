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

    <title>@Edit</title>
    <style type="text/css">
      .mynavbar{
        border-bottom: 5px solid green;
        box-shadow: 0 5px 5px 9px silver;
      }
      body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-image: url("https://i.imgur.com/GMmCQHC.png");
    background-repeat: no-repeat;
    background-size: 100% 100%
}

.card {
    padding: 30px 40px;
    margin-top: 60px;
    margin-bottom: 60px;
    border: none !important;
    box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
}

.blue-text {
    color: #00BCD4
}

.form-control-label {
    margin-bottom: 0
}

input,
textarea,
button {
    padding: 8px 15px;
    border-radius: 5px !important;
    margin: 5px 0px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    font-size: 18px !important;
    font-weight: 300
}

input:focus,
textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #00BCD4;
    outline-width: 0;
    font-weight: 400
}

.btn-block {
    text-transform: uppercase;
    font-size: 15px !important;
    font-weight: 400;
    height: 43px;
    cursor: pointer
}

.btn-block:hover {
    color: #fff !important
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
}
    </style>

  <script src="https://kit.fontawesome.com/6e7b9792cc.js" crossorigin="anonymous"></script>
  </head>
  <body style="width: auto; background-color: lightcyan;">
  
    
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


<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">   
            <div class="card">
                <h5 class="text-center mb-4">EMPLOYEE FORM</h5>
                <form class="form-card" action="../editEmp/${employee.getId()}" method="POST">
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Name</label> <input type="text" id="fname" name="name" value="${employee.getName()}"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Email</label> <input type="text" id="lname" name="email" value="${employee.getEmail()}" > </div>
                    </div>
                    <div class="row justify-content-between text-left">

                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Date of birth</label> 
    <input type="date" class="form-control" name="dob" id="dob" value ="${employee.getDob()}" onchange="ageCalculator()">
                    </div>



                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Age</label> <input type="text" id="mob" name="age" value="${employee.getAge()}"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Salary</label> <input type="text" id="job" name="salary" value="${employee.getSalary()}" > </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <label class="form-control-label px-3">Status
                          <select class="custom-select" name="status" id="status" style="height: 38px; width: 100%;">
                         <option  value="${employee.isStatus() == 'false' ?0:1}" selected>${employee.isStatus() == 'true'?'ACTIVE':'INACTIVE'}</option>
                          <option value="1">Active</option>
                          <option value="0">Inactive</option>
                          </select>
                    </div>

                    <div class="text-center py-5 p-5">
                      <button type="button" onclick="history.back()" class="btn btn-warning"><i class="fa-solid fa-arrow-left"></i></button>
                      <button type="submit" class="btn btn-success">Submit</button>
                      <button type="reset" class="btn btn-danger"><i class="fa-solid fa-delete-left"></i></button>
                      
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>







   
 

<script type="text/javascript">
        function ageCalculator(){
        var today = new Date();
        var birthDate = new Date(document.getElementById("dob").value);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        // console.log(age);

       document.getElementById("age").setAttribute('value',age);
    }

      </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>