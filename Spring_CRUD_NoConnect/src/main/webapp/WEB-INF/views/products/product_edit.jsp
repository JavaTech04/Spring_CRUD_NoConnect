<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${error}">
    <script>
        swal("Error!", "Please check the data again!", "error");
    </script>
</c:if>
<h2 class="text-dark-emphasis text-uppercase mb-3">${title} product</h2>
<hr>
<form:form modelAttribute="product" action="${action}" enctype="multipart/form-data" method="post">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <form:select path="categoryId" items="${category}" itemValue="name" itemLabel="name"
                             cssClass="form-select w-25"/>
                <form:errors path="categoryId" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="name"/>
                    <label for="name">Name</label>
                </div>
                <form:errors path="name" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3">
                <div class="form-floating">
                    <form:input path="price" type="number" class="form-control" id="price" placeholder="price"/>
                    <label for="price">Price</label>
                </div>
                <form:errors path="price" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3" id="container-input-image">
                <input name="__" type="file" class="mt-2 form-control" id="imageInput"/>
                <form:errors path="image" cssClass="text-danger" element="label"/>
            </div>
            <div class="mb-3">
                <div class="form-check">
                    <form:checkbox path="available" class="form-check-input" value="true" id="available"/>
                    <label class="form-check-label" for="available">
                        Available
                    </label>
                </div>
            </div>
            <div class="d-flex justify-content-start align-items-center w-25">
                <button class="btn btn-primary fw-semibold m-2">Save</button>
                <a href="/product" class="btn btn-danger fw-semibold">Cancel</a>
            </div>
        </div>
        <div class="col-3 d-flex justify-content-center align-items-baseline">
            <img src="/img/${not empty product.image ? product.image : "blank.png"}" alt="image" width="60%"
                 class="rounded mx-auto d-block" id="imagePreview">
        </div>
    </div>
</form:form>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const containerInputImage = document.getElementById('container-input-image');
    const imageInput = document.getElementById('imageInput');
    const imagePreview = document.getElementById('imagePreview');
    const nameInput = document.getElementById("name")
    const priceInput = document.getElementById("price")
    const categoryId = document.getElementById("categoryId")

    const checkInputs = () => {
        const nameIsValid = nameInput.value.trim() !== '';
        const priceIsValid = priceInput.value.trim() !== '' && parseFloat(priceInput.value.trim()) > 0;
        const categoryIsValid = categoryId.value !== 'Please select a category'
        if (nameIsValid && priceIsValid && categoryIsValid) {
            containerInputImage.style.display = '';
        } else {
            containerInputImage.style.display = 'none';
        }
    }

    checkInputs();
    nameInput.addEventListener('input', checkInputs);
    priceInput.addEventListener('input', checkInputs);
    categoryId.addEventListener('change', checkInputs);

    imageInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
</script>