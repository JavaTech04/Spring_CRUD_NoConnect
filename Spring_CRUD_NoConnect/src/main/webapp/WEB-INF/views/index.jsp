<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CapX brand</title>
    <link rel="icon"
          href="https://raw.githubusercontent.com/VuScriptMasterForge/Tutorial-Spring-Boot-CRUD-Full-Stack-Application/1b649517ebde0688e9bc833d65cc2ced2c92f642/Tutorial-FullStack/tutorial-fullstack/src/logo.svg  "
          type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="assert/css/app.css" type="text/css">
</head>
<body class="bg-dark-subtle">
<jsp:include page="fragments/navbar.jsp"/>
<div class="container shadow p-3 mb-5 bg-body-tertiary rounded border mt-5">
    <jsp:include page="${fragment}"/>
</div>
<footer class="position-fixed d-flex align-items-center bottom-0">
    <jsp:include page="fragments/footer.jsp"/>
</footer>
</body>
</html>
