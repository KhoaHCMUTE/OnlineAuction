<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categories" scope="request"  type="java.util.List<com.ute.onlineauction.beans.Category>"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Product Type</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categories}" var="c">
                <tr>
                    <th scope="row">${c.catID}</th>
                    <td>${c.catName}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </jsp:body>

</t:main>