<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>

<t:main>
  <jsp:body>
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
                    <c:forEach items="${listbidding}" var="b">
                        <c:forEach items="${user}" var="u">
                            <c:if test="${b.price == Max}">
                            <c:if test="${b.proID == c.proID}" >
                                   <c:if test="${u.id == b.userID}">
                                            <p>Name Bidder: ${u.userName}</p>
                                   </c:if>
                            </c:if>
                            </c:if>
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
  </jsp:body>
</t:main>