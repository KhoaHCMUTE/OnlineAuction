<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <div class="card-header d-flex justify-content-between">
                <h4>Products</h4>
                <a class="btn btn-outline-primary align-items-end" href="${pageContext.request.contextPath}/product/add" role="button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Add</a>
            </div>
            <c:choose>
                <c:when test="${product.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">No Data.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row ">
                            <c:forEach items="${product}" var="c">
                                <div class="col-sm-4 mb-3 ">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.proID}/main.jpg" alt="${c.proName}" title="${c.proName}" class="card-img-top">
                                        <div class="card-body">
                                            <h5 class="card-title">${c.proName}</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">${c.price}</h6>
                                            <p class="card-text">${c.tinyDes}</p>
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}" role="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;Detail</a>
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/product/edit?id=${c.proID}" role="button"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;Edit</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:main>