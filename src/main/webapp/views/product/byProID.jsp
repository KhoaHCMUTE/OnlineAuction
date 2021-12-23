<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>
<jsp:useBean id="listbidding" scope="request" type="java.util.List<com.ute.onlineauction.beans.Bidding>"/>
<jsp:useBean id="comment" scope="request" type="java.util.List<com.ute.onlineauction.beans.CommentPro>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <h4>${product.proName}</h4>
                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg" alt="${product.proName}" title="${product.proName}" >
                    <p>Description: ${product.fullDes}</p>
                    <p>Starting Price: ${product.price} (${product.priceDifference})</p>
                    <form action="" method="post">
                        <c:set var = "Max" scope = "session" value = "${0}"/>
                        <c:forEach items="${listbidding}" var="b">
                            <c:if test="${b.proID == product.proID}">
                            <c:if test="${Max < b.price}">
                                <c:set var = "Max" scope = "session" value = "${b.price}"/>
                            </c:if>
                            </c:if>
                        </c:forEach>
                        <p>Current Price: ${Max}</p>
                        <input type="hidden" class="form-control" id="Price" name="Price" readonly value="${Max}">
                        <c:forEach items="${listbidding}" var="b">
                            <c:forEach items="${user}" var="u">
                                <c:if test="${b.price == Max}">
                                      <c:if test="${b.proID == product.proID}">
                                            <c:if test="${u.id == b.userID}">
                                              <p>Name Bidder: ${u.userName}</p>
                                            </c:if>
                                     </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <c:set var = "InSeller" scope = "session" value = "${0}"/>
                        <c:forEach items="${listbidding}" var="b">
                            <c:forEach items="${user}" var="u">
                                <c:if test="${b.proID == product.proID}">
                                    <c:if test="${u.id == b.sellerID}">
                                        <c:if test="${InSeller == 0}">
                                        <p>Name Seller: ${u.userName}</p>
                                            <input type="hidden" class="form-control" id="SellerID" name="SellerID" readonly value="${u.id}">
                                        <c:set var = "InSeller" scope = "session" value = "${1}"/>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <p>Auction History</p>
                        <c:forEach items="${listbidding}" var="b">
                        <c:forEach items="${user}" var="u">
                            <c:if test="${b.proID == product.proID}">
                            <c:if test="${u.id == b.userID}">
                                <p>Name Bidder: ${u.userName} - Price: ${b.price}</p>
                            </c:if>
                            </c:if>
                        </c:forEach>
                        </c:forEach>
                        <input type="hidden" class="form-control" id="ProID" name="ProID" readonly value="${product.proID}">
                        <input type="hidden" class="form-control" id="UserID" name="UserID" readonly value="${AuthUser.id}">
                        <input type="hidden" class="form-control" id="PriceDifference" name="PriceDifference" readonly value="${product.priceDifference}">
                        <label for="NewPrice">Enter Price for Bidding</label>
                        <input type="number" class="form-inline" id="NewPrice" name="NewPrice"  autofocus>
                        <button type="submit" class="btn btn-outline-success btn-sm w-25" formaction="${pageContext.request.contextPath}/admin/product/addBid" role="button">Bid</button>
                        <br>
                        <br>
                        <label for="CommentID">Comment</label>
                        <input type="text" class="form-control" id="CommentID" name="comment">
                        <button type="submit" class="btn btn-outline-primary btn-sm w-25" formaction="${pageContext.request.contextPath}/admin/product/addCommentPro" role="button">Comment</button>
                        <div class="card">
                            <div class="card-body">
                                <c:forEach items="${comment}" var="c">
                                <c:forEach items="${user}" var="u">
                                    <c:choose>
                                        <c:when test="${c.userID == u.id}">
                                    <p>User Name:${u.userName}</p>
                                    <p>Comment:${c.text}</p>
                                    </br>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                </c:forEach>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <form action="" method="post">
            </form>
        </div>
    </jsp:body>

</t:main>