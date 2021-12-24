<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<t:main>
    <jsp:body>
        <a  id="" class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/product/add" role="button">
            <i class="fa fa-plus" aria-hidden="true"></i>
            Add Product
        </a>
        <div class="card-body">
            <div class="row ">
                <c:forEach items="${product}" var="c">
                    <div class="col-sm-4 mb-3 ">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.proID}/main.jpg" alt="${c.proName}" title="${c.proName}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${c.proName}</h5>
                                <c:set var = "Max" scope = "session" value = "${0}"/>
                                <c:forEach items="${listbidding}" var="b">
                                    <c:if test="${b.proID == c.proID}">
                                        <c:if test="${Max < b.price}">
                                            <c:set var = "Max" scope = "session" value = "${b.price}"/>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                <h6 class="card-subtitle mb-2 text-muted">${Max}</h6>
                                <c:choose>
                                    <c:when test="${c.currentPrice != 0}">
                                        <p class="card-text">Current Price: ${c.currentPrice}</p>
                                    </c:when>
                                </c:choose>
                                <c:set var = "Number" scope = "session" value = "${-1}"/>
                                <c:forEach items="${listbidding}" var="b">
                                    <c:if test="${b.proID == c.proID}">
                                        <c:set var = "Number" scope = "session" value ="${Number+1}"/>
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${Number != 0}">
                                        <p class="card-text">Number Of Bids: ${Number}</p>
                                        <c:forEach items="${listbidding}" var="b">
                                            <c:forEach items="${user}" var="u">
                                                <c:if test="${b.price == Max}">
                                                    <c:if test="${b.proID == c.proID}" >
                                                        <c:if test="${u.id == b.userID}">
                                                            <p>Name Bidder With The Highest Bid: ${u.userName}</p>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="card-text">No One Bid Yet</p>
                                    </c:otherwise>
                                </c:choose>
                                <p class="card-text">Start Day: ${c.startDay}</p>
                                <p class="card-text">${c.tinyDes}</p>
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/edit?id=${c.proID}" role="button"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;Edit</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>