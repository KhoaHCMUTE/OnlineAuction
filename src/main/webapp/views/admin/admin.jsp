<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Users" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>


<t:main>
    <c:if test="${AuthUser.permission == 1}">
    <jsp:body>
        <c:set var="STT" scope="session" value="${1}"/>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">UserName</th>
                <th scope="col">Permission</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Users}" var="c">
            <tr>
                <th scope="row">${c.id}</th>
                <td>${c.userName}</td>
                <td>
                    ${c.permission}
                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/account/upgrade?id=${c.id}" role="button">
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>
                </td>
                <c:set var="STT" scope="session" value="${STT+1}"/>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</c:if>
</t:main>