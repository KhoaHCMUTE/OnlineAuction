<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:body>
        <div class="card-body">
            <form action="" method="post">
                <div class="form-group">
                    <label for="txtProName">Product</label>
                    <input type="text" class="form-control" id="txtProName" name="ProName" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtTinyDes">TinyDes</label>
                    <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtFullDes">FullDes</label>
                    <input type="text" class="form-control" id="txtFullDes" name="FullDes" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtPrice">Price</label>
                    <input type="number" class="form-control" id="txtPrice" name="Price" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtPriceDifference">PriceDifference</label>
                    <input type="number" class="form-control" id="txtPriceDifference" name="PriceDifference" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtCatID">CatID</label>
                    <input type="number" class="form-control" id="txtCatID" name="CatID" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtPerID">PerID</label>
                    <input type="number" class="form-control" id="txtPerID" name="PerID" autofocus>
                </div>
                <div class="form-group">
                    <label for="txtUserID">UserID</label>
                    <input type="number" class="form-control" id="txtUserID" name="UserID" autofocus>
                </div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/index" role="button">
                    << List
                </a>
                <button type="submit" class="btn btn-outline-success" >Submit</button>
            </form>
        </div>
    </jsp:body>
</t:main>