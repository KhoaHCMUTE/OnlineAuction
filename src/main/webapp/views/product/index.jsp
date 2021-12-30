<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>

<t:main>
    <jsp:body>
        <c:choose>
            <c:when test="${Auth}">
                <c:if test="${AuthUser.permission eq 1 || AuthUser.permission eq 2}">
                    <div class="card-header">
                        <a  id="" class="btn btn-outline-success " href="${pageContext.request.contextPath}/admin/product/add" role="button">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                            Add Product
                        </a>
                    </div>

                </c:if>
                <div class="card-body">
                    <div class="row ">
                        <c:forEach items="${product}" var="c">
                            <div class="col-sm-4 mb-3 ">
                                <div class="card bg-light border border-dark">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.proID}/main.jpg" alt="${c.proName}" title="${c.proName}" class="card-img-top">
                                    <div class="card-body">
                                        <a href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}"
                                           class="text-dark" style="font-size:25px; ">${c.proName}</a>
                                        <c:set var = "Max" scope = "session" value = "${0}"/>
                                        <c:forEach items="${listbidding}" var="b">
                                            <c:if test="${b.proID == c.proID}">
                                                <c:if test="${Max < b.price}">
                                                    <c:set var = "Max" scope = "session" value = "${b.price}"/>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                        <h6 class="card-subtitle mb-2 text-dark" style="font-size:40px;">$ ${Max}</h6>
                                        <c:choose>
                                            <c:when test="${c.currentPrice != 0}">
                                                <p class="card-text"><b>Buy Now Price:</b><p class="card-subtitle mb-2 text-dark" style="font-size:20px;"> $ ${c.currentPrice}</p></p>
                                            </c:when>
                                        </c:choose>
                                        <c:set var = "Number" scope = "session" value = "${-1}"/>
                                        <c:forEach items="${listbidding}" var="b">
                                            <c:if test="${b.proID == c.proID}">
                                                <c:set var = "Number" scope = "session" value ="${Number+1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:set var = "Bienthu" scope = "session" value = "${0}"/>
                                        <c:choose>
                                            <c:when test="${Number != 0}">
                                                <p class="card-text"><b>Number Of Bids:</b> ${Number}</p>
                                                <c:forEach items="${listbidding}" var="b">
                                                    <c:forEach items="${user}" var="u">
                                                        <c:if test="${b.price == Max}">
                                                            <c:if test="${b.proID == c.proID}" >
                                                                <c:if test="${u.id == b.userID}">
                                                                    <c:if test="${Bienthu==0}">
                                                                        <p><b>Name Bidder:</b> ${u.name}</p>
                                                                        <c:set var = "Bienthu" scope = "session" value = "${1}"/>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="card-text"><b>No One Bid Yet</b></p>
                                            </c:otherwise>
                                        </c:choose>
                                        <p class="card-text"><b>Start Day:</b> ${c.startDay}</p>
                                        <p class="card-text">${c.tinyDes}</p>
                                        <c:choose>
                                            <c:when test="${AuthUser.permission == 1}">
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/edit?id=${c.proID}" role="button"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;Edit</a>
                                            </c:when>
                                            <c:otherwise>
                                                <div>&nbsp;</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
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
            </c:when>
            <c:otherwise>
                <%--            <a  id="" class="btn btn-outline-success " href="${pageContext.request.contextPath}/admin/product/add" role="button">--%>
                <%--                <i class="fa fa-plus" aria-hidden="true"></i>--%>
                <%--                Add Product--%>
                <%--            </a>--%>
                <div class="card-body">
                    <div class="row ">
                        <c:forEach items="${product}" var="c">
                            <div class="col-sm-4 mb-3 ">
                                <div class="card bg-light border border-dark">
                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.proID}/main.jpg" alt="${c.proName}" title="${c.proName}" class="card-img-top">
                                    <div class="card-body">
                                        <a href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}"
                                           class="text-dark" style="font-size:25px; ">${c.proName}</a>
                                        <c:set var = "Max" scope = "session" value = "${0}"/>
                                        <c:forEach items="${listbidding}" var="b">
                                            <c:if test="${b.proID == c.proID}">
                                                <c:if test="${Max < b.price}">
                                                    <c:set var = "Max" scope = "session" value = "${b.price}"/>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                        <h6 class="card-subtitle mb-2 text-dark" style="font-size:40px;">$ ${Max}</h6>
                                        <c:choose>
                                            <c:when test="${c.currentPrice != 0}">
                                                <p class="card-text"><b>Buy Now Price:</b><p class="card-subtitle mb-2 text-dark" style="font-size:20px;"> $ ${c.currentPrice}</p></p>
                                            </c:when>
                                        </c:choose>
                                        <c:set var = "Number" scope = "session" value = "${-1}"/>
                                        <c:forEach items="${listbidding}" var="b">
                                            <c:if test="${b.proID == c.proID}">
                                                <c:set var = "Number" scope = "session" value ="${Number+1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:set var = "Bienthu" scope = "session" value = "${0}"/>
                                        <c:choose>
                                            <c:when test="${Number != 0}">
                                                <p class="card-text"><b>Number Of Bids:</b> ${Number}</p>
                                                <c:forEach items="${listbidding}" var="b">
                                                    <c:forEach items="${user}" var="u">
                                                        <c:if test="${b.price == Max}">
                                                            <c:if test="${b.proID == c.proID}" >
                                                                <c:if test="${u.id == b.userID}">
                                                                    <c:if test="${Bienthu==0}">
                                                                        <p><b>Name Bidder:</b> ${u.userName}</p>
                                                                        <c:set var = "Bienthu" scope = "session" value = "${1}"/>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="card-text"><b>No One Bid Yet</b></p>
                                            </c:otherwise>
                                        </c:choose>
                                        <p class="card-text"><b>Start Day:</b> ${c.startDay}</p>
                                        <p class="card-text">${c.tinyDes}</p>
                                            <%--                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/edit?id=${c.proID}" role="button"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;Edit</a>--%>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
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
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:main>