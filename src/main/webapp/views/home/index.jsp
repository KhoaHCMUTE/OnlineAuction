<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Top5HighestPrice" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="HighestBidCount" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>

<t:main>
   <jsp:body>

         <div class="card-body">
            <div class="d-flex container-fluid">
               <div class="col-sm-3">
                  <div class="card ">
                     <div class="list-group " id="list-tab1" role="tablist">
                        <h4 class="list-group-item list-group-item-action list-group-item-info active " id="list-Top-list1"
                            data-bs-toggle="list"
                            href="#list-Top" role="tab" aria-controls="list-home">Top 5 Highest Price</h4>
                        <c:forEach items="${Top5HighestPrice}" var="c">
                           <a class="list-group-item list-group-item-action" id="list-A-list1" data-bs-toggle="list"
                              href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}"
                              role="tab"
                              aria-controls="list-profile">${c.proName}</a>
                        </c:forEach>

                     </div>
                  </div>
               </div>
               <div class="col-sm-3">
                  <div class="card">
                     <div class="list-group " id="list-tab2" role="tablist">
                        <h4 class="list-group-item list-group-item-action list-group-item-info active " id="list-Top-list2"
                            data-bs-toggle="list"
                            href="#list-Top" role="tab" aria-controls="list-home">Top 5 Famous Bid</h4>
                        <c:forEach items="${HighestBidCount}" var="b">
                           <c:forEach items="${Top5HighestPrice}" var="c">
                              <c:if test="${b.proID == c.proID}">
                                 <a class="list-group-item list-group-item-action" id="list-A-list1"
                                    data-bs-toggle="list"
                                    href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${b.proID}"
                                    role="tab"
                                    aria-controls="list-profile">${c.proName}</a>
                              </c:if>
                           </c:forEach>
                        </c:forEach>
                     </div>
                  </div>
               </div>
                               </div>
               </div>
            </div>
         </div>


   </jsp:body>

</t:main>