<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .img-thumbnail {
        max-width: 100%;
    }

    .small-thumb {
        width: 60px;
        height: 60px;
        margin-right: 5px;
    }

    .quantity-input input {
        width: 50px;
        text-align: center;
        padding: 5px;
        font-size: 0.9rem;
    }

    .quantity-input .btn {
        width: 30px;
        padding: 5px;
        font-size: 0.9rem;
    }


</style>
<div class="container mt-5">
    <h2 class="text-dark-emphasis m-2">Product detail</h2>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <img src="/img/${product.image}" class="img-thumbnail" alt="${product.name}">
            <div class="mt-2 d-flex">
                <!-- Example thumbnails -->
                <img src="/img/${product.image}" class="img-thumbnail small-thumb" alt="Thumbnail">
                <img src="/img/${product.image}" class="img-thumbnail small-thumb" alt="Thumbnail">
                <img src="/img/${product.image}" class="img-thumbnail small-thumb" alt="Thumbnail">
            </div>
        </div>
        <div class="col-md-6">
            <h3>${product.categoryId}</h3>
            <h2>${product.name}</h2>
            <div class="d-flex align-items-center">
                <h3 class="text-danger">₫${product.price}</h3>
              </div>
            <div class="my-3">
                <span>Rating: </span><span class="text-warning">★★★★☆</span>
            </div>
            <div class="my-3">
                <h5>Transport</h5>
                <p>Order processing by hacker vuz <br>
                    Free shipping</p>
            </div>
            <div class="my-3">
                <h5>Color</h5>
                <div class="d-flex">
                    <button class="btn btn-outline-secondary mx-1">Gray</button>
                    <button class="btn btn-outline-danger mx-1">Red</button>
                    <button class="btn btn-outline-primary mx-1">Blue</button>
                    <button class="btn btn-outline-dark mx-1">Black</button>
                </div>
            </div>
            <div class="my-3">
                <button class="btn btn-warning btn-lg text-white">Add to cart</button>
                <button class="btn btn-danger btn-lg">Buy now</button>
            </div>
        </div>
    </div>
</div>