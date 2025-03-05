<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit ToDo Item</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
    body {
        background: linear-gradient(135deg, #007BFF, #FFC107, #FF5733, #17A2B8);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    .container {
        padding: 40px;
        width: 50%;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    }
    h1 {
        text-align: center;
        margin-bottom: 30px;
        font-weight: bold;
        color: #007BFF;
    }
    label {
        font-weight: bold;
        color: #333;
    }
    button {
        padding: 10px 20px;
        border-radius: 10px;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }
    .btn-success {
        background-color: #007BFF;
        border: none;
    }
    .btn-success:hover {
        background-color: #0056b3;
    }
    .btn-secondary {
        background-color: #FF5733;
        border: none;
    }
    .btn-secondary:hover {
        background-color: #C70039;
    }
    #description {
        height: 80px;
        resize: none;
    }
</style>
</head>
<body>

<div class="container">

    <h1>Edit ToDo Item</h1>

    <form:form action="/edit-save-todo" method="post" modelAttribute="todo">
        <form:input path="id" type="hidden" />

        <div class="form-group">
            <label for="title">Title</label>
            <form:input type="text" path="title" id="title" class="form-control" required="required" />
        </div>
        
        <div class="form-group">
            <label for="description">Description</label>
            <form:textarea path="description" id="description" class="form-control" required="required" />
        </div>

        <div class="form-group">
            <label for="date">Date</label>
            <form:input type="date" path="date" id="date" class="form-control" required="required" value="${todo.date}" />
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <form:input type="text" path="status" id="status" class="form-control" value="Pending" readonly="true"/>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-success">Save</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='/view-todo'">Cancel</button>
            <button type="button" class="btn btn-info" onclick="changeBackground()">Change Background</button>
        </div>

    </form:form>

</div>

<script>
    function changeBackground() {
        const colors = ["#007BFF", "#FFC107", "#FF5733", "#17A2B8", "#6C757D"];
        let randomColor = colors[Math.floor(Math.random() * colors.length)];
        document.body.style.background = randomColor;
    }

    window.onload = function() {
        var msg = "${message}";
        if (msg == "Update Failed") {
            toastr.error("Something went wrong with the edit.");
        }

        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "5000"
        };
    }
</script>

</body>
</html>