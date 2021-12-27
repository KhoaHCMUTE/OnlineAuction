<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Users" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>


<t:main>
    <c:if test="${AuthUser.permission == 1}">
    <jsp:body>
        <c:set var="STT" scope="session" value="${1}"/>
        <table style="background-color: azure;)" class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">UserName</th>
                <th scope="col">Permission</th>
                <th scope="col">Upgrade</th>
            </tr>
            </thead>
            <tbody style="width: 400px">
            <c:forEach items="${Users}" var="c">
            <tr>
                <th scope="row">${c.id}</th>
                <td>${c.userName}</td>
                <td style="padding-left: 20px">
                    ${c.permission}
                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/account/upgrade?id=${c.id}" role="button">
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>
                </td>
                
                <td style="padding-left: 30px">
                    <c:if test="${c.permission <=1}">
                        <c:if test="${c.notify == 0}">
                            <a class="btn btn-sm btn-outline-primary" href="#" role="button">
                                <i class="fa fa-info-circle" aria-hidden="true"></i>
                            </a>
                        </c:if>
                        <c:if test="${c.notify >= 1}">
                            <a class="btn btn-sm btn btn-warning" href="#" role="button">
                                <i class="fa fa-info-circle" aria-hidden="true"></i>
                            </a>
                        </c:if>
                    </c:if>
                    <c:if test="${c.permission ==2}">
                            <a class="btn btn-sm btn btn-success" href="#" role="button">
                                <i class="fa fa-check" aria-hidden="true"></i>
                            </a>
                    </c:if>
                </td>
                <c:set var="STT" scope="session" value="${STT+1}"/>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</c:if>
</t:main>