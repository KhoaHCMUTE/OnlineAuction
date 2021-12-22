<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.ute.onlineauction.beans.Category>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>

<div class="card">
  <h4 class="card-header">OPTION</h4>
  <div class="list-group">
    <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
      Category
    </button>
    <a href="${pageContext.request.contextPath}/admin/category/index">
      <button type="button" class="list-group-item list-group-item-action">Iphone</button>
    </a>
    <a href="${pageContext.request.contextPath}/admin/product/index">
      <button type="button" class="list-group-item list-group-item-action">Laptop</button>
    </a>
    <a href="${pageContext.request.contextPath}/admin/product/vwAll">
      <button type="button" class="list-group-item list-group-item-action">Laptop</button>
    </a>
    <button type="button" class="list-group-item list-group-item-action" disabled>A disabled button
      item
    </button>
  </div>
  <div class="list-group list-group-flush">
    <c:forEach items="${categoriesWithDetails}" var="c">
      <a href="${pageContext.request.contextPath}/product/bycat?id=${c.catID}"
         class="list-group-item list-group-item-action">
        <i class="fa fa-caret-right" aria-hidden="true"></i>
          ${c.catName}
      </a>
    </c:forEach>
    <a href="${pageContext.request.contextPath}/product/byUserID?userid=${AuthUser.id}"
       class="list-group-item list-group-item-action">
      <i class="fa fa-caret-right" aria-hidden="true"></i>
      My Product ${AuthUser.id}
    </a>
  </div>
</div>