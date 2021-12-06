<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:main>
  <jsp:body>
    <div class="card-body">
      <form action="" method="post">
        <div class="form-group">
          <label for="txtCatName">Category</label>
          <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/home/category/" role="button">
          << List
        </a>
        <button type="submit" class="btn btn-outline-success">Submit</button>
      </form>
    </div>
  </jsp:body>

</t:main>