<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>
<jsp:useBean id="listproduct" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="comment" scope="request" type="java.util.List<com.ute.onlineauction.beans.CommentPro>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="top3bid" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>


<t:main>
   <jsp:body>
      <div class="card-body">
         <div class="card border border-dark">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg"
                          alt="${product.proName}" title="${product.proName}" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                     <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub1.jpg"
                          alt="${product.proName}" title="${product.proName}" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                     <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub2.jpg"
                          alt="${product.proName}" title="${product.proName}" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                     <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub3.jpg"
                          alt="${product.proName}" title="${product.proName}" class="d-block w-100">
                  </div>
               </div>
               <button class="carousel-control-prev" type="button" data-target="#carouselExampleFade" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
               </button>
               <button class="carousel-control-next" type="button" data-target="#carouselExampleFade" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
               </button>
            </div>
         </div>

         <div class="card-body bg-light">

            <h4 class="text-dark" style="font-size:25px; ">${product.proName}</h4>
               <%--            <c:if test="${localDateNotFormatted gt product.endDay}">--%>
               <%--               <p>End</p>--%>
               <%--            </c:if>--%>
               <%--            <c:if test="${product.endDay gt localDateNotFormatted }">--%>
               <%--               <p>Not End</p>--%>
               <%--            </c:if>--%>


            <p class=" text-center" style="font-size:20px;"><b>Auction History</b></p>

            <form method="post" action="">
               <input type="hidden" class="form-control" id="ProID" name="ProID" readonly value="${product.proID}">
               <input type="hidden" class="form-control" id="SellerID" name="SellerID" readonly value="${product.userID}">
               <input type="hidden" class="form-control" id="Day" name="Day" readonly value="${localDate}">
               <input type="hidden" class="form-control" id="Confirm" name="Confirm" readonly value="1">
               <input type="hidden" class="form-control" id="Status" name="Status" readonly value="0">

               <table class="table table-hover">
                  <thead class="thead-dark">
                  <tr>
                     <th scope="col">#</th>
                     <th scope="col">Name</th>
                     <th scope="col">Price</th>
                     <th scope="col">&nbsp;</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${top3bid}" var="t">
                   <c:if test="${AuthUser.id != t.userID}">
                     <tr>
                        <th scope="row">${t.ID}</th>
                        <c:forEach items="${user}" var="u">
                           <c:if test="${t.userID == u.id}">
                        <td>${u.name}</td>
                           </c:if>
                        </c:forEach>
                        <td>${t.price}</td>
                        <td>
                           <input type="hidden" class="form-control" id="UserID" name="UserID" readonly value="${t.userID}">
                           <button type="submit" class="btn btn-outline-success"
                                   formaction="${pageContext.request.contextPath}/admin/product/sendNotify?UserID=${t.userID}"
                                   role="button">
                              <i class="fa fa-bell" aria-hidden="true"></i>
                              Send Notification
                           </button>
                        </td>
                     </tr>
                   </c:if>
                  </c:forEach>

                  </tbody>
               </table>
            </form>

         </div>

      </div>


   </jsp:body>
</t:main>