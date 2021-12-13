<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <div class="d-flex inline">
                <c:forEach items="${products}" var="c">
                    <div class="card " style="width: 220px;">
                        <div class="card-body">
                            <h5 class="card-title">${c.proName}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${c.price}</h6>
                            <p class="card-text">${c.tinyDes}</p>
                            <a  class="btn btn-primary" href="#" role="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;Detail</a>
                            <a class="btn btn-success" href="#" role="button"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;Bid</a>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
        </div>
    </jsp:body>
</t:main>