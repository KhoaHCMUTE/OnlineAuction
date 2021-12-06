<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="category" scope="request" type="com.ute.onlineauction.beans.Category"/>

<t:main>
  <jsp:body>
    <div class="card-body">
      <form action="" method="post">
        <h4 class="card-header">Edit #${category.catID} - ${category.catName}</h4>
        <div class="form-group">
          <label for="txtCatID"># ID</label>
          <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="${category.catID}">
        </div>
        <div class="form-group">
          <label for="txtCatName">Category</label>
          <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus value="${category.catName}">
        </div>
        <div class="card-footer">
          <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/home/category/" role="button">
            <i class="fa fa-backward" aria-hidden="true"></i>
            List
          </a>
          <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/home/category/Update" role="button">
            <i class="fa fa-check" aria-hidden="true"></i>
            Update
          </button>
          <button type="submit" class="btn btn-outline-danger" formaction="${pageContext.request.contextPath}/home/category/Delete" role="button">
            <i class="fa fa-trash" aria-hidden="true"></i>Delete
          </button>
        </div>

      </form>
    </div>
  </jsp:body>

</t:main>