<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>


<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <form action="" method="post">
                <h4 class="card-header">Edit #${product.proID} - ${product.proName}</h4>
                <div class="form-group">
                    <input type="hidden" class="form-control border border-dark" id="txtProID" name="ProID" readonly value="${product.proID}">
                </div>
                <div class="form-group">
                    <label for="txtCatID"><b>CatID</b></label>
                    <input type="number" class="form-control border border-dark" id="txtCatID" name="CatID"  value="${product.catID}">
                </div>
                <div class="form-group">
                    <label for="txtProName"><b>Product</b></label>
                    <input type="text" class="form-control border border-dark" id="txtProName" name="ProName"  value="${product.proName}">
                </div>
                <div class="form-group">
                    <label for="txtTinyDes"><b>TinyDes</b></label>
                    <input type="text" class="form-control border border-dark" id="txtTinyDes" name="TinyDes"  value="${product.tinyDes}">
                </div>
                <div class="form-group">
                    <label for="txtFullDes"><b>FullDes</b></label>
                    <input type="text" class="form-control border border-dark" id="txtFullDes" name="FullDes"  value="${product.fullDes}">
                </div>
                <div class="form-group">
                    <label for="txtPrice"><b>Start Price</b>></label>
                    <input type="number" class="form-control border border-dark" id="txtPrice" name="Price"  value="${product.price}">
                </div>
                <div class="form-group">
                    <label for="txtCurrentPrice"><b>CurrentPrice</b> </label>
                    <input type="number" class="form-control border border-dark" id="txtCurrentPrice" name="CurrentPrice"  value="${product.currentPrice}">
                </div>
                <div class="form-group">
                    <label for="txtPriceDifference"><b>Difference Price</b></label>
                    <input type="number" class="form-control border border-dark" id="txtPriceDifference" name="PriceDifference"  value="${product.priceDifference}">
                </div>
                <div class="form-group">
                    <label for="txtStartDay"><b>Start Day</b></label>
                    <input type="text" class="form-control border border-dark" id="txtStartDay" name="StartDay" value="${product.startDay}">
                </div>
                <div class="form-group">
                    <label for="txtEndDay"><b>End Day</b></label>
                    <input type="text" class="form-control border border-dark" id="txtEndDay" name="EndDay" value="${product.endDay}">
                </div>
                <div class="form-group">
                    <input type="hidden" class="form-control border border-dark" id="txtSellerID" name="SellerID" readonly value="${AuthUser.id}">
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
                        <fmt:parseDate  value="${product.endDay}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
                        <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy" var="stdDatum" />
                    </button>
                </div>

            </form>
        </div>
    </jsp:body>

</t:main>