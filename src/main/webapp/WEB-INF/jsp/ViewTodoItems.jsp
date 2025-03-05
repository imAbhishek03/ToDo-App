<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View ToDo Item List</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
    body {
        background: #f4f4f4;
        font-family: 'Georgia', serif;
        color: #333;
        padding: 50px 0;
    }
    .container {
        background: #fff;
        padding: 30px;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        max-width: 1000px;
        margin: auto;
        position: relative;
    }
    h1 {
        text-align: center;
        margin-bottom: 30px;
        font-weight: bold;
        color: #6c757d;
    }
    .table-hover tbody tr:hover {
        background-color: #e9ecef;
    }
    .btn a {
        color: white;
        text-decoration: none;
    }
    .btn a:hover {
        text-decoration: none;
    }
    .status-pending {
        color: red;
        font-weight: bold;
    }
    .status-completed {
        color: green;
        font-weight: bold;
    }
    .btn-add {
        position: absolute;
        top: 20px;
        right: 20px;
        background: linear-gradient(135deg, #28a745, #218838);
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: background 0.3s ease;
    }
    .btn-add:hover {
        background: linear-gradient(135deg, #218838, #1e7e34);
    }
</style>
</head>
<body>

<div class="container">
    <h1>ToDo Item List</h1>
    <button class="btn btn-add">
        <a href="/add-todo">Add New ToDo Item</a>
    </button>
    <table class="table table-striped table-hover table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Sl No</th>
                <th>Title</th>
                <th>Description</th>
                <th>Date</th>
                <th>Status</th>
                <th>Mark Completed</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="todo" items="${list}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${todo.title}</td>
                    <td>${todo.description}</td>
                    <td>${todo.date}</td>
                    <td class="${todo.status eq 'Completed' ? 'status-completed' : 'status-pending'}">${todo.status}</td>
                    <td><a href="/update-todo-status/${todo.id}" class="btn btn-success btn-sm" onclick="return confirm('Are you sure you want to mark this item as complete?')">Mark Complete</a></td>
                    <td><a href="/edit-todo/${todo.id}" class="btn btn-primary btn-sm">Edit</a></td>
                    <td><a href="/delete-todo/${todo.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this item?')">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    window.onload = function() {
        var msg = "${message}";

        if (msg === "Successfully Saved") {
            toastr.success("Item added successfully!!");
        } else if (msg === "Successfully Deleted") {
            toastr.success("Item deleted successfully!!");
        } else if (msg === "Delete Failed") {
            toastr.error("Some error occurred, couldn't delete item");
        } else if (msg === "Successfully Updated") {
            toastr.success("Item updated successfully!!");
        }

        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "5000",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    };
</script>

</body>
</html>