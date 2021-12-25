<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.onlineauction.beans.Category>"/>
<t:main>
  <jsp:body>
    <div class="card-body ">
      <c:set var="STT" scope="session" value="${1}"/>
      <table class="table table-striped table-light">
        <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Product Type</th>
          <th scope="col">
            <a  id="" class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/category/add" role="button">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </a>
          </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categories}" var="c">
          <tr>
            <th scope="row">${STT}</th>
            <td>${c.catName}</td>
            <td>
              <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/admin/category/edit?id=${c.catID}" role="button">
                <i class="fa fa-pencil" aria-hidden="true"></i>
              </a>
            </td>
            <c:set var="STT" scope="session" value="${STT+1}"/>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </jsp:body>
</t:main>