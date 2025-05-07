<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row mb-3">
    <div class="col">
        <h2>Authors</h2>
    </div>
    <div class="col text-end">
        <a href="/authors/new" class="btn btn-primary">Add New Author</a>
    </div>
</div>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Biography</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${authors}" var="author">
                <tr>
                    <td>${author.name}</td>
                    <td>${author.email}</td>
                    <td>${author.biography}</td>
                    <td>
                        <a href="/authors/edit/${author.id}" class="btn btn-sm btn-warning">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div> 