<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<t:main>
  <jsp:body>
    <div class="card-body">
      <c:set var="MaxProID" scope="session" value="${0}"/>
      <c:forEach items="${product}" var="c">
        <c:choose>
          <c:when test="${c.proID != null}">
            <c:if test="${MaxProID < c.proID}">
              <c:set var="MaxProID" scope="session" value="${c.proID}"/>
            </c:if>
          </c:when>
          <c:otherwise>
            <c:set var="MaxProID" scope="session" value="${1}"/>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <form action="" method="post">
        <div class="form-group">
          <label for="ProID">ProID</label>
          <input type="number" class="form-control" id="ProID" name="ProID" readonly value="${MaxProID+1}">
        </div>
        <div class="form-group">
          <label for="txtProName">Product</label>
          <input type="text" class="form-control" id="txtProName" name="ProName" >
        </div>
        <div class="form-group">
          <label for="txtTinyDes">TinyDes</label>
          <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" >
        </div>
        <div class="form-group">
          <label for="txtFullDes">FullDes</label>
          <input type="text" class="form-control" id="txtFullDes" name="FullDes" >
        </div>
        <div class="form-group">
          <label for="txtPrice">Price</label>
          <input type="number" class="form-control" id="txtPrice" name="Price" >
        </div>
        <div class="form-group">
          <label for="txtCurrentPrice">CurrentPrice (optional)</label>
          <input type="number" class="form-control" id="txtCurrentPrice" name="CurrentPrice" >
        </div>
        <div class="form-group">
          <label for="txtPriceDifference">PriceDifference</label>
          <input type="number" class="form-control" id="txtPriceDifference" name="PriceDifference" >
        </div>
        <div class="form-group">
          <label for="txtCatID">CatID</label>
          <input type="number" class="form-control" id="txtCatID" name="CatID" >
        </div>
        <div class="form-group">
          <input type="hidden" class="form-control" id="txtSellerID" name="SellerID" readonly value="${AuthUser.id}">
        </div>
        <div class="form-group">
          <label for="txtStartDay">Start Day</label>
          <input type="text" class="form-control" id="txtStartDay" name="StartDay">
        </div>
        <div class="form-group">
          <label for="txtEndDay">End Day</label>
          <input type="text" class="form-control" id="txtEndDay" name="EndDay">
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/index" role="button">
          << List
        </a>
        <button type="submit" class="btn btn-outline-success">Submit</button>
      </form>
    </div>
    <script>
        $('#txtStartDay').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });

        $('#txtEndDay').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });
    </script>

  </jsp:body>
</t:main>