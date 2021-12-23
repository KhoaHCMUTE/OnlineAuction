<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <c:set var = "MaxProID" scope = "session" value = "${0}"/>
            <c:forEach items="${product}" var="c">
                <c:choose>
                    <c:when test="${c.proID != null}">
                    <c:if test="${MaxProID < c.proID}">
                        <c:set var = "MaxProID" scope = "session" value = "${c.proID}"/>
                    </c:if>
                    </c:when>
                    <c:otherwise>
                        <c:set var = "MaxProID" scope = "session" value = "${1}"/>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <form action="" method="post">
                <div class="form-group">
                    <label for="ProID">ProID</label>
                    <input type="number" class="form-control" id="ProID" name="ProID" readonly value="${MaxProID+1}">
                </div>
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
                <div class="form-group">
                    <label for="txtSellerID">SellerID</label>
                    <input type="number" class="form-control" id="txtSellerID" name="SellerID" autofocus>
                </div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/index" role="button">
                    << List
                </a>
                <button type="submit" class="btn btn-outline-success" >Submit</button>
            </form>
        </div>
    </jsp:body>
</t:main>