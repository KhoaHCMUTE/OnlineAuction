<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <form action="" method="post">
                <h4 class="card-header">Edit #${product.proID} - ${product.proName}</h4>
                <div class="form-group">
                    <label for="txtProID"># ID</label>
                    <input type="number" class="form-control" id="txtProID" name="ProID" readonly value="${product.proID}">
                </div>
                <div class="form-group">
                    <label for="txtProName">Product</label>
                    <input type="text" class="form-control" id="txtProName" name="ProName" autofocus value="${product.proName}">
                </div>
                <div class="form-group">
                    <label for="txtTinyDes">TinyDes</label>
                    <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" autofocus value="${product.tinyDes}">
                </div>
                <div class="form-group">
                    <label for="txtFullDes">FullDes</label>
                    <input type="text" class="form-control" id="txtFullDes" name="FullDes" autofocus value="${product.fullDes}">
                </div>
                <div class="form-group">
                    <label for="txtPrice">Start Price</label>
                    <input type="number" class="form-control" id="txtPrice" name="Price" autofocus value="${product.price}">
                </div>
                <div class="form-group">
                    <label for="txtPriceDifference">Difference Price</label>
                    <input type="number" class="form-control" id="txtPriceDifference" name="PriceDifference" autofocus value="${product.priceDifference}">
                </div>
                <div class="form-group">
                    <label for="txtCatID">CatID</label>
                    <input type="number" class="form-control" id="txtCatID" name="CatID" autofocus value="${product.catID}">
                </div>
                <div class="form-group">
                    <input type="hidden" class="form-control" id="txtSellerID" name="SellerID" readonly value="${AuthUser.id}">
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/product" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/admin/product/Update" role="button">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Update
                    </button>
                    <button type="submit" class="btn btn-outline-danger" formaction="${pageContext.request.contextPath}/admin/product/Delete" role="button">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                </div>

            </form>
        </div>
    </jsp:body>

</t:main>