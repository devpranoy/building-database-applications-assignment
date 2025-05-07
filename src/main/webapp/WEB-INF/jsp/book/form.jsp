<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="formAction" value="/books"/>
<c:if test="${not empty book.id}">
    <c:set var="formAction" value="/books/update/${book.id}"/>
</c:if>

<div class="row mb-3">
    <div class="col">
        <h2>${book.id == null ? 'Add New Book' : 'Edit Book'}</h2>
    </div>
</div>

<form action="${formAction}" method="post" class="needs-validation" novalidate>
    <div class="mb-3">
        <label for="title" class="form-label">Title</label>
        <input type="text" class="form-control" id="title" name="title" value="${book.title}" required>
    </div>
    
    <div class="mb-3">
        <label for="isbn" class="form-label">ISBN</label>
        <input type="text" class="form-control" id="isbn" name="isbn" value="${book.isbn}" required>
    </div>
    
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea class="form-control" id="description" name="description" rows="3">${book.description}</textarea>
    </div>
    
    <div class="mb-3">
        <label for="price" class="form-label">Price</label>
        <input type="number" step="0.01" class="form-control" id="price" name="price" value="${book.price}" required>
    </div>
    
    <div class="mb-3">
        <label for="publicationDate" class="form-label">Publication Date</label>
        <input type="date" class="form-control" id="publicationDate" name="publicationDate" value="${book.publicationDate}">
    </div>
    
    <div class="mb-3">
        <label for="author" class="form-label">Author</label>
        <select class="form-select" id="author" name="author.id" required>
            <option value="">Select an author</option>
            <c:forEach items="${authors}" var="author">
                <option value="${author.id}" <c:if test="${not empty book.author and book.author.id == author.id}">selected</c:if>>
                    ${author.name}
                </option>
            </c:forEach>
        </select>
    </div>
    
    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="/books" class="btn btn-secondary">Cancel</a>
    </div>
</form>

<script>
(function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})()
</script> 