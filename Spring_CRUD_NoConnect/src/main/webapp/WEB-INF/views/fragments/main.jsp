<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .product-card {
        width: 100%; /* Adjusted to use full width within the column */
        border: 1px solid #e0e0e0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        position: relative;
    }

    .product-card .choice-label {
        position: absolute;
        top: 10px;
        left: 10px;
        padding: 2px 8px;
        font-size: 12px;
        border-radius: 4px;
    }

    .product-card img {
        width: 100%;
        height: 200px; /* Set a fixed height for the image container */
        object-fit: cover; /* Ensure the image covers the container while maintaining aspect ratio */
    }

    .product-card .card-body {
        padding: 15px;
    }

    .product-card .price {
        font-size: 1.2rem;
        color: #ff424e;
    }

    .product-card .price .original-price {
        text-decoration: line-through;
        color: #999;
        margin-left: 10px;
    }

    .product-card .price .discount {
        color: #ff424e;
        margin-left: 10px;
    }

    .product-card .rating {
        color: #ff9529;
        margin-right: 10px;
    }

    .product-card .sold {
        color: #757575;
    }

    .product-card .location {
        color: #757575;
        font-size: 0.9rem;
    }
    #card-border{
        text-decoration: none;
        border: 2px solid #ffff;
    }
    #card-border:hover{
        border: 2px solid #ff9529;
    }
</style>
<h2 class="text-dark-emphasis m-2">Home</h2>
<hr>
<form id="searchForm" action="/" method="get">
    <div class="mb-3 d-flex justify-content-end">
        <input
                type="search" class="form-control w-25"
                placeholder="Search for name and category..." name="q"
                value="${q}">
    </div>
</form>
<div class="row">
    <c:forEach var="prd" items="${products}">
        <div class="col-md-3 mt-4">
            <a href="/${prd.id}" class="card product-card" id="card-border">
                <div class="card-header text-white bg-danger choice-label">Choice</div>
                <img src="/img/${prd.image}" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">${prd.name}</h5>
                    <p class="price">
                        <span class="current-price">$${prd.price}</span>
                    </p>
                    <p class="card-text">
                        <span class="rating">★★★★★</span>
                    </p>
                </div>
            </a>
        </div>
    </c:forEach>
</div>
