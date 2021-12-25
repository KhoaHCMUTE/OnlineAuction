<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="bidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="HighestBidCountByCat" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="HighestPriceByCat" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>

<t:main>
  <jsp:body>
    <div class="card-body">
      <c:choose>
        <c:when test="${product.size() == 0}">
          <div class="card-body">
            <p class="card-text">No Data.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <div class="container-fluid d-flex">
              <div class="col-sm-3">
                <div class="card">
                  <div class="list-group" id="list-tab1" role="tablist">
                    <h4 class="list-group-item list-group-item-action active" id="list-Top-list1" data-bs-toggle="list"
                        href="#list-Top" role="tab" aria-controls="list-home">Top 5 Highest Price</h4>
                    <c:forEach items="${HighestPriceByCat}" var="c">
                      <a class="list-group-item list-group-item-action" id="list-A-list1" data-bs-toggle="list"
                         href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}" role="tab"
                         aria-controls="list-profile">${c.proName}</a>
                    </c:forEach>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card">
                  <div class="list-group" id="list-tab2" role="tablist">
                    <h4 class="list-group-item list-group-item-action active" id="list-Top-list2" data-bs-toggle="list"
                        href="#list-Top" role="tab" aria-controls="list-home">Top 5 Famous Bid</h4>
                    <c:forEach items="${HighestBidCountByCat}" var="b">
                    <c:forEach items="${HighestPriceByCat}" var="c">
                      <c:if test="${b.proID == c.proID}">
                         <a class="list-group-item list-group-item-action" id="list-A-list1" data-bs-toggle="list"
                         href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${b.proID}" role="tab"
                         aria-controls="list-profile">${c.proName}</a>
                      </c:if>
                    </c:forEach>
                    </c:forEach>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="card">
                  <div class="list-group" id="list-tab3" role="tablist">
                    <h4 class="list-group-item list-group-item-action active" id="list-Top-list3" data-bs-toggle="list" href="#list-Top" role="tab" aria-controls="list-home">Top 5 Upcoming End</h4>
                    <a class="list-group-item list-group-item-action" id="list-A-list3" data-bs-toggle="list" href="#list-A" role="tab" aria-controls="list-profile">A</a>
                    <a class="list-group-item list-group-item-action" id="list-B-list3" data-bs-toggle="list" href="#list-B" role="tab" aria-controls="list-messages">B</a>
                    <a class="list-group-item list-group-item-action" id="list-C-list3" data-bs-toggle="list" href="#list-C" role="tab" aria-controls="list-settings">C</a>
                    <a class="list-group-item list-group-item-action" id="list-D-list3" data-bs-toggle="list" href="#list-D" role="tab" aria-controls="list-settings">D</a>
                    <a class="list-group-item list-group-item-action" id="list-E-list3" data-bs-toggle="list" href="#list-E" role="tab" aria-controls="list-settings">E</a>
                  </div>
                </div>
              </div>
            </div>
            <br/>
            <div class="row ">
              <c:forEach items="${product}" var="c">
                <div class="col-sm-4 mb-3 ">
                  <div class="card bg-light border border-dark">
                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.proID}/main.jpg" alt="${c.proName}"
                         title="${c.proName}" class="card-img-top">
                    <div class="card-body">
                      <a href="${pageContext.request.contextPath}/admin/product/byProID?ProId=${c.proID}" class="text-dark" style="font-size:25px; ">${c.proName}</a>
                      <c:set var = "Max" scope = "session" value = "${0}"/>
                      <c:forEach items="${bidding}" var="b">
                        <c:if test="${b.proID == c.proID}">
                          <c:if test="${Max < b.price}">
                            <c:set var = "Max" scope = "session" value = "${b.price}"/>
                          </c:if>
                        </c:if>
                      </c:forEach>
                      <h6 class="card-subtitle mb-2 text-dark" style="font-size:40px;">$ ${Max}</h6>
                      <c:choose>
                        <c:when test="${c.currentPrice != 0}">
                          <p class="card-text"><b>Buy Now Price:</b><p class="card-subtitle mb-2 text-dark" style="font-size:20px;"> $ ${c.currentPrice}</p></p>
                        </c:when>
                      </c:choose>
                      <c:set var = "Number" scope = "session" value = "${-1}"/>
                      <c:forEach items="${bidding}" var="b">
                        <c:if test="${b.proID == c.proID}">
                          <c:set var = "Number" scope = "session" value ="${Number+1}"/>
                        </c:if>
                      </c:forEach>
                      <c:choose>
                        <c:when test="${Number != 0}">
                          <p class="card-text"><b>Number Of Bids:</b> ${Number}</p>
                          <c:forEach items="${bidding}" var="b">
                            <c:forEach items="${user}" var="u">
                              <c:if test="${b.price == Max}">
                                <c:if test="${b.proID == c.proID}" >
                                  <c:if test="${u.id == b.userID}">
                                    <p><b>Name Bidder:</b> ${u.userName}</p>
                                  </c:if>
                                </c:if>
                              </c:if>
                            </c:forEach>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <p class="card-text"><b>No One Bid Yet</b></p>
                        </c:otherwise>
                      </c:choose>
                      <p class="card-text"><b>Start Day:</b> ${c.startDay}</p>
                      <p class="card-text">${c.tinyDes}</p>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
    <nav aria-label="Page navigation example a">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </jsp:body>
</t:main>