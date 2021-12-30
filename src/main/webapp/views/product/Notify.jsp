<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="NotifyByUser" scope="request" type="java.util.List<com.ute.onlineauction.beans.AuctionNotify>"/>
<jsp:useBean id="NotifyBySeller" scope="request" type="java.util.List<com.ute.onlineauction.beans.AuctionNotify>"/>


<t:main>
   <jsp:body>
      <div class="card-body ">
         <div class="row ">
            <table class="table table-striped table-info">

               <tbody>
               <c:forEach items="${NotifyBySeller}" var="t">
                  <tr>
                     <td>${t.proID}</td>
                     <td>
                        <c:if test="${t.status eq 2}">
                           <c:choose>
                              <c:when test="${AuthUser.permission eq 1 || AuthUser.permission eq 2}">
                                 <c:if test="${t.confirm eq 1}">
                                    <p>Bidder agree to pay</p>
                                 </c:if>
                                 <c:if test="${t.confirm eq 2}">
                                    <p>Bidder decline to pay</p>
                                 </c:if>
                              </c:when>
                           </c:choose>
                        </c:if>
                     </td>
                  </tr>
               </c:forEach>
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
                                 <c:if test="${c.confirm eq 1}">
                                    <p>Bidder agree to pay</p>
                                 </c:if>
                                 <c:if test="${c.confirm eq 2}">
                                    <p>Bidder decline to pay</p>
                                 </c:if>
                              </c:when>
                              <c:otherwise>
                                 <c:if test="${c.confirm eq 1}">
                                    You Agree to pay for this product
                                 </c:if>
                                 <c:if test="${c.confirm eq 2}">
                                    You decline to pay for this product
                                 </c:if>
                              </c:otherwise>
                           </c:choose>
                        </c:if>
                     </td>
                     <td>
                        <c:choose>
                           <c:when test="${c.status eq 2}">
                              <div>&nbsp;</div>
                           </c:when>
                           <c:otherwise>
                              <a class="btn btn-sm btn-outline-primary"
                                 href="${pageContext.request.contextPath}/admin/product/PayOrNot?ProID=${c.proID}&UserID=${AuthUser.id}&NotifyID=${c.ID}"
                                 role="button">
                                 <i class="fa fa-eye" aria-hidden="true"></i>&nbsp;See Detail
                              </a>
                           </c:otherwise>
                        </c:choose>
                     </td>
                  </tr>
               </c:forEach>
               </tbody>
            </table>
         </div>
      </div>


   </jsp:body>
</t:main>