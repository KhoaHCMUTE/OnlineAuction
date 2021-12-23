<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="bindding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <h4 class="card-header">
                Products
            </h4>
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
                                            <c:forEach items="${bindding}" var="b">
                                                <c:forEach items="${user}" var="u">
                                                    <c:choose>
                                                        <c:when test="${b.proID == c.proID}" >
                                                            <c:choose>
                                                                <c:when test="${u.id == b.userID}" >
                                                                    <p>Name Bidder: ${u.userName}</p>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:forEach>
                                            <p class="card-text">${c.tinyDes}</p>
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}" role="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;Detail</a>
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