<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row mb-3">
    <div class="col">
        <h2>${author.id == null ? 'Add New Author' : 'Edit Author'}</h2>
    </div>
</div>

<form action="${author.id == null ? '/authors' : '/authors/update/' + author.id}" method="post" class="needs-validation" novalidate>
    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" name="name" value="${author.name}" required>
    </div>
    
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" value="${author.email}" required>
    </div>
    
    <div class="mb-3">
        <label for="biography" class="form-label">Biography</label>
        <textarea class="form-control" id="biography" name="biography" rows="3">${author.biography}</textarea>
    </div>
    
    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="/authors" class="btn btn-secondary">Cancel</a>
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