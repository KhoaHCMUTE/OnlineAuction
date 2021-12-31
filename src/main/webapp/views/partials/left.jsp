<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.ute.onlineauction.beans.Category>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>

<div class="card text-white bg-info border border-dark">
  <h4 class="card-header"><i class="fa fa-bars" aria-hidden="true"></i> Menu</h4>
  <div class="list-group">
    <a href="${pageContext.request.contextPath}/admin/category/index">
      <button type="button" class="list-group-item list-group-item-action"><i class="fa fa-list" aria-hidden="true"></i> Category</button>
    </a>
    <a href="${pageContext.request.contextPath}/admin/product/index">
      <button type="button" class="list-group-item list-group-item-action"><i class="fa fa-list" aria-hidden="true"></i> Product</button>
    </a>
    <c:forEach items="${categoriesWithDetails}" var="c">
      <a href="${pageContext.request.contextPath}/product/bycat?id=${c.catID}"
         class="list-group-item list-group-item-action">
        <i class="fa fa-caret-right" aria-hidden="true"></i>
          ${c.catName}
      </a>
    </c:forEach>
    <c:if test="${AuthUser.permission == 2 || AuthUser.permission == 1}">
    <a href="${pageContext.request.contextPath}/product/byUserID?userid=${AuthUser.id}"
       class="list-group-item list-group-item-action">
      <i class="fa fa-caret-right" aria-hidden="true"></i>
      Product is purchased
    </a>
      <a href="${pageContext.request.contextPath}/seller/byUserid?userid=${AuthUser.id}"
         class="list-group-item list-group-item-action">
        <i class="fa fa-caret-right" aria-hidden="true"></i>
        Product is end
      </a>
    <a href="${pageContext.request.contextPath}/seller/byUserID?userid=${AuthUser.id}"
       class="list-group-item list-group-item-action">
      <i class="fa fa-caret-right" aria-hidden="true"></i>
      Products still on auction
    </a>
    </c:if>
    <a href="${pageContext.request.contextPath}/bider/byUserID?userid=${AuthUser.id}"
       class="list-group-item list-group-item-action">
      <i class="fa fa-caret-right" aria-hidden="true"></i>
      BidingList
    </a>
    <a href="${pageContext.request.contextPath}/bider/byuserID?userid=${AuthUser.id}"
       class="list-group-item list-group-item-action">
      <i class="fa fa-caret-right" aria-hidden="true"></i>
      WonList
    </a>
  </div>
</div>