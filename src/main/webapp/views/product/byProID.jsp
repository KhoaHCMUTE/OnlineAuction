<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="product" scope="request" type="com.ute.onlineauction.beans.Product"/>

<t:main>
    <jsp:body>
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <h4>${product.proName}</h4>
                    <p>${product.fullDes}</p>
                    <p>${product.price}</p>
                </div>
            </div>

            <form action="" method="post">
            </form>
        </div>
    </jsp:body>

</t:main>