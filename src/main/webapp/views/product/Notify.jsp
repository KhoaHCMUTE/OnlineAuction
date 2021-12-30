<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="NotifyByUser" scope="request" type="java.util.List<com.ute.onlineauction.beans.AuctionNotify>"/>


<t:main>
   <jsp:body>
      <div class="card-body ">
         <div class="row ">
            <table class="table table-striped table-info">
               <thead>
               <tr>

                  <th scope="col">Product</th>
                  <th scope="col">&nbsp;</th>
                  <th scope="col">&nbsp;</th>
               </tr>
               </thead>
               <tbody>
               <c:forEach items="${NotifyByUser}" var="c">
                  <tr>
                     <td>${c.proID}</td>
                     <td>
                        <c:if test="${c.status eq 1}">
                           <p>You have win this Product and the Seller asks you to pay</p>
                        </c:if>
                        <c:if test="${c.status eq 2}">
                           <c:choose>
                              <c:when test="${AuthUser.permission eq 1 || AuthUser.permission eq 2}">
                                 <p>You receiced the responce from bidder</p>
                              </c:when>
                              <c:otherwise>
                                 <c:if test="${c.confirm eq 1}">
                                    You Argee to pay for this product
                                 </c:if>
                                 <c:if test="${c.confirm eq 2}">
                                    You decline to pay for this product
                                 </c:if>
                              </c:otherwise>
                           </c:choose>
                        </c:if>
                     </td>
                     <td>

                        <a class="btn btn-sm btn-outline-primary"
                           href="${pageContext.request.contextPath}/admin/product/PayOrNot?ProID=${c.proID}&UserID=${AuthUser.id}&NotifyID=${c.ID}"
                           role="button">
                           <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;See Detail
                        </a>

                     </td>

                  </tr>
               </c:forEach>
               </tbody>
            </table>
         </div>
      </div>


   </jsp:body>
</t:main>