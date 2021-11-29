<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Autions</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="../../partials/nav.jsp"/>
    <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-sm-2">
                <jsp:include page="../../partials/left.jsp"/>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="list-group" id="list-tab1" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-Top-list1" data-bs-toggle="list" href="#list-Top" role="tab" aria-controls="list-home">Top 5</a>
                        <a class="list-group-item list-group-item-action" id="list-A-list1" data-bs-toggle="list" href="#list-A" role="tab" aria-controls="list-profile">A</a>
                        <a class="list-group-item list-group-item-action" id="list-B-list1" data-bs-toggle="list" href="#list-B" role="tab" aria-controls="list-messages">B</a>
                        <a class="list-group-item list-group-item-action" id="list-C-list1" data-bs-toggle="list" href="#list-C" role="tab" aria-controls="list-settings">C</a>
                        <a class="list-group-item list-group-item-action" id="list-D-list1" data-bs-toggle="list" href="#list-D" role="tab" aria-controls="list-settings">D</a>
                        <a class="list-group-item list-group-item-action" id="list-E-list1" data-bs-toggle="list" href="#list-E" role="tab" aria-controls="list-settings">E</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="list-group" id="list-tab2" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-Top-list2" data-bs-toggle="list" href="#list-Top" role="tab" aria-controls="list-home">Top 5</a>
                        <a class="list-group-item list-group-item-action" id="list-A-list2" data-bs-toggle="list" href="#list-A" role="tab" aria-controls="list-profile">A</a>
                        <a class="list-group-item list-group-item-action" id="list-B-list2" data-bs-toggle="list" href="#list-B" role="tab" aria-controls="list-messages">B</a>
                        <a class="list-group-item list-group-item-action" id="list-C-list2" data-bs-toggle="list" href="#list-C" role="tab" aria-controls="list-settings">C</a>
                        <a class="list-group-item list-group-item-action" id="list-D-list2" data-bs-toggle="list" href="#list-D" role="tab" aria-controls="list-settings">D</a>
                        <a class="list-group-item list-group-item-action" id="list-E-list2" data-bs-toggle="list" href="#list-E" role="tab" aria-controls="list-settings">E</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="list-group" id="list-tab3" role="tablist">
                        <a class="list-group-item list-group-item-action active" id="list-Top-list3" data-bs-toggle="list" href="#list-Top" role="tab" aria-controls="list-home">Top 5</a>
                        <a class="list-group-item list-group-item-action" id="list-A-list3" data-bs-toggle="list" href="#list-A" role="tab" aria-controls="list-profile">A</a>
                        <a class="list-group-item list-group-item-action" id="list-B-list3" data-bs-toggle="list" href="#list-B" role="tab" aria-controls="list-messages">B</a>
                        <a class="list-group-item list-group-item-action" id="list-C-list3" data-bs-toggle="list" href="#list-C" role="tab" aria-controls="list-settings">C</a>
                        <a class="list-group-item list-group-item-action" id="list-D-list3" data-bs-toggle="list" href="#list-D" role="tab" aria-controls="list-settings">D</a>
                        <a class="list-group-item list-group-item-action" id="list-E-list3" data-bs-toggle="list" href="#list-E" role="tab" aria-controls="list-settings">E</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <footer>
        <nav aria-label="Page navigation example a">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </footer>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
            integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
            crossorigin="anonymous"></script>
</body>

</html>
