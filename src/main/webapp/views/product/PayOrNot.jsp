<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>
<jsp:useBean id="listproduct" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="comment" scope="request" type="java.util.List<com.ute.onlineauction.beans.CommentPro>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="bid" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="NotifyByID" scope="request" type="java.util.List<com.ute.onlineauction.beans.AuctionNotify>"/>


<t:main>
   <jsp:body>
      <div class="card-body ">
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
      <div class="card-body bg-light">
         <h4 class="text-dark" style="font-size:25px; ">${product.proID}</h4>

<%--         <input type="hidden" class="form-control" id="ProID" name="ProID" readonly value="${product.proID}">--%>
<%--         <input type="hidden" class="form-control" id="SellerID" name="SellerID" readonly value="${product.userID}">--%>
<%--         <input type="hidden" class="form-control" id="Day" name="Day" readonly value="${localDate}">--%>

         <form method="post" action="">
            <input type="hidden" class="form-control" id="ProID" name="ProID" readonly value="${product.proID}">
            <input type="hidden" class="form-control" id="SellerID" name="SellerID" readonly value="${product.userID}">
            <input type="hidden" class="form-control" id="Day" name="Day" readonly value="${localDate}">
            <table class="table">
               <c:forEach items="${NotifyByID}" var="NotifyByID">
                  <c:forEach items="${bid}" var="bid">
                     <tr>
                        <td class="col-sm-4">Would you like to pay: ${bid.price}</td>
                        <td class="align-items-center">
                           <div>
                              <input type="radio" id="Pay" name="PayOrNot" value="1">
                              <label for="Pay">Pay</label>
                              <br>
                              <input type="radio" id="No" name="PayOrNot" value="2">
                              <label for="No">No</label>
                           </div>
                        </td>
                        <td>&nbsp;</td>
                     </tr>
                     <tr>
                        <td>Do you like the seller ${product.userID}</td>
                        <td class="align-items-center">
                           <div>
                              <input type="radio" id="Like" name="LikeOrNot" value="1">
                              <label for="Like">Like</label>
                              <br>
                              <input type="radio" id="NoLike" name="LikeOrNot" value="0">
                              <label for="NoLike">No</label>
                           </div>
                        </td>
                        <td>
                           Leave comment
                           <br>
                           <input class="form-control" type="text" name="Comment">
                        </td>
                     </tr>
                     <tr>
                        <td>&nbsp;</td>
                        <td class="align-items-center">
                           &nbsp;
                        </td>
                        <td>
                           <button type="submit" class="btn btn-outline-primary" formaction="${pageContext.request.contextPath}/admin/product/LikeOrNot?UserID=${bid.userID}&ProID=${bid.proID}&NotifyID=${NotifyByID.ID}" role="button"><i class="fa fa-check" aria-hidden="true"></i> Send Detail</button>
                        </td>
                     </tr>
                  </c:forEach>
               </c:forEach>

            </table>

         </form>

         <c:set var="GIOIHAN" scope="session" value="${1}"/>

            <%--                        <label for="CommentID">Comment</label>--%>
            <%--                        <input type="text" class="form-control" id="CommentID" name="comment">--%>
            <%--                        <button type="submit" class="btn btn-outline-primary btn-sm w-25" formaction="${pageContext.request.contextPath}/admin/product/addCommentPro" role="button">Comment</button>--%>
            <%--                        <div class="card">--%>
            <%--                            <div class="card-body">--%>
            <%--                                <c:forEach items="${comment}" var="c">--%>
            <%--                                <c:forEach items="${user}" var="u">--%>
            <%--                                    <c:choose>--%>
            <%--                                        <c:when test="${c.userID == u.id}">--%>
            <%--                                    <p>User Name:${u.userName}</p>--%>
            <%--                                    <p>Comment:${c.text}</p>--%>
            <%--                                    </br>--%>
            <%--                                        </c:when>--%>
            <%--                                    </c:choose>--%>
            <%--                                </c:forEach>--%>
            <%--                                </c:forEach>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </form>--%>
            <%--                </div>--%>
            <%--            </div>--%>
         </form>
      </div>
      <script>


      </script>

   </jsp:body>
</t:main>