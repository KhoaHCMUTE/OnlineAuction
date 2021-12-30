<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.ute.onlineauction.beans.Category>"/>

<t:main>
  <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/9kosk9uxbr3p3ee6c30y8nue63sgb0asmrolu84h77a0yq54/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
      <script>
          tinymce.init({
              selector: '#txtFullDes',
              height: 450,
              plugins: 'paste image link autolink list table media',
              menubar: false,
              toolbar: [
                  'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent |table link image media'
              ],
          });
      </script>
  </jsp:attribute>
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

         <form action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
               <label for="ProID">ProID</label>
               <input type="number" class="form-control" id="ProID" name="ProID" readonly value="${MaxProID+1}">
            </div>
            <div class="form-group">
               <label for="txtProID">ProID</label>
               <input type="text" class="form-control" id="txtProID" name="txtProID" readonly value="${MaxProID+1}">
            </div>
            <div class="custom-file mb-4">
               <label for="ImageMain" class="custom-file-label">Image Main</label>
               <input type="file" class="custom-file-input" id="ImageMain" name="ImageMain">
            </div>
            <div class="custom-file mb-4">
               <label for="ImageSub1" class="custom-file-label">Image Sub 1</label>
               <input type="file" class="custom-file-input" id="ImageSub1" name="ImageSub1">
            </div>
            <div class="custom-file mb-4">
               <label for="ImageSub2" class="custom-file-label">Image Sub 2</label>
               <input type="file" class="custom-file-input" id="ImageSub2" name="ImageSub2">
            </div>
            <div class="custom-file mb-4">
               <label for="ImageSub3" class="custom-file-label">Image Sub 3</label>
               <input type="file" class="custom-file-input" id="ImageSub3" name="ImageSub3">
            </div>
            <div class="form-group">
               <label for="txtProName">Product</label>
               <input type="text" class="form-control" id="txtProName" name="ProName">
            </div>
            <div class="form-group">
               <label for="txtTinyDes">Description</label>
               <input type="text" class="form-control" id="txtTinyDes" name="TinyDes">
            </div>
            <div class="form-group">
               <label for="txtFullDes">Full Description</label>
               <textarea id="txtFullDes" name="FullDes"></textarea>
            </div>
            <div class="form-group">
               <label for="txtPrice">Price</label>
               <input type="number" class="form-control" id="txtPrice" name="Price">
            </div>
            <div class="form-group">
               <label for="txtCurrentPrice">CurrentPrice (optional)</label>
               <input type="number" class="form-control" id="txtCurrentPrice" name="CurrentPrice">
            </div>
            <div class="form-group">
               <label for="txtPriceDifference">PriceDifference</label>
               <input type="number" class="form-control" id="txtPriceDifference" name="PriceDifference">
            </div>
            <div class="form-group form-check">
                  <%--          <label for="txtCatID">CatID</label>--%>
                  <%--          <input type="number" class="form-control" id="txtCatID" name="CatID" >--%>
               <c:forEach items="${categoriesWithDetails}" var="categories">
                  <div>
                     <input type="radio" id="CatID" name="CatID" class="form-check-input" value="${categories.catID}">
                     <label for="CatID" class="form-check-label">${categories.catName}</label>
                  </div>
               </c:forEach>

            </div>
            <div class="form-group">
               <input type="hidden" class="form-control" id="txtSellerID" name="SellerID" readonly
                      value="${AuthUser.id}">
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
        <button id="btn">h</button>
      </div>
      <script>

      </script>
   </jsp:body>
</t:main>