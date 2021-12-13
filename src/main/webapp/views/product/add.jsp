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
                    <label for="txtProName">TinyDes</label>
                    <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" autofocus>
                    <label for="txtProName">FullDes</label>
                    <input type="text" class="form-control" id="txtFullDes" name="FullDes" autofocus>
                    <label for="txtProName">Price</label>
                    <input type="text" class="form-control" id="txtPrice" name="Price" autofocus>
                    <label for="txtProName">PriceDifference</label>
                    <input type="text" class="form-control" id="txtPriceDifference" name="PriceDifference" autofocus>
                    <label for="txtProName">CatID</label>
                    <input type="text" class="form-control" id="txtCatID" name="CatID" autofocus>
                </div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/home/product/index" role="button">
                    << List
                </a>
                <button type="submit" class="btn btn-outline-success">Submit</button>
            </form>
        </div>
    </jsp:body>
</t:main>