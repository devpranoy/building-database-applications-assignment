<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row mb-3">
    <div class="col">
        <h2>Books</h2>
    </div>
    <div class="col text-end">
        <a href="/books/new" class="btn btn-primary">Add New Book</a>
    </div>
</div>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Price</th>
                <th>Publication Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.isbn}</td>
                    <td>${book.author.name}</td>
                    <td>${book.price}</td>
                    <td>${book.publicationDate}</td>
                    <td>
                        <a href="/books/edit/${book.id}" class="btn btn-sm btn-warning">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div> 