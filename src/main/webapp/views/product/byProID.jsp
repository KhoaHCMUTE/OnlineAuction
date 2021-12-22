<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>
<jsp:useBean id="newPrice" scope="request" type="com.ute.onlineauction.beans.Bidding"/>
<jsp:useBean id="comment" scope="request" type="java.util.List<com.ute.onlineauction.beans.CommentPro>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>

<t:main>
    <jsp:body>
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <h4>${product.proName}</h4>
                    <p>Description: ${product.fullDes}</p>
                    <p>Starting Price: ${product.price}</p>
                    <form action="" method="post">
                        <label for="ProID">ProID</label>
                        <input type="number" class="form-control" id="ProID" name="ProID" readonly value="${product.proID}">
                        <label for="UserID">UserID</label>
                        <input type="number" class="form-control" id="UserID" name="UserID" readonly value="${product.userID}">
                        <p>Current Price: ${newPrice.price}</p>
                        <label for="newprice">Enter Price for Bidding</label>
                        <input type="number" class="form-inline" id="newprice" name="NewPrice" autofocus>
                        <button type="submit" class="btn btn-outline-success btn-sm w-25" formaction="${pageContext.request.contextPath}/admin/product/addBid" role="button">Bid</button>
                        <br>
                        <input type="number" class="form-control" id="ComUserID" name="ComUserID" readonly value="${AuthUser.id}">
                        <label for="CommentID">Comment</label>
                        <input type="text" class="form-control" id="CommentID" name="comment">
                        <button type="submit" class="btn btn-outline-primary btn-sm w-25" formaction="${pageContext.request.contextPath}/admin/product/addCommentPro" role="button">Comment</button>
                        <div class="card">
                            <div class="card-body">
                                <c:forEach items="${comment}" var="c">
                                    <p>${c.text}</p>
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